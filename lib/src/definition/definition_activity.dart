// Copyright (c) 2022 Tudlang
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:io';

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:html/dom.dart' as dom;
import 'package:go_router/go_router.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:salita/env.dart';
import 'package:salita/settings.dart';
import 'package:salita/utils/functions.dart';
import '/opensource/adaptive.dart';
import '/strings.g.dart';
import '../data/namespace.dart';
import '../drawer.dart';
import '/utils/extensions.dart';

import '../data/entry.dart';
import '../io/connection.dart';
import '../../main.dart';
import 'definition_search.dart';
import 'dictionary/dict_fragment.dart';

class DefinitionActivity extends StatefulWidget {
  DefinitionActivity({
    super.key,
    required this.title,
    required this.mode,
    this.redirect,
    this.heading,
  });

  DefinitionActivity.web({
    super.key,
    required this.title,
    required this.mode,
    this.redirect,
    this.heading,
  });

  String title;
  final Namespace mode;
  final String? redirect;
  String? heading;

  @override
  State<DefinitionActivity> createState() => _DefinitionActivityState();
}

class _DefinitionActivityState extends State<DefinitionActivity> {
  late GlobalKey _titleKey;
  BannerAd? definitionAdBanner;

  Entry? cache;

  @override
  void initState() {
    super.initState();
    _titleKey = GlobalKey();
    definitionAdBanner = !kIsWeb && (Platform.isAndroid || Platform.isIOS)
        ? BannerAd(
            size: AdSize.banner,
            adUnitId: Platform.isAndroid
                ? Configuration.current.keyAdAndroidDefinition
                : Configuration.current.keyAdIosDefinition,
            listener: BannerAdListener(
              onAdFailedToLoad: (ad, error) {
                debugPrint(error.toString());
                ad.dispose();
                setState(() {
                  definitionAdBanner = null;
                });
              },
            ),
            request: AdRequest(
              keywords: (getSettings('ads', 'adrequestAddKeywords'))
                  ? [
                      widget.title,
                      widget.mode.namespaceName,
                    ]
                  : null,
              nonPersonalizedAds: !getSettings('ads', 'cmpHasConsent'),
              httpTimeoutMillis:
                  getSettings('ads', 'adrequestHttpTimeout') * 1000,
            ),
          )
        : null;
    definitionAdBanner?.load();
  }

