// Copyright (c) 2022 Tudlang
// 
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:io';

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:salita/settings.dart';
import 'package:salita/src/data/wiktionary.dart';
import '/opensource/adaptive.dart';
import '../../../main.dart';
import '../../../strings.g.dart';
import '/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/entry.dart';
import '/opensource/bordertabindicator.dart';
import '/utils/functions.dart';
import 'dict_language_fragment.dart';

class DictionaryFragment extends StatefulWidget {
  const DictionaryFragment({
    Key? key,
    required this.entry,
    this.heading,
    required this.isOnline,
  }) : super(key: key);
  final Entry entry;
  final String? heading;
  final bool isOnline;
  @override
  State<DictionaryFragment> createState() => _DictionaryFragmentState();
}

class _DictionaryFragmentState extends State<DictionaryFragment>
    with SingleTickerProviderStateMixin {
  late TabController _tabTabController;
  late ScrollController _listScrollController;
  late int _index;
  bool _hasSnackbarShown = false;

  @override
  void initState() {
    super.initState();

    // automatically direct to the specified heading, if any
    _index =
        widget.entry.languages.indexWhere((e) => e.language == widget.heading);

    _tabTabController = TabController(
      initialIndex: _index == -1 ? 0 : _index + 1,
      vsync: this,
      length: widget.entry.languages.length + 1,
    );

    _tabTabController.addListener(() {
      setState(() {
        _index = _tabTabController.index;
      });
      
    });

    _listScrollController = ScrollController();

    _hasSnackbarShown = false;
  }

  @override
  void dispose() {
    _tabTabController.dispose();
    _listScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_index == -1 &&
          widget.heading?.isNotEmpty == true &&
          !_hasSnackbarShown) {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(strings.definitionDictionary.snackbar
                .headingNotExist(language: widget.heading!)),
          ));
      }
      _hasSnackbarShown = true;
    });
    return !isPlatformDesktop() &&
            getWindowType(context) == AdaptiveWindowType.xsmall
        ? Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Material(
                  elevation: getWindowType(context) == AdaptiveWindowType.xsmall
                      ? 4
                      : 0,
                  //decoration: BoxDecoration(
                  //  border: Border.all(
                  //      width: 0, color: Theme.of(context).primaryColor),
                  //),
                  color: Theme.of(context).primaryColor,
                  child: TabBar(
                    controller: _tabTabController,
                    onTap: (index) {
                      setState(() {
                        _index = index;
                      });
                    },
                    padding: const EdgeInsets.all(4),
                    splashBorderRadius:
                        const BorderRadius.all(Radius.circular(56)),
                    indicator: const BorderTabIndicator(
                      indicatorHeight: 32,
                      textScaleFactor: 3,
                    ),
                    isScrollable: true,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: Icon(Icons.info_outlined),
                            ),
                            Text(strings.definitionDictionary.overview.name)
                          ],
                        ),
                      ),
                      for (final i in widget.entry.languages)
                        Tab(text: i.language),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabTabController,
                  children: [
                    DictionaryOverviewFragment(
                      entry: widget.entry,
                      tabController: _tabTabController,
                      isOnline: widget.isOnline,
                    ),
                    for (final i in widget.entry.languages)
                      //SelectableText(i.heading3)
                      DictionaryLanguageFragment(
                        entry: i,
                        isOnline: widget.isOnline,
                      )
                  ],
                ),
              ),
            ],
          )
        : Row(
            children: [
              Container(
                color: Colors.transparent,
                constraints: BoxConstraints(
                  //maxWidth: isDisplayDesktop(context) || isPlatformDesktop()
                  //    ? 230
                  //    : 150,
                  maxWidth: 230,
                ),
                child: Scrollbar(
                  controller: _listScrollController,
                  thumbVisibility: true,
                  child: ListView(
                    controller: _listScrollController,
                    children: [
                      ListTile(
                        minLeadingWidth: 20,
                        selected: _tabTabController.index == 0,
                        title: Text(strings.definitionDictionary.overview.name),
                        style: isDisplayDesktop(context)
                            ? ListTileStyle.drawer
                            : ListTileStyle.list,
                        dense: true,
                        leading: isPlatformDesktop() ||
                                getWindowType(context) >=
                                    AdaptiveWindowType.small
                            ? const Icon(Icons.info_outlined)
                            : null,
                        onTap: () {
                          setState(() {
                            _tabTabController.index = 0;
                            _index = 0;
                          });
                        },
                        trailing: _tabTabController.index == 0
                            ? const Icon(Icons.arrow_forward_ios_outlined)
                            : null,
                      ),
                      const Divider(height: 1),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'LANGUAGES',
                          style: Theme.of(context).textTheme.overline,
                        ),
                      ),
                      for (var i = 0; i < widget.entry.languages.length; i++)
                        ListTile(
                          selected: _tabTabController.index == i + 1,
                          style: isDisplayDesktop(context)
                              ? ListTileStyle.drawer
                              : ListTileStyle.list,
                          dense: true,
                          title: Text(widget.entry.languages[i].language),
                          leading:
                              isDisplayDesktop(context) || isPlatformDesktop()
                                  ? Text(
                                      (i + 1).toString(),
                                    )
                                  : null,
                          onTap: () {
                            setState(() {
                              _tabTabController.index = i + 1;
                              _index = i + 1;
                            });
                          },
                          trailing: _tabTabController.index == i + 1
                              ? const Icon(Icons.arrow_forward_ios_outlined)
                              : null,
                          minLeadingWidth: 20,
                        ),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: PageTransitionSwitcher(
                  reverse: false,
                  transitionBuilder:
                      (child, primaryAnimation, secondaryAnimation) {
                    return SharedAxisTransition(
                      fillColor: Colors.transparent,
                      animation: primaryAnimation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.vertical,
                      child: child,
                    );
                  },
                  child: _tabTabController.index > 0
                      ? Align(
                          alignment: Alignment.topLeft,
                          child: DictionaryLanguageFragment(
                            key: ValueKey(widget
                                .entry.languages[_tabTabController.index - 1]),
                            entry: widget
                                .entry.languages[_tabTabController.index - 1],
                            isOnline: widget.isOnline,
                          ),
                        )
                      : DictionaryOverviewFragment(
                          entry: widget.entry,
                          tabController: _tabTabController,
                          isOnline: widget.isOnline,
                          showLanguages: false,
                        ),
                ),
              ),
            ],
          );
  }
}

