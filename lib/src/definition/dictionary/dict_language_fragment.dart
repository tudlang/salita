// Copyright (c) 2022 Tudlang
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/retry.dart';
import 'package:provider/provider.dart';
import 'package:salita/settings.dart';
import 'package:salita/utils/functions.dart';
import '/opensource/adaptive.dart';

import '../../data/entry.dart';
import '../definition_activity.dart';
import '../definition_html.dart';

class DictionaryLanguageFragment extends StatefulWidget {
  const DictionaryLanguageFragment({
    Key? key,
    required this.entry,
  }) : super(key: key);
  final EntryLanguage entry;

  @override
  State<DictionaryLanguageFragment> createState() =>
      DictionaryLanguageFragmentState();
}

class DictionaryLanguageFragmentState
    extends State<DictionaryLanguageFragment> {
  late ScrollController _scrollController;
  bool isRaw = false;

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

  @override
  Widget build(BuildContext context) {
    if (getSettings('definition', 'htmlShowRaw')) {
      return ListView(
        padding: const EdgeInsets.all(8.0),
        controller: _scrollController,
        children: [
          OutlinedButton(
            onPressed: () {
              setState(() {
                isRaw = !isRaw;
              });
            },
            child: Text(isRaw ? "Show rendered" : "Show raw"),
          ),
          if (isRaw)
            SelectableText(widget.entry.html)
          else
            DefinitionHtml(
              data: widget.entry.html,
            ),
        ],
      );
    }

    // a separate navigator for the bottom sheets to only fill up this portion of the screen
    return parentOrChild(
      condition: isDisplayDesktop(context) ||
          (!kIsWeb &&
              (Platform.isWindows || Platform.isMacOS || Platform.isLinux)),
      parent: (child) {
        return Navigator(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(builder: (context) => child);
          },
        );
      },
      child: DefinitionHtml(
        data: widget.entry.html,
      ),
    );
  }
}
