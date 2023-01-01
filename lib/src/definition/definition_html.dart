// Copyright (c) 2022 Tudlang
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Element;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:salita/settings.dart';
import '/opensource/adaptive.dart';
import '/utils/functions.dart';

import '../data/entry.dart';
import '../data/wiktionary.dart';
import '../../main.dart';
import '../../strings.g.dart';

class DefinitionHtml extends StatefulWidget {
  const DefinitionHtml({
    super.key,
    required this.data,
    this.isNested = false,
    required this.isOnline,
  });
  final String data;
  final bool isNested;
  final bool isOnline;
  @override
  State<StatefulWidget> createState() => _DefinitionHtmlState();
}

class _DefinitionHtmlState extends State<DefinitionHtml> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  ///Default padding for the widget
  static const _padding = EdgeInsets.all(16);

  ///Use scrollable widget only when in web, windows, macos, linux, otherwise ignore
  // TODO add setting for toggling this
  Widget _conditionalscroll({required Widget child}) {
    return kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux
        ? Scrollbar(
            thumbVisibility: true,
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: _padding,
              child: child,
            ),
          )
        : child;
  }

  @override
  Widget build(BuildContext context) {
    final source = SourceWiktionary.fromSettings();
    return _conditionalscroll(
      child: HtmlWidget(
        widget.data,
        buildAsync: true,
        isSelectable: getSettings('definition', 'htmlSelectableText'),
        factoryBuilder: () =>
            DefinitionHtmlFactory(context: context, sourceWiktionary: source),
        onTapUrl: (url) {
          var link = EntryLink.fromHref(url);
          link.go(context, isOnline: widget.isOnline);
          return true;
        },
        customWidgetBuilder: (element) {
          return source.parseHtmlWidgetSimple(
            context: context,
            element: element,
            bottomsheet: _bottomsheet,
            isOnline: widget.isOnline,
            htmlwidget: DefinitionHtml.new,
          );
        },
        // for android / ios, use the lazyloading of listviews (for performance reasons) but no scrollbar, otherwise just use a column with the aforementioned _conditionalscroll() because it has funkiness with the visible scrollbar
        // See: https://github.com/daohoangson/flutter_widget_from_html/issues/199
        renderMode:
            kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux
                ? const ColumnMode()
                : ListViewMode(
                    controller: _scrollController,
                    primary: false,
                    padding: _padding,
                  ),

        onLoadingBuilder: (context, element, loadingProgress) {
          print(loadingProgress);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Loading " + element.localName!),
                LinearProgressIndicator(
                  value: loadingProgress,
                ),
              ],
            ),
          );
        },
        onErrorBuilder: (context, element, error) {
          return Text(error.toString());
        },
      ),
    );
/*
    return Html(
      data: widget.data,
      onLinkTap: (url, renderContext, attributes, element) {
        print('LINK URL: $url');
        var link = EntryLink.fromHref(url!);
        print(link.wikititle);

        if (link.doesExist && !widget.isNested) {
          link.go(
            context,
            isOnline: widget.isOnline,
          );
        } else if (link.doesExist && widget.isNested) {
          Navigator.of(context).pop(link);
        } else {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                action: true
                    ? null
                    : SnackBarAction(
                        textColor: Colors.purple.shade400,
                        label: 'Contribute',
                        onPressed: () {},
                      ),
                content: Text(
                  strings.Definition.snackbar
                      .entryNotExist(title: link.wikititle),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.merge(textstyle)
                      .copyWith(color: Colors.white),
                ),
              ),
            );
        }
      },
      customRenders: {
        tableMatcher(): CustomRender.widget(widget: (context, buildChildren) {
          final tableScrollController = ScrollController();
          return Scrollbar(
            key: ValueKey(context),
            thumbVisibility: true,
            interactive: true,
            controller: tableScrollController,
            child: SingleChildScrollView(
              primary: false,
              controller: tableScrollController,
              scrollDirection: Axis.horizontal,
              child: tableRender().widget!(context, buildChildren),
            ),
          );
        }),
        tagMatcher("salita:quotation"):
            CustomRender.widget(widget: (renderContext, buildChildren) {
          return OutlinedButton(
            onPressed: () {
              _bottomsheet(context,
                  title: strings.Definition.html.quotations.title,
                  children: [
                    DefinitionHtml(
                      isNested: true,
                      isOnline: widget.isOnline,
                      data: renderContext.tree.element?.innerHtml ?? '',
                    ),
                  ],
                  isOnline: widget.isOnline);
            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.format_quote_outlined),
                ),
                Text(strings.Definition.html.quotations.button),
              ],
            ),
          );
        }),
        tagMatcher("salita:zhpron"):
            CustomRender.widget(widget: (renderContext, buildChildren) {
          return OutlinedButton(
            onPressed: () {
              _bottomsheet(context,
                  title: strings.Definition.html.pronounciations.title,
                  children: [
                    DefinitionHtml(
                      isNested: true,
                      isOnline: widget.isOnline,
                      data: renderContext.tree.element?.innerHtml ?? '',
                    ),
                  ],
                  isOnline: widget.isOnline);
            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.record_voice_over_outlined),
                ),
                Text(strings.Definition.html.pronounciations.button),
              ],
            ),
          );
        }),
        tagMatcher("salita:termlist"):
            CustomRender.widget(widget: (renderContext, buildChildren) {
          return OutlinedButton(
            onPressed: () {
              _bottomsheet(context,
                  title: strings.Definition.html.termlist.title,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final i in renderContext.tree.element!.children)
                          ActionChip(
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .merge(textstyle),
                            avatar: Text(
                              (renderContext.tree.element!.children.indexOf(i) +
                                      1)
                                  .toString(),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            label: Text(i.text),
                            onPressed: () {
                              Navigator.pop(
                                context,
                                EntryLink.fromHref(
                                  i.querySelector('a')!.attributes['href']!,
                                  text: i.text,
                                ),
                              );
                            },
                          )
                      ],
                    )
                  ],
                  isOnline: widget.isOnline);
            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.list_alt_outlined),
                ),
                Text(strings.Definition.html.termlist.button),
              ],
            ),
          );
        }),
      },
      tagsList: Html.tags
        ..addAll([
          'salita:termlist',
          'salita:quotation',
          'salita:translation',
          'salita:zhpron',
          'salita:navframe',
        ]),
      style: {
        'div, table': Style(

            //width: 1000,
            //width: double.infinity,
            ),
        'table': Style(
          border: Border.all(color: Colors.grey),
        ),
      },
    );
*/
  }
}

_bottomsheet(
  BuildContext context, {
  required String title,
  required List<Widget> children,
  required bool isOnline,
}) {
  showModalBottomSheetScaffold<EntryLink>(
    context: context,
    title: title,
    builder: (context2, setState) {
      return children;
    },
    isScrollable: true,
  ).then((link) {
    if (link != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        link.go(context, isOnline: isOnline);
      });
    }
  });
}

class DefinitionHtmlFactory extends WidgetFactory {
  DefinitionHtmlFactory({
    required this.context,
    required this.sourceWiktionary,
  }) : super();
  BuildContext context;
  SourceWiktionary sourceWiktionary;

  @override
  bool get webViewDebuggingEnabled => true;

  @override
  void parse(BuildMetadata meta) {
    sourceWiktionary.parseHtmlWidgetAdvanced(
      meta: meta,
      context: context,
      bottomsheet: _bottomsheet,
      isOnline: true,
      htmlwidget: DefinitionHtml.new,
      strings: strings,
    );

    return super.parse(meta);
  }
}