  @override
  void dispose() {
    super.dispose();
    definitionAdBanner?.dispose();
    cache = null;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //(_titleKey.currentState! as _DefinitionTitleState).title = widget.title;
    });

    return ScaffoldAdaptive(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: widget.mode.nameLocalized,
      appBar: AppBar(
        elevation: 0,
        title: !kIsWeb //&& Platform.isWindows
            ? null
            : Text(widget.mode.nameLocalized),
        actions: [
          if (isPlatformDesktop() || isDisplayDesktop(context))
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: DefinitionSearchField(isAppbar: true),
            )
          else
            IconButton(
              tooltip: strings.general.tooltip.search,
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DefinitionSearchDelegate(
                    mode: widget.mode,
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                //color: Theme.of(context).iconTheme.color,
              ),
            ),
          IconButton(
            tooltip: strings.general.tooltip.refresh,
            onPressed: () {
              GoRouter.of(context).refresh();
              cache = null;
            },
            icon: Icon(
              Icons.refresh,
              color: isPlatformDesktop()
                  ? Theme.of(context).iconTheme.color
                  : null,
            ),
          ),
        ],
      ),
      bottomNavigationBar: definitionAdBanner == null
          ? null
          : Container(
              color: Colors.transparent,
              width: definitionAdBanner!.size.width.toDouble(),
              height: definitionAdBanner!.size.height.toDouble(),
              child: AdWidget(
                ad: definitionAdBanner!,
              ),
            ),
      body: Column(
        children: [
          const Divider(height: 1),
          Material(
            //decoration: BoxDecoration(
            //  border:
            //      Border.all(width: 0, color: Theme.of(context).primaryColor),
            //  color: Theme.of(context).primaryColor,
            //),
            //padding: const EdgeInsets.all(8.0),
            color: Theme.of(context).primaryColor,
            elevation: 4,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: DefinitionTitle(
                        key: _titleKey,
                        title: widget.title,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  color: Colors.grey.shade500,
                  tooltip: 'Copy title',
                  onPressed: () {
                    final title =
                        (_titleKey.currentState! as _DefinitionTitleState)
                            .title;
                    Clipboard.setData(ClipboardData(text: title)).then((_) {
                      ScaffoldMessenger.of(context)
                        ..clearSnackBars()
                        ..showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              strings.general.snackbar
                                  .copyToClipboard(message: title),
                              softWrap: true,
                            ),
                          ),
                        );
                    });
                  },
                  icon: const Icon(Icons.copy_outlined),
                ),
                //IconButton(
                //  color: Colors.grey.shade500,
                //  onPressed: () {
                //    // TODO ADD BOOKMARKS
                //    showUnsupportedSnackbar(context);
                //  },
                //  icon: const Icon(Icons.bookmark_border_outlined),
                //),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<Entry>(
              initialData: cache,
              future: cache != null
                  ? null
                  : EntryConnection.getEntryFromWikititle(
                      context: context,
                      wikititle: widget.title,
                      redirectFrom: widget.redirect,
                    ),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.none:
                  case ConnectionState.done:
                    if (snapshot.data != null) {
                      cache = snapshot.data!;

                      // change title to the loaded title
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        (_titleKey.currentState! as _DefinitionTitleState)
                                .title =
                            widget.mode.removePrefix(snapshot.data!.title);
                      });
                      return DictionaryFragment(
                        entry: snapshot.data!,
                        heading: widget.heading,
                      );
                    } else if (snapshot.error is NoTitleExeption) {
                      return Text("The page you specified doesn't exist.");
                    } else if (snapshot.error is RedirectExeption) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        (snapshot.error as RedirectExeption).link.go(
                          context,
                          extra: {
                            'redirect': widget.title,
                          },
                        );
                      });
                    } else if (snapshot.error is SocketException) {
                      //Refresh if SocketException
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        GoRouter.of(context).refresh();
                      });
                    }
                    return Text('${snapshot.error}\n${snapshot.stackTrace}');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DefinitionTitle extends StatefulWidget {
  const DefinitionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<DefinitionTitle> createState() => _DefinitionTitleState();
}

class _DefinitionTitleState extends State<DefinitionTitle> {
  late String _title;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
  }

  String get title => _title;

  set title(String newTitle) {
    debugPrint('NEW TITLE: $newTitle');
    setState(() {
      _title = newTitle;
    });
  }

  bool hasTextOverflow(
    String text,
    TextStyle style, {
    double minWidth = 0,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);

    return textPainter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context)
        .textTheme
        .headline3!
        .merge(textstyle)
        .copyWith(color: Colors.white, inherit: true);

    return LayoutBuilder(builder: (context, constriants) {
      final layout = TextPainter(
        text: TextSpan(text: _title, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: constriants.maxWidth);

      return layout.didExceedMaxLines
          ? Tooltip(
              message: _title,
              child: ConstrainedBox(
                // constrained box because marquee needs constrained height
                constraints: BoxConstraints(maxHeight: layout.height),
                child: Marquee(
                  text: _title,
                  scrollAxis: Axis.horizontal,
                  startAfter: const Duration(seconds: 1),
                  //velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
                  //intervalSpaces: 10,
                  blankSpace: 80,
                  showFadingOnlyWhenScrolling: false,
                  fadingEdgeEndFraction: 0.1,
                  fadingEdgeStartFraction: 0.1,
                  style: style,
                ),
              ),
            )
          : Text(
              _title,
              style: style,
            );
    });
  }
}
