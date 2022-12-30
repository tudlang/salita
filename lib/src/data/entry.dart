// Copyright (c) 2022 Tudlang
// 
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// Copyright (c) 2022 Tudlang
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:collection';

import 'package:flutter/material.dart' hide Element, Text;
import 'package:go_router/go_router.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:html/dom.dart';
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:intl/locale.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'wiktionary.dart';
import 'package:salita/settings.dart';
import 'namespace.dart';
import '/utils/extensions.dart';

class Entry {
  final String title;
  final String wikititle;
  final int pageid;
  final int revid;
  final List<EntryLanguage> languages;
  final List<EntryLink> seealso;
  final DateTime date;
  final DateTime? wotd;
  final String? redirect;

  /// Manually create an entry from scratch.
  Entry({
    required this.title,
    required this.wikititle,
    this.pageid = -1,
    this.revid = -1,
    this.languages = const [],
    DateTime? date,
    this.seealso = const [],
    this.wotd,
    String? redirect,
  })  : redirect = (title == redirect) ? null : redirect,
        date = date ?? DateTime.fromMillisecondsSinceEpoch(0);

  bool get isTitleSameAsWikititle => title == wikititle;

  Uri toUri() {
    return Uri.https('en.wiktionary.org', '/wiki/${wikititle}');
  }

  factory Entry.fromJson(
    BuildContext context,
    dynamic json,
    SourceWiktionary sourceWiktionary, {
    String? redirectFrom,
  }) {
    if (json['error'] != null) {
      switch (json['error']['code']) {
        case 'missingtitle':
          throw NoTitleExeption();
        default:
          throw json;
      }
    }

    // .children[0] = <html>
    // .children[1] = <body>
    // .children[0] = <div class="mw-parser-output">
    final html =
        parse(json['parse']['text']).children[0].children[1].children[0];
    final format = DateFormat('d MMMM y');
    List<EntryLanguage> languages = [];
    List<EntryLink> seealso = [];
    DateTime? wotd;

    String? previousH2;
    String? previousH3;
    for (final i in html.children) {
      //debugPrint(i.toString());

      if (i.localName == 'h1' || i.localName == 'h2') {
        languages.add(EntryLanguage(language: i.text, html: ''));
        previousH2 = i.text;
        //check for see also at the very start
      } else if (i == html.children.first &&
          i.localName == 'div' &&
          RegExp(r"disambig\-see\-also(\-2)?").hasMatch(i.className)) {
        for (final j in i.querySelectorAll("b")) {
          seealso.add(EntryLink.fromHref(
            j.children.first.attributes['href']!,
            text: j.text,
          ));
        }
        // check for word of the day
      } else if (i.localName == 'div' &&
          RegExp(r"was-wotd ?(floatright)?").hasMatch(i.className)) {
        // to distinguish between WOTD and FWOTD
        wotd = format.parse(i.text.substring(i.text.startsWith('W') ? 7 : 8));
        // if redirect page
      } else if (i == html.children.first &&
          i.localName == 'div' &&
          RegExp(r"redirectMsg").hasMatch(i.className)) {
        // getting last (<ul>) text, or the wikititle of the redirect
        throw RedirectExeption(
          link: EntryLink.fromHref(i.querySelector('a')!.attributes['href']!),
        );
      } else {
        if (languages.isEmpty) continue;
        languages.last.html = languages.last.html += i.outerHtml;
      }
    }
    languages = languages.map((e) {
      // parse the html
      // .children[0] = <html>
      // .children[1] = <body>
      //final source = parse(
      //  e.html
      //      //promote heading count by 2
      //      .replaceAllMapped(
      //        RegExp(r'\<h([3-7])\>(.*?)\<\/h\1\>'),
      //        (match) {
      //          return '<h${int.parse(match.group(1)!) - 2}>${match.group(2)!}</h${int.parse(match.group(1)!) - 2}>';
      //        },
      //      )
      //      // remove "For more quotations using this term"
      //      .replaceAll(
      //          RegExp(r'(<li>.*)?<span class="see-cites".*?<\/span>(<\/li>)?'),
      //          '')
      //      // remove wikipedia links
      //      .replaceAllMapped(
      //          RegExp(
      //              r'\<a href\="https\:\/\/...?\.(?:wikipedia).org\/.*?"\>(.+?)\<\/a\>'),
      //          (match) => match.group(1)!),
      //).children[0].children[1];

      final source = sourceWiktionary.parseHtmlString(context, e.html);

      // remover
      /* source
          .querySelectorAll(
              '.checktrans, hr, .sister-wikipedia, .noprint, .sister-wikiquote, .sister-wikiversity, .thumb, .interProject, .mw-empty-elt')
          .forEach((e) {
        e.remove();
      }); */

      //source.querySelectorAll('a[href*="wiktionary.org"]').forEach((e) {
      //  e.remove();
      //});
//
      //source.querySelectorAll('.zhpron').forEach((e) {
      //  e.replaceWith(
      //      Element.html('<salita:zhpron>${e.innerHtml}</salita:zhpron>'));
      //});

      e.html = source.outerHtml;
      return e;
    }).toList();

    return Entry(
      title: ((json['parse']['properties']?['defaultsort'] as String?) ??
              (json["parse"]["displaytitle"] as String))
          .tryDecodeHtml()!,
      wikititle: json["parse"]["title"],
      pageid: json["parse"]["pageid"],
      revid: json["parse"]["revid"],
      languages: languages,
      seealso: seealso,
      date: DateTime.parse(json["curtimestamp"]),
      wotd: wotd,
      redirect: redirectFrom,
    );
  }
}

