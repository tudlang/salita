// Copyright (c) 2022 Tudlang
// 
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:collection';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:salita/utils/functions.dart';
import '../data/namespace.dart';
import '../data/wiktionary.dart';
import '../io/connection.dart';
import '/strings.g.dart';
import '../data/entry.dart';
import '/utils/extensions.dart';

class DefinitionSearchDelegate extends SearchDelegate<EntryLink> {
  DefinitionSearchDelegate({
    this.mode = const NamespaceDictionary(),
    this.isOnline = true,
  });

  Namespace mode;
  List<EntryLink?> list = [];

  final scrollController = ScrollController();
  String? contine;
  bool isOnline;

  @override
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
        border: UnderlineInputBorder(),
      );

  @override
  PreferredSizeWidget? buildBottom(BuildContext context) {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: StatefulBuilder(
        builder: (context, setState) {
          final source = SourceWiktionary.fromSettings();
          return AppBar(
            elevation: 1,
            primary: false,
            automaticallyImplyLeading: false,
            title: DropdownButton<Namespace>(
              isExpanded: true,
              value: mode,
              items: [
                DropdownMenuItem(
                  enabled: false,
                  child: ListTile(
                    title: Text(
                      'Definition modes for ${source.name}'.toUpperCase(),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..clearSnackBars()
                          ..showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'These are the modes supported for your selected definition language, ${source.name}.',
                            ),
                          ));
                      },
                      icon: const Icon(Icons.info_outline),
                    ),
                  ),
                ),
                for (final i in source.namespaces)
                  DropdownMenuItem(
                    value: i,
                    child: ListTile(
                      selected: mode == i,
                      leading: Icon(i.icon),
                      title: Text(i.nameLocalized),
                      minLeadingWidth: 20,
                    ),
                  )
              ],
              onChanged: (value) {
                setState(() {
                  mode = value ?? mode;
                });
                //to trigger a search again
                query = query;
              },
              onTap: () {},
            ),
            actions: [
              IconButton(
                tooltip: isOnline ? 'Online mode' : 'Offline mode',
                onPressed: kIsWeb
                    ? null
                    : () {
                        showUnsupportedSnackbar(context);
                        // setState(() {
                        //   isOnline = !isOnline;
                        // });
                        // ScaffoldMessenger.of(context)
                        //   ..clearSnackBars()
                        //   ..showSnackBar(SnackBar(
                        //     content: Text(
                        //       isOnline
                        //           ? 'Searching in online mode'
                        //           : 'Searching in offline mode',
                        //     ),
                        //     behavior: SnackBarBehavior.floating,
                        //   ));
                        // //to trigger a search again
                        // query = query;
                      },
                icon: Icon(
                  isOnline ? Icons.cloud_outlined : Icons.cloud_off_outlined,
                ),
              )
            ],
          );
        },
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          tooltip: 'Clear search',
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close_outlined),
        )
    ];
  }

  @override
  void close(BuildContext context, result) {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    result.go(
      context,
      isOnline: isOnline,
    );
    super.close(context, result);
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        ScaffoldMessenger.of(context).clearMaterialBanners();
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // check if there is an exact match, if so then go to it
    final exact = list.firstWhere((element) => element?.wikititle == query,
        orElse: () => null);
    if (exact != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        close(context, exact);
      });
    }

    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // clear previous entries
    list.clear();

    ScaffoldMessenger.of(context).clearMaterialBanners();

    for (final e in SourceWiktionary.fromSettings().namespaces) {
      if (query.toLowerCase().startsWith(e.namespaceName.toLowerCase()) ||
          (e.namespaceAlias.isNotEmpty &&
              e.namespaceAlias.any((element) =>
                  query.toLowerCase().startsWith(element.toLowerCase())))) {
        query = query.replaceAll(
          RegExp(RegExp.escape(e.namespaceName), caseSensitive: false),
          '',
        );
        for (final element in e.namespaceAlias) {
          if (query.toLowerCase().startsWith(element.toLowerCase())) {
            query = query.replaceAll(
              RegExp(RegExp.escape(element), caseSensitive: false),
              '',
            );
          }
        }
        mode = e;
        break;
      }
    }

    if (query.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/definition_search_type.svg',
              width: 200,
              height: 200,
            ),
            Text(
              'Type something...',
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      );
    }

    return FutureBuilder<List<EntryLink?>>(
      future: EntryConnection.getEntryLinksFromWikititle(
          wikititle: query, isOnline: isOnline, namespaceId: mode.namespaceId),
      builder: (context, snapshot) {
        bool isLoading = false;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.data != null) {
              list.addAll(snapshot.data!);
              //anti-duplicate
              final Set temp = {};
              list.retainWhere((x) => temp.add(x?.wikititle));
              temp.clear();

              final exact = list.singleWhere(
                (element) => element?.wikititle == query.trim(),
                orElse: () => null,
              );
              if (exact == null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context)
                      .showMaterialBanner(MaterialBanner(
                    content: Text(
                      strings.definition.snackbar.entryNotExist(title: query),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(Icons.info_outline),
                    actions: [
                      Container(),
                      //TextButton(onPressed: () {}, child: Text('Suggest'))
                    ],
                  ));
                });
              }

              if (list.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/definition_search_none.svg',
                        width: 200,
                        height: 200,
                      ),
                      Text(
                        "No results found",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: OutlinedButton(
                          onPressed: () {
                            query = query;
                          },
                          child: Text('Retry'),
                        ),
                      )
                    ],
                  ),
                );
              }

              return StatefulBuilder(
                builder: (context, setState) {
                  return Scrollbar(
                    thumbVisibility: true,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        if (list[index] == null) {
                          return ListTile(
                            title: Center(
                              child: isLoading
                                  ? const CircularProgressIndicator()
                                  : OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        EntryConnection
                                            .getEntryLinksFromWikititle(
                                          wikititle: query,
                                          isOnline: isOnline,
                                          offset: list.length - 1,
                                          namespaceId: mode.namespaceId,
                                        ).then((value) {
                                          setState(() {
                                            isLoading = false;
                                            list
                                              ..remove(null)
                                              ..addAll(value);
                                          });
                                        });
                                      },
                                      child: Text('Load more'),
                                    ),
                            ),
                          );
                        }
                        return ListTile(
                          leading: Text((index + 1).toString()),
                          title: Text(
                            mode.removePrefix(list[index]!.text),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                  fontWeight:
                                      mode.removePrefix(list[index]!.text) ==
                                              query
                                          ? FontWeight.bold
                                          : null,
                                ),
                          ),
                          onTap: () {
                            close(context, list[index]!);
                          },
                        );
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.error is SocketException) {
              //Refresh if SocketException
              WidgetsBinding.instance.addPostFrameCallback((_) {
                query = query;
              });
              return Container();
            }
            return Text('${snapshot.error}\n${snapshot.stackTrace}');
        }
      },
    );
  }
}

