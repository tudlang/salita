// Copyright (c) 2022 Tudlang
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart' hide Element;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:csslib/visitor.dart';
import 'package:html/dom.dart' hide Text;
import 'package:html/parser.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:salita/opensource/darkreader.dart';
import 'package:salita/src/data/entry.dart';
import 'package:salita/strings.g.dart';
import 'package:salita/utils/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../settings.dart';
import '../definition/definition_html.dart';
import '/utils/extensions.dart';

import 'namespace.dart';
import 'wiktionary_languages.dart';

/// A class that stores each Wiktionary language, to be used by the parser.
///
/// Use [SourceWiktionary.map] for the complete list of languages.
abstract class SourceWiktionary with SourceWiktionaryFunctions{
  /// The URL for the MediaWiki API
  final String urlApi;

  /// The name for the language
  final String name;

  /// The number of entries for the language
  ///
  /// This number is hardcoded for simplicity.
  final int numberEntries;

  /// The HTML tag that separates languages in an entry. Defaults to `h2`.
  final String languageBreakpoint;

  /// The list of namespaces.
  final List<Namespace> namespaces;

  const SourceWiktionary({
    required this.urlApi,
    required this.name,
    this.numberEntries = 0,
    this.languageBreakpoint = 'h2',
    required this.namespaces,
  });

  /// Gets the corresponding SourceWiktionary from the given language [code].
  ///
  /// Throws `ArgumentError` if [code] not valid.
  factory SourceWiktionary.fromCode(String code) {
    final output = map[code];
    if (output == null) throw ArgumentError.value(code);
    return output;
  }

  /// Gets the current SourceWiktionary based from the settings
  //TODO put this method as an extension method when this becomes a package
  factory SourceWiktionary.fromSettings() =>
      SourceWiktionary.fromCode(getSettings('definition', 'language'));

