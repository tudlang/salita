import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../src/definition/definition_html.dart';
import '/opensource/adaptive.dart';

Future<T?> showModalBottomSheetScaffold<T>({
  required BuildContext context,
  String title = '',
  required List<Widget> Function(BuildContext, StateSetter) builder,
  List<Widget> Function(BuildContext, StateSetter)? actions,
  bool isScrollable = false,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: StatefulBuilder(builder: (context, setState) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              primary: false,
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).backgroundColor,
              title: SelectableText(
                title,
                style: Theme.of(context).textTheme.headline5,
                //softWrap: true,
                maxLines: 1,
                //overflow: TextOverflow.fade,
              ),
              actions: [
                if (actions != null) ...actions(context, setState),
                CloseButton(
                  color: Theme.of(context).iconTheme.color,
                ),
              ],
            ),
            body: SizedBox.expand(
              child: Ink(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: isScrollable
                    ? builder(context, setState).first
                    : Scrollbar(
                        thumbVisibility: true,
                        child: ListView(
                          padding: const EdgeInsets.all(8.0),
                          children: builder(context, setState),
                        ),
                      ),
              ),
            ),
          );
        }),
      );
    },
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
  );
}

/// If [condition] is true, use [parent], otherwise continue with [child].
Widget parentOrChild({
  required bool condition,
  required Widget Function(Widget child) parent,
  required Widget child,
}) =>
    condition ? parent(child) : child;

bool isPlatformDesktop() =>
    !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
