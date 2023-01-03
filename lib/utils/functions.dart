// Copyright (c) 2022 Tudlang
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salita/strings.g.dart';
import '../../src/definition/definition_html.dart';
import '/opensource/adaptive.dart';

Future<T?> showModalBottomSheetScaffold<T>({
  required BuildContext context,
  String title = '',
  required List<Widget> Function(BuildContext context, StateSetter setState)
      builder,
  List<Widget> Function(BuildContext context, StateSetter setState)? actions,
  PreferredSizeWidget Function(BuildContext context, StateSetter setState)?
      bottom,
  bool isScrollable = false,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    //isScrollControlled: isFullscreen,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        margin: isDisplayDesktop(context)
            ? const EdgeInsets.symmetric(horizontal: 16)
            : null,
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
                //IconButton(
                //  onPressed: () {
                //    setState(() {});
                //  },
                //  icon: Icon(Icons.expand),
                //),
                CloseButton(
                  color: Theme.of(context).iconTheme.color,
                ),
              ],
              bottom: (bottom == null) ? null : bottom(context, setState),
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

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
    showUnsupportedSnackbar(BuildContext context) {
  final state = ScaffoldMessenger.of(context)..clearSnackBars();

  return state.showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(strings.general.snackbar.unsupported),
  ));
}

void printIfDebug(Object? object) {
  if (kDebugMode) print(object);
}
