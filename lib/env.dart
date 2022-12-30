// Copyright (c) 2022 Tudlang
// 
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
part 'env_ignore.dart';

// Demo ad units
// https://developers.google.com/admob/android/test-ads#demo_ad_units

const _keyAdAndroidDemoAppopen = 'ca-app-pub-3940256099942544/3419835294';
const _keyAdAndroidDemoBanner = 'ca-app-pub-3940256099942544/6300978111';
const _keyAdAndroidDemoInterstitial = 'ca-app-pub-3940256099942544/1033173712';
const _keyAdAndroidDemoInterstitialvideo = 'ca-app-pub-3940256099942544/8691691433';
const _keyAdAndroidDemoRewarded = 'ca-app-pub-3940256099942544/5224354917';
const _keyAdAndroidDemoRewardedinterstitial = 'ca-app-pub-3940256099942544/5354046379';
const _keyAdAndroidDemoAdvanced = 'ca-app-pub-3940256099942544/2247696110';
const _keyAdAndroidDemoAdvancedvideo = 'ca-app-pub-3940256099942544/1044960115';

enum Configuration {
  debug(
    keyAdAndroidDefinition: _keyAdAndroidDemoBanner,
    keyAdIosDefinition: _keyAdAndroidDemoBanner,
  ),
  release(
    keyAdAndroidDefinition: _keyAdAndroidDefinition,
    keyAdIosDefinition: _keyAdIosDefinition,
  );

  /// The ad unit ID for Definition ad on Android
  final String keyAdAndroidDefinition;

  /// The ad unit ID for Definition ad on iOS
  final String keyAdIosDefinition;

  const Configuration({
    required this.keyAdAndroidDefinition,
    required this.keyAdIosDefinition,
  });

  static const Configuration current =
      kDebugMode ? Configuration.debug : Configuration.release;
}

const a = Configuration.current;