class DefinitionSearchField extends StatefulWidget {
  const DefinitionSearchField({
    super.key,
    this.isOnline = true,
    required this.isAppbar,
  });

  final bool isOnline;
  final bool isAppbar;

  @override
  State<DefinitionSearchField> createState() => _DefinitionSearchFieldState();
}

class _DefinitionSearchFieldState extends State<DefinitionSearchField> {
  Namespace mode = NamespaceDictionary();

  late bool isLoading;
  Iterable<EntryLink>? results;
  late final FocusNode focusNode;
  late final TextEditingController controllerText;
  late final ScrollController controllerScroll;

  bool get entryNotFound {
    if (controllerText.text.isEmpty ||
        (results?.isEmpty != true && results?.tryFirst?.wikititle == null)) {
      return false;
    }
    if (results?.tryFirst?.wikititle != controllerText.text ||
        results?.isEmpty == true) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    // auto-remove query when out of focus
    //focusNode.addListener(() {
    //  if (!focusNode.hasFocus){
    //    controllerText.text='';
    //  }
    //});
    isLoading = false;
    //results = [];
    controllerText = TextEditingController()..addListener(() {});

    controllerScroll = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    controllerText.dispose();
    controllerScroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context2, constraints) {
      return RawAutocomplete<EntryLink>(
        focusNode: focusNode,
        textEditingController: controllerText,
        optionsViewBuilder: (context3, onSelected, options) {
          //if (isLoading) return CircularProgressIndicator();
          if (controllerText.text.isEmpty) return Container();
          return StatefulBuilder(builder: (context4, setState2) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 8,
                child: results == null
                    ? SizedBox(
                        height: 66,
                        width: constraints.maxWidth,
                        child: ListTile(
                          title: Center(child: CircularProgressIndicator()),
                        ),
                      )
                    : ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: () {
                            // the height of the device minus the space took up by the widget
                            // aka the height remaining at the bottom
                            final heightDevice =
                                MediaQuery.of(context).size.height -
                                    kToolbarHeight;
                            // the total height of the list items
                            final double heightMax = (options.length + 1) * 48;
                            return heightDevice >= heightMax
                                ? heightMax
                                : heightDevice;
                          }(),
                          maxWidth: constraints.maxWidth,
                        ),
                        child: Scrollbar(
                          controller: controllerScroll,
                          thumbVisibility: true,
                          child: ListView.builder(
                            itemCount: options.length,
                            shrinkWrap: true,
                            primary: false,
                            controller: controllerScroll,
                            itemBuilder: (context5, index) {
                              /* if (options.elementAt(index) == null) {
                          return ListTile(
                            title: Center(
                              child: isLoading
                                  ? const CircularProgressIndicator()
                                  : OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        EntryConnection
                                            .getEntryLinksFromWikititle(
                                          wikititle: controllerText.text,
                                          isOnline: widget.isOnline,
                                          offset: options.length - 1,
                                          namespaceId: mode.namespaceId,
                                        ).then((value) {
                                          setState(() {
                                            isLoading = false;
                                            options.toList()
                                              ..remove(null)
                                              ..addAll(value);
                                          });
                                        });
                                      },
                                      child: Text('Load more'),
                                    ),
                            ),
                          );
                        } */
                              return ListTile(
                                //dense: !widget.isAppbar,
                                minLeadingWidth: 25,
                                // leading: Text((index + 1).toString()),
                                title: Text(options.elementAt(index).wikititle),
                                onTap: () {
                                  onSelected(options.elementAt(index));
                                },
                              );
                            },
                          ),
                        ),
                      ),
              ),
            );
          });
        },
        onSelected: (option) {
          print(option);
          option.go(context, isOnline: widget.isOnline);
          focusNode.unfocus();
        },
        displayStringForOption: (option) {
          return '';
        },
        optionsBuilder: (value) async {
          if (value.text.isEmpty) return [];

          var result = await EntryConnection.getEntryLinksFromWikititle(
            wikititle: value.text,
            isOnline: widget.isOnline,
            namespaceId: mode.namespaceId,
          );

          var a = (result..remove(null)).cast<EntryLink>();
          setState(() {
            results = a;
          });
          return a;
        },
        fieldViewBuilder:
            (contex3, textEditingController, focusNode, onFieldSubmitted) {
          return Padding(
            padding: const EdgeInsets.all(0),
            child: TextField(
              maxLines: 1,
              controller: textEditingController,
              onChanged: (value) {
                setState(() {
                  results = null;
                });
              },
              focusNode: focusNode,
              onSubmitted: (value) {
                onFieldSubmitted();
              },
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Theme.of(context).iconTheme.color,
                  ),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hintText: 'Search',
                  hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color:
                            widget.isAppbar ? Colors.black87 : Colors.black38,
                      ),
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: Colors.black38,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white.withOpacity(0.2)
                      : Colors.grey.shade300,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.cloud_outlined),
                  ),
                  errorText: !widget.isAppbar && entryNotFound
                      ? 'Entry not found'
                      : null,
                  prefixIconColor: Colors.black54,
                  border: InputBorder.none
                  //errorBorder: const OutlineInputBorder(
                  //  borderSide: BorderSide(color: Colors.red),
                  //),
                  //enabledBorder: OutlineInputBorder(
                  //  borderSide: BorderSide(
                  //      color: widget.isAppbar ? Colors.white : Colors.black38),
                  //),
                  //focusedBorder: OutlineInputBorder(
                  //  borderSide: BorderSide(
                  //      color: widget.isAppbar ? Colors.white : Colors.black38),
                  //),
                  //disabledBorder: const OutlineInputBorder(
                  //  borderSide: BorderSide(color: Colors.black38),
                  //),
                  ),
            ),
          );
        },
      );
    });
  }
}