class EntryLanguage {
  final String language;
  String html;

  EntryLanguage({
    required this.language,
    required this.html,
  });
  @override
  String toString() {
    return "$language: $html";
  }

  Element get source =>
      // PARSE THE HTML
      // .children[0] = <html>
      // .children[1] = <body>
      parse(html).children[0].children[1];
}

class EntryLink {
  final String text;
  final String wikititle;
  final String heading;
  final bool doesExist;
  final Namespace mode;

  EntryLink({
    this.mode = const NamespaceDictionary(),
    required this.text,
    required this.wikititle,
    this.heading = '',
    this.doesExist = true,
  });

  /// changes `/wiki/w%C3%BA` to `wú`
  factory EntryLink.fromHref(String href, {String? text}) {
    var uri = Uri.parse(href.replaceAll('/wiki/', '/'));

    if (href.contains('redlink=1')) {
      return EntryLink(
        wikititle: uri.queryParameters['title'] ?? uri.pathSegments[0],
        text: text ?? uri.pathSegments[0],
        doesExist: false,
      );
    }

    return EntryLink(
      wikititle: href.contains('Unsupported_titles')
          ? uri.path.substring(1)
          : uri.pathSegments[0],
      text: text ?? uri.pathSegments[0],
      heading: uri.fragment.replaceAll('_', '+'),
      doesExist: true,
    );
  }

  static List<EntryLink?> fromJson(SourceWiktionary source, dynamic json) {
    List<EntryLink?> out = [];
    if (json['query'] == null && json['continue'] == null) return out;

    for (final i in json['query']['pages']) {
      out.add(EntryLink(
        mode: source.namespaces.singleWhere((e) => e.namespaceId == i['ns']),
        text: i['title'],
        wikititle: i['title'],
      ));
    }

    if (out.isEmpty) return out;

    // sort based on the index in the json
    out.sort((a, b) {
      return json['query']['pages']
          .singleWhere((element) => element['title'] == a!.wikititle)['index']
          .compareTo(json['query']['pages'].singleWhere(
              (element) => element['title'] == b!.wikititle)['index']);
    });

    if (json['continue'] != null) out.add(null);

    return out;
  }

  @override
  String toString() {
    return jsonEncode({
      'text': text,
      'wikititle': wikititle,
      'heading': heading,
      'doesExist': doesExist
    });
  }

  void go(
    BuildContext context, {
    required bool isOnline,
    Map<String, String> extra = const {},
  }) {
    final path =
        '/definition/${wikititle.tryEncodeUri()}?online=$isOnline&mode=${mode.id}&heading=${heading.tryEncodeUri()}';

    GoRouter.of(context).go(
      path,
      extra: extra,
    );
    //SettingsKeys.appDefinitionHistory = [
    //  ...SettingsKeys.appDefinitionHistory,
    //  wikititle
    //];
  }
}

class NoTitleExeption implements Exception {}

class RedirectExeption implements Exception {
  final EntryLink link;

  const RedirectExeption({required this.link});
}

class DisplayTitleExeption implements Exception {
  final String title;

  const DisplayTitleExeption({required this.title});
}