class DictionaryOverviewFragment extends StatefulWidget {
  const DictionaryOverviewFragment({
    Key? key,
    required this.entry,
    required this.tabController,
    required this.isOnline,
    this.showLanguages = true,
  }) : super(key: key);
  final Entry entry;
  final TabController tabController;
  final bool isOnline;
  final bool showLanguages;

  @override
  State<DictionaryOverviewFragment> createState() =>
      _DictionaryOverviewFragmentState();
}

class _DictionaryOverviewFragmentState
    extends State<DictionaryOverviewFragment> {
  @override
  Widget build(BuildContext context) {
    int temp = 0;
    final sourceWiktionary = SourceWiktionary.fromSettings();

    return Scrollbar(
      thumbVisibility: true,
      child: ListView(
        children: [
          if (widget.entry.seealso.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                strings.definitionDictionary.overview.seealso,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          // SEE ALSO
          if (widget.entry.seealso.isNotEmpty)
            Wrap(
              children: [
                for (final i in widget.entry.seealso)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ActionChip(
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .merge(textstyle),
                      label: Text(i.text),
                      onPressed: () {
                        i.go(context, isOnline: widget.isOnline);
                      },
                    ),
                  ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              strings.definitionDictionary.overview.languages.name,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
if (getSettings('definition', 'overviewLanguagesListing')=='card')
          Wrap(
            children: [
              for (final i in widget.entry.languages)
                Container(
                  width: 400,
                  constraints: BoxConstraints(
                    //maxHeight: 200,
                    //maxWidth: 300,
                  ),
                  child: Card(
                    child: InkWell(
                      onTap: (){
                         widget.tabController
                          .animateTo(widget.entry.languages.indexOf(i) + 1);
                          widget.tabController.notifyListeners();
                        
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text((++temp).toString()),
                                SizedBox(width: 8),
                                Text(
                                  i.language,
                                  style: Theme.of(context).textTheme.headline6,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Text(
                              sourceWiktionary.getOverviewExerpt(i).trim(),
                              overflow: TextOverflow.fade,
                              maxLines: 6,
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (getSettings('definition', 'overviewLanguagesListing') == 'list')
            for (final i in widget.entry.languages)
              ListTile(
                leading: Text((++temp).toString()),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    //PopupMenuItem(
                    //  onTap: () {
                    //    RichClipboard.setData(RichClipboardData(
                    //      html: i.html,
                    //      text: i.html.htmlTryText(),
                    //    )).then((_) {
                    //      ScaffoldMessenger.of(context)
                    //        ..clearSnackBars()
                    //        ..showSnackBar(
                    //          SnackBar(
                    //            behavior: SnackBarBehavior.floating,
                    //            content: Text(
                    //              'Copied to clipboard. You may paste it to a word processor like Microsoft Word.',
                    //            ),
                    //          ),
                    //        );
                    //    });
                    //  },
                    //  child: Text('Copy as formatted text'),
                    //),
                    PopupMenuItem(
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                          text: i.html.htmlTryText(),
                        )).then((_) {
                          ScaffoldMessenger.of(context)
                            ..clearSnackBars()
                            ..showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  'Copied to clipboard',
                                ),
                              ),
                            );
                        });
                      },
                      child: Text('Copy as plain text'),
                    ),
                  ],
                ),
                title: Text(i.language),
                subtitle: Text(
                              sourceWiktionary.getOverviewExerpt(i),
                              overflow: TextOverflow.fade,
                              maxLines: 6,
                              style: Theme.of(context).textTheme.caption,
                            ),
                //subtitle: Text("${i.heading3.length/1000} kB"),
                onTap: () {
                  widget.tabController
                      .animateTo(widget.entry.languages.indexOf(i) + 1);
                },
              ),
          if (getSettings('definition', 'editMode'))
            ListTile(
              title: OutlinedButton(
                onPressed: () {
                  showUnsupportedSnackbar(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(Icons.edit_outlined),
                    ),
                    Text('Suggest an edit'),
                  ],
                ),
              ),
            ),
          const Divider(
            indent: 8,
            endIndent: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              strings.definitionDictionary.overview.information.name,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          ListTile(
            style: ListTileStyle.drawer,
            leading: const Icon(Icons.calendar_month_outlined),
            title: Text(strings
                .definitionDictionary.overview.information.dateRetrieved),
            subtitle: SelectableText(
              widget.entry.date.toString(),
            ),
          ),
          ListTile(
            style: ListTileStyle.drawer,
            leading: const Icon(Icons.title_outlined),
            title: Text(
                strings.definitionDictionary.overview.information.wikititle),
            subtitle: SelectableText(
              widget.entry.wikititle,
            ),
            trailing: IconButton(
              tooltip: strings.general.tooltip.openInBrowser,
              icon: const Icon(Icons.open_in_browser_outlined),
              onPressed: () {
                launchUrl(widget.entry.toUri(),
                    mode: LaunchMode.externalApplication);
              },
            ),
          ),
          if (getSettings('definition', 'overviewShowIdPage'))
            ListTile(
              style: ListTileStyle.drawer,
              leading: const Icon(Icons.description_outlined),
              title: Text(
                  strings.definitionDictionary.overview.information.idPage),
              subtitle: SelectableText(
                widget.entry.pageid.toString(),
              ),
            ),
          if (getSettings('definition', 'overviewShowIdRevision'))
            ListTile(
              style: ListTileStyle.drawer,
              leading: const Icon(Icons.edit_note_outlined),
              title: Text(
                  strings.definitionDictionary.overview.information.idRevision),
              subtitle: SelectableText(
                widget.entry.revid.toString(),
              ),
            ),
          if (widget.entry.wotd != null)
            ListTile(
              style: ListTileStyle.drawer,
              leading: const Icon(Icons.generating_tokens_outlined),
              title:
                  Text(strings.definitionDictionary.overview.information.wotd),
              subtitle: SelectableText(
                widget.entry.wotd.toString().substring(0, 10),
              ),
            ),
          if (widget.entry.redirect != null)
            ListTile(
              style: ListTileStyle.drawer,
              leading: const Icon(Icons.subdirectory_arrow_right_outlined),
              title: Text(
                  strings.definitionDictionary.overview.information.redirect),
              subtitle: SelectableText(widget.entry.redirect!),
            ),
          const Divider(
            indent: 8,
            endIndent: 8,
          ),
          ListTile(
            dense: true,
            style: ListTileStyle.drawer,
            trailing: const Icon(MdiIcons.license),
            //title: Text('License'),
            subtitle: SelectableText(
                'Entry text is dual-licensed under both the Creative Commons Attribution-ShareAlike 3.0 Unported License (CC-BY-SA) and the GNU Free Documentation License (GFDL).'),
          ),
        ],
      ),
    );
  }
}
