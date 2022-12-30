// Copyright (c) 2022 Tudlang
// 
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

/// A function that does nothing
void _emptyFunction(){}
/// An icon of the space character, aka an empty icon
const IconData _emptyIcon = IconData(0x0020);

class ToolbarButton {
  const ToolbarButton({
    this.children = const [],
    required this.name,
    this.tooltip,
    this.icon = _emptyIcon,
    this.onTap = _emptyFunction,
  });

  final List<ToolbarButton> children;
  final String name;
  final String? tooltip;
  final IconData? icon;
  final VoidCallback onTap;
}



/*
PopupMenuButton<int>(
                            tooltip: '',
                            position: PopupMenuPosition.under,
                            child: Align(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'File',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                            ),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  height: 35,
                                  child: SizedBox(
                                    width: 280,
                                    child: ListTile(
                                      visualDensity: VisualDensity(
                                          horizontal: 0, vertical: -4),
                                      minVerticalPadding: 0,
                                      contentPadding: EdgeInsets.zero,
                                      minLeadingWidth: 0,
                                      iconColor:
                                          Theme.of(context).iconTheme.color,
                                      dense: true,
                                      title: Text(
                                        'sd',
                                        style:
                                            Theme.of(context).textTheme.button,
                                      ),
                                      trailing: Text(
                                        'Ctrl+123',
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                      leading: Icon(
                                        Icons.abc,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  height: 35,
                                  padding: EdgeInsets.zero,
                                  child: SizedBox(
                                    width: 280,
                                    child: PopupMenuButton<int>(
                                      tooltip: "",
                                      position: PopupMenuPosition.over,
                                      offset: Offset(0, -10),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: ListTile(
                                          visualDensity: VisualDensity(
                                              horizontal: 0, vertical: -4),
                                          minVerticalPadding: 0,
                                          contentPadding: EdgeInsets.zero,
                                          minLeadingWidth: 0,
                                          iconColor:
                                              Theme.of(context).iconTheme.color,
                                          dense: true,
                                          title: Text(
                                            'Open new file',
                                            style: Theme.of(context)
                                                .textTheme
                                                .button,
                                          ),
                                          trailing:
                                              Icon(Icons.arrow_right_sharp),
                                          leading: Icon(
                                            Icons.abc,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      itemBuilder: (context) {
                                        return [
                                          PopupMenuItem(
                                            height: 35,
                                            child: ListTile(
                                              visualDensity: VisualDensity(
                                                  horizontal: 0, vertical: -4),
                                              minVerticalPadding: 0,
                                              contentPadding: EdgeInsets.zero,
                                              minLeadingWidth: 0,
                                              iconColor: Theme.of(context)
                                                  .iconTheme
                                                  .color,
                                              dense: true,
                                              title: Text(
                                                'sd',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button,
                                              ),
                                              trailing: Text(
                                                'Ctrl+123',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption,
                                              ),
                                              leading: Icon(
                                                Icons.abc,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ];
                                      },
                                    ),
                                  ),
                                ),
                              ];
                            },
                          ),
                        
*/
