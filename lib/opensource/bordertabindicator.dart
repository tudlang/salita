// Copyright (c) 2022 Tudlang
// 
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class BorderTabIndicator extends Decoration {
  const BorderTabIndicator({
    required this.indicatorHeight,
    required this.textScaleFactor,
  }) : super();

  final double indicatorHeight;
  final double textScaleFactor;

  @override
  BorderPainter createBoxPainter([VoidCallback? onChanged]) {
    return BorderPainter(this, indicatorHeight, textScaleFactor, onChanged);
  }
}

class BorderPainter extends BoxPainter {
  BorderPainter(
    this.decoration,
    this.indicatorHeight,
    this.textScaleFactor,
    VoidCallback? onChanged,
  )   : assert(indicatorHeight >= 0),
        super(onChanged);

  final BorderTabIndicator decoration;
  final double indicatorHeight;
  final double textScaleFactor;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final horizontalInset = 16 - 4 * textScaleFactor;
    final rect = Offset(offset.dx + horizontalInset,
            (configuration.size!.height / 2) - indicatorHeight / 2 - 1) &
        Size(configuration.size!.width - 2 * horizontalInset, indicatorHeight);
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(56)),
      paint,
    );
  }
}