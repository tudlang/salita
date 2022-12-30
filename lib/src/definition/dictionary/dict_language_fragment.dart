import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/retry.dart';
import 'package:provider/provider.dart';
import '/opensource/adaptive.dart';

import '../../data/entry.dart';
import '../definition_activity.dart';
import '../definition_html.dart';

class DictionaryLanguageFragment extends StatefulWidget {
  const DictionaryLanguageFragment({
    Key? key,
    required this.entry,
    required this.isOnline,
  }) : super(key: key);
  final EntryLanguage entry;
  final bool isOnline;

  @override
  State<DictionaryLanguageFragment> createState() =>
      DictionaryLanguageFragmentState();
}

class DictionaryLanguageFragmentState
    extends State<DictionaryLanguageFragment> {
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

  @override
  Widget build(BuildContext context) {
    return isDisplayDesktop(context) ||
            (!kIsWeb &&
                (Platform.isWindows || Platform.isMacOS || Platform.isLinux))
                
        ? // a separate navigator for the bottom sheets to only fill up this portion of the screen
             Navigator(
              onGenerateRoute: (settings) {
                return MaterialPageRoute(builder: (context) {
                  return DefinitionHtml(
                    data: widget.entry.html,
                    isOnline: widget.isOnline,
                  );
                });
              },
            )
        : DefinitionHtml(
            data: widget.entry.html,
            isOnline: widget.isOnline,
          );
  }
}
