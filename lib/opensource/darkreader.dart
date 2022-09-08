// Copyright (c) 2022 Tudlang
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// MIT License
//
// Copyright (c) 2021 Dark Reader Ltd.
//
// All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// Code copied & ported from https://github.com/darkreader/darkreader/

import 'package:flutter/material.dart';

double scale(num x, num inLow, num inHigh, num outLow, num outHigh) {
  return (x - inLow) * (outHigh - outLow) / (inHigh - inLow) + outLow;
}

Color modifyLightModeHSL({
  required Color color,
  Color poleFgColor = Colors.white,
  Color poleBgColor = Colors.black,
}) {
  final hsla = HSLColor.fromColor(color);
  final h = hsla.hue;
  final s = hsla.saturation;
  final l = hsla.lightness;
  final a = 1.0;//hsla.alpha;
  final poleFg = HSLColor.fromColor(poleFgColor);
  final poleBg = HSLColor.fromColor(poleBgColor);

  final isDark = l < 0.5;
  final bool isNeutral;
  if (isDark) {
    isNeutral = l < 0.2 || s < 0.12;
  } else {
    final isBlue = h > 200 && h < 280;
    isNeutral = s < 0.24 || (l > 0.8 && isBlue);
  }

  var hx = h;
  var sx = l;
  if (isNeutral) {
    if (isDark) {
      hx = poleFg.hue;
      sx = poleFg.saturation;
    } else {
      hx = poleBg.hue;
      sx = poleBg.saturation;
    }
  }

  final lx = scale(l, 0, 1, poleFg.lightness, poleBg.lightness);

  return HSLColor.fromAHSL(a, hx, sx, lx).toColor();
}

const MAX_BG_LIGHTNESS = 0.4;

Color modifyBgHsl({required Color color, Color poleColor = Colors.black}) {
  final hsla = HSLColor.fromColor(color);
  final h = hsla.hue;
  final s = hsla.saturation;
  final l = hsla.lightness;
  final a = 1.0;//hsla.alpha;
  final pole = HSLColor.fromColor(poleColor);

  final isDark = l < 0.5;
  final isBlue = h > 200 && h < 280;
  final isNeutral = s < 0.12 || (l > 0.8 && isBlue);
  if (isDark) {
    final lx = scale(l, 0, 0.5, 0, MAX_BG_LIGHTNESS);
    if (isNeutral) {
      final hx = pole.hue;
      final sx = pole.saturation;
      return HSLColor.fromAHSL(a, hx, sx, lx).toColor();
    }
    return HSLColor.fromAHSL(a, h, s, lx).toColor();
  }

  var lx = scale(l, 0.5, 1, MAX_BG_LIGHTNESS, pole.lightness);

  if (isNeutral) {
    final hx = pole.hue;
    final sx = pole.saturation;
    return HSLColor.fromAHSL(a, hx, sx, lx).toColor();
  }

  var hx = h;
  final isYellow = h > 60 && h < 180;
  if (isYellow) {
    final isCloserToGreen = h > 120;
    if (isCloserToGreen) {
      hx = scale(h, 120, 180, 135, 180);
    } else {
      hx = scale(h, 60, 120, 60, 105);
    }
  }

  // Lower the lightness, if the resulting
  // hue is in lower yellow spectrum.
  if (hx > 40 && hx < 80) {
    lx *= 0.75;
  }

  return HSLColor.fromAHSL(a, hx, s, lx).toColor();
}