  /// The complete map of all wiktionary languages
  ///
  /// The key is the MediaWiki language id, the value is the instance of that class
  static const map = <String, SourceWiktionary>{
    // ACTIVE
    'ang': SourceWiktionaryAng.instance,
    'af': SourceWiktionaryAf.instance,
    'an': SourceWiktionaryAn.instance,
    'roa-rup': SourceWiktionaryRoaRup.instance,
    'ast': SourceWiktionaryAst.instance,
    'gn': SourceWiktionaryGn.instance,
    'ay': SourceWiktionaryAy.instance,
    'az': SourceWiktionaryAz.instance,
    'id': SourceWiktionaryId.instance,
    'ms': SourceWiktionaryMs.instance,
    'zh-min-nan': SourceWiktionaryZhMinNan.instance,
    'jv': SourceWiktionaryJv.instance,
    'su': SourceWiktionarySu.instance,
    'bcl': SourceWiktionaryBcl.instance,
    'bs': SourceWiktionaryBs.instance,
    'br': SourceWiktionaryBr.instance,
    'ca': SourceWiktionaryCa.instance,
    'cs': SourceWiktionaryCs.instance,
    'co': SourceWiktionaryCo.instance,
    'cy': SourceWiktionaryCy.instance,
    'da': SourceWiktionaryDa.instance,
    'de': SourceWiktionaryDe.instance,
    'na': SourceWiktionaryNa.instance,
    'et': SourceWiktionaryEt.instance,
    'en': SourceWiktionaryEn.instance,
    'es': SourceWiktionaryEs.instance,
    'eo': SourceWiktionaryEo.instance,
    'eu': SourceWiktionaryEu.instance,
    'fo': SourceWiktionaryFo.instance,
    'fr': SourceWiktionaryFr.instance,
    'fy': SourceWiktionaryFy.instance,
    'ga': SourceWiktionaryGa.instance,
    'gv': SourceWiktionaryGv.instance,
    'sm': SourceWiktionarySm.instance,
    'gd': SourceWiktionaryGd.instance,
    'gl': SourceWiktionaryGl.instance,
    'ha': SourceWiktionaryHa.instance,
    'hr': SourceWiktionaryHr.instance,
    'io': SourceWiktionaryIo.instance,
    'ia': SourceWiktionaryIa.instance,
    'ie': SourceWiktionaryIe.instance,
    'ik': SourceWiktionaryIk.instance,
    'zu': SourceWiktionaryZu.instance,
    'is': SourceWiktionaryIs.instance,
    'it': SourceWiktionaryIt.instance,
    'kl': SourceWiktionaryKl.instance,
    'csb': SourceWiktionaryCsb.instance,
    'kw': SourceWiktionaryKw.instance,
    'rw': SourceWiktionaryRw.instance,
    'sw': SourceWiktionarySw.instance,
    'ku': SourceWiktionaryKu.instance,
    'la': SourceWiktionaryLa.instance,
    'lv': SourceWiktionaryLv.instance,
    'lb': SourceWiktionaryLb.instance,
    'lt': SourceWiktionaryLt.instance,
    'li': SourceWiktionaryLi.instance,
    'ln': SourceWiktionaryLn.instance,
    'jbo': SourceWiktionaryJbo.instance,
    'hu': SourceWiktionaryHu.instance,
    'mg': SourceWiktionaryMg.instance,
    'mt': SourceWiktionaryMt.instance,
    'mi': SourceWiktionaryMi.instance,
    'fj': SourceWiktionaryFj.instance,
    'nah': SourceWiktionaryNah.instance,
    'nl': SourceWiktionaryNl.instance,
    'no': SourceWiktionaryNo.instance,
    'nn': SourceWiktionaryNn.instance,
    'oc': SourceWiktionaryOc.instance,
    'om': SourceWiktionaryOm.instance,
    'uz': SourceWiktionaryUz.instance,
    'nds': SourceWiktionaryNds.instance,
    'pl': SourceWiktionaryPl.instance,
    'pt': SourceWiktionaryPt.instance,
    'ro': SourceWiktionaryRo.instance,
    'qu': SourceWiktionaryQu.instance,
    'sg': SourceWiktionarySg.instance,
    'st': SourceWiktionarySt.instance,
    'tn': SourceWiktionaryTn.instance,
    'sq': SourceWiktionarySq.instance,
    'scn': SourceWiktionaryScn.instance,
    'simple': SourceWiktionarySimple.instance,
    'ss': SourceWiktionarySs.instance,
    'tl': SourceWiktionaryTl.instance,
    'vi': SourceWiktionaryVi.instance,
    'tpi': SourceWiktionaryTpi.instance,
    'tr': SourceWiktionaryTr.instance,
    'tk': SourceWiktionaryTk.instance,
    'vo': SourceWiktionaryVo.instance,
    'wa': SourceWiktionaryWa.instance,
    'wo': SourceWiktionaryWo.instance,
    'ts': SourceWiktionaryTs.instance,
    'el': SourceWiktionaryEl.instance,
    'be': SourceWiktionaryBe.instance,
    'bg': SourceWiktionaryBg.instance,
    'ky': SourceWiktionaryKy.instance,
    'kk': SourceWiktionaryKk.instance,
    'mk': SourceWiktionaryMk.instance,
    'mn': SourceWiktionaryMn.instance,
    'ru': SourceWiktionaryRu.instance,
    'sr': SourceWiktionarySr.instance,
    'tt': SourceWiktionaryTt.instance,
    'tg': SourceWiktionaryTg.instance,
    'uk': SourceWiktionaryUk.instance,
    'hy': SourceWiktionaryHy.instance,
    'ka': SourceWiktionaryKa.instance,
    'gom': SourceWiktionaryGom.instance,
    'ks': SourceWiktionaryKs.instance,
    'ne': SourceWiktionaryNe.instance,
    'mr': SourceWiktionaryMr.instance,
    'sa': SourceWiktionarySa.instance,
    'hi': SourceWiktionaryHi.instance,
    'hif': SourceWiktionaryHif.instance,
    'hsb': SourceWiktionaryHsb.instance,
    'bn': SourceWiktionaryBn.instance,
    'pa': SourceWiktionaryPa.instance,
    'gu': SourceWiktionaryGu.instance,
    'or': SourceWiktionaryOr.instance,
    'ta': SourceWiktionaryTa.instance,
    'te': SourceWiktionaryTe.instance,
    'kn': SourceWiktionaryKn.instance,
    'min': SourceWiktionaryMin.instance,
    'ml': SourceWiktionaryMl.instance,
    'si': SourceWiktionarySi.instance,
    'th': SourceWiktionaryTh.instance,
    'my': SourceWiktionaryMy.instance,
    'lo': SourceWiktionaryLo.instance,
    'km': SourceWiktionaryKm.instance,
    'iu': SourceWiktionaryIu.instance,
    'chr': SourceWiktionaryChr.instance,
    'ti': SourceWiktionaryTi.instance,
    'am': SourceWiktionaryAm.instance,
    'ko': SourceWiktionaryKo.instance,
    'ja': SourceWiktionaryJa.instance,
    'zh': SourceWiktionaryZh.instance,
    'yue': SourceWiktionaryYue.instance,
    'yi': SourceWiktionaryYi.instance,
    'he': SourceWiktionaryHe.instance,
    'ur': SourceWiktionaryUr.instance,
    'ar': SourceWiktionaryAr.instance,
    'ps': SourceWiktionaryPs.instance,
    'pnb': SourceWiktionaryPnb.instance,
    'sd': SourceWiktionarySd.instance,
    'shn': SourceWiktionaryShn.instance,
    'shy': SourceWiktionaryShy.instance,
    'vec': SourceWiktionaryVec.instance,
    'fa': SourceWiktionaryFa.instance,
    'ug': SourceWiktionaryUg.instance,
    'dv': SourceWiktionaryDv.instance,

    //USES WIKIPEDIA
    //'als': SourceWiktionaryAls.instance,
  };

  /// Do any alterations to the source HTML string here.
  ///
  /// When subclassing:
  /// * When transforming the HTML, reassign the transformed string back into [html].
  /// * Your return statement must be `return super(context, html)`.
  ///
  /// This function is called before converting the HTML into widgets.
  @mustCallSuper
  Element parseHtmlString(BuildContext context, String html) {
    // PROMOTE HEADING COUNT BY 2 (<h3> -> <h1>)
    html = html.replaceAllMapped(
      RegExp(r'\<h([3-7])\>(.*?)\<\/h\1\>'),
      (match) {
        return '<h${int.parse(match.group(1)!) - 2}>${match.group(2)!}</h${int.parse(match.group(1)!) - 2}>';
      },
    );

    // PARSE THE HTML
    // .children[0] = <html>
    // .children[1] = <body>
    final source = parse(html).children[0].children[1];

    // DARK THEME COLOR CHANGER
    if (Theme.of(context).brightness == Brightness.dark) {
      // CHANGE BACKGROUND COLOR
      source.querySelectorAll("[style*=background]").forEach((element) {
        final a = (element.styles
            .firstWhere((e) => e.property.contains('background'))
            .value!);
        late final Color color;
        if (a is HexColorTerm) {
          final _ = (element.styles
              .firstWhere((e) => e.property.contains('background'))
              .value! as HexColorTerm);

          if (_.value is int) color = Color(_.value);
          // Skip the element if it has BAD_HEX_VALUE
          if (_.value is BAD_HEX_VALUE) return;
        } else if (a is FunctionTerm) {
          color = fromCssColor("rgb(${a.span!.text}");
        } else {
          return;
        }
        element.attributes['style'] =
            "${element.attributes['style']!.replaceAll(RegExp(r'background(\-color)?:.*;?'), "background:${modifyLightModeHSL(
                  color: color,
                  poleBgColor: Theme.of(context).backgroundColor,
                ).toCssString()};")};background:${modifyLightModeHSL(
          color: color,
          poleBgColor: Theme.of(context).backgroundColor,
        ).toCssString()};";
      });
    }

    return source;
  }

  /// Do any simple HTML element to widget conversion here.
  @mustCallSuper
  Widget? parseHtmlWidgetSimple({
    required BuildContext context,
    required Element element,
  }) {
    // Quotation handler, turns quotations into the button
    if (element.parent?.localName == 'li' &&
        element.localName == 'ul' &&
        // checks that all children of the element are:
        element.children.every((element) =>
            element.children.tryFirst?.className == 'citation-whole' ||
            element.children.tryFirst?.localName == 'b' ||
            // to compensate for quotations inside <dd> tags
            element.children.tryFirst?.children.tryFirst?.children.tryFirst
                    ?.className ==
                'citation-whole' ||
            // to compensate for quotations with maintenance lines
            element.children.tryFirst?.className == 'maintenance-line')) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SelectionContainer.disabled(
          child: OutlinedButton(
            onPressed: () {
              showBottomsheet(
                context,
                title: strings.definition.html.quotations.title,
                children: [
                  DefinitionHtml(
                    isNested: true,
                    data: element.outerHtml.trim(),
                  ),
                ],
              );
            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.format_quote),
                ),
                Text(strings.definition.html.quotations.button),
              ],
            ),
          ),
        ),
      );
    }

    // Translations handler
    if (element.localName == 'table' &&
        element.classes.contains('translations')) {
      // add wrap so that the button's height & width is wrap content
      return SelectionContainer.disabled(
        child: Wrap(
          children: [
            OutlinedButton(
              onPressed: () {
                showBottomsheet(
                  context,
                  title: strings.definition.html.translations.title,
                  children: [
                    DefinitionHtml(
                      isNested: true,
                      data: element.innerHtml.trim(),
                    ),
                  ],
                );
              },
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.translate),
                  ),
                  Text(strings.definition.html.translations.button),
                ],
              ),
            )
          ],
        ),
      );
    }

    // Derived terms handler
    if (element.localName == 'div' &&
        element.classes.contains('derivedterms') &&
        element.parent?.localName == 'div' &&
        element.parent?.classes.contains('list-switcher') == true) {
      // add wrap so that the button's height & width is wrap content
      return SelectionContainer.disabled(
        child: Wrap(
          children: [
            OutlinedButton(
              onPressed: () {
                showBottomsheet(
                  context,
                  title: strings.definition.html.termlist.title,
                  children: [
                    DefinitionHtml(
                      isNested: true,
                      data: element.innerHtml.trim(),
                    ),
                  ],
                );
              },
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.list_alt),
                  ),
                  Text(strings.definition.html.termlist.button),
                ],
              ),
            )
          ],
        ),
      );
    }

    // Other navframes handler
    if (element.localName == 'div' &&
        element.classes.contains('NavFrame') &&
        element.querySelector('.NavHead') != null &&
        element.querySelector('.NavContent') != null &&
        element.querySelector('.translations') == null) {
      return SelectionContainer.disabled(
        child: OutlinedButton(
          onPressed: () {
            showBottomsheet(
              context,
              title: element.querySelector('.NavHead')!.text.trim(),
              children: [
                DefinitionHtml(
                  isNested: true,
                  data: () {
                    final e = element.clone(true);
                    e.querySelectorAll('.NavToggle, .NavHead').forEach((element) {
                      element.remove();
                    });
                    return e.innerHtml.trim();
                  }(),
                ),
              ],
            );
          },
          child: Text(element.querySelector('.NavHead')!.text.trim()),
        ),
      );
    }

    //If unhandled, return null
    return null;
  }

  /// Do any advanced parser data to widget data conversion here.
  ///
  /// For subclasses, call `super` first.
  @mustCallSuper
  BuildMetadata parseHtmlWidgetAdvanced({
    required BuildContext context,
    required BuildMetadata meta,
    required dynamic strings,
  }) {
    final element = meta.element;

    // abbreviation handler, turns <abbr> to the blue boxes
    if (element.localName == 'abbr') {
      meta.register(BuildOp(
        onTree: (meta, tree) {
          //remove the rendered default
          tree.last?.detach();
          // add the custom renderer
          tree.add(WidgetBit.inline(
            tree,
            Tooltip(
              message: element.attributes['title'] ??
                  strings.general.snackbar.noDescription,
              triggerMode: TooltipTriggerMode.tap,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Text(
                  element.text,
                ),
              ),
            ),
            alignment: PlaceholderAlignment.middle,
          ));
        },
      ));
    }

    return meta;
  }

  /// Gets an overview exerpt for the given [entry].
  // TODO add better functionality
  String getOverviewExerpt(EntryLanguage entry) => entry.source.text.trim();
}

mixin SourceWiktionaryFunctions {
  Future<T?> showBottomsheet<T>(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return showModalBottomSheetScaffold<EntryLink>(
      context: context,
      title: title,
      builder: (context2, setState) {
        return children;
      },
      isScrollable: true,
    ).then((link) {
      if (link != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          link.go(context);
        });
      }
    });
  }
}
