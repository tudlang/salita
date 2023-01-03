// Copyright (c) 2022 Tudlang
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:salita/src/data/wiktionary.dart';
import 'package:salita/utils/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

const kEmptyIcon = IconData(0x0020);
/*
abstract class SettingsKeys {
  static Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences? prefs;

  static void clear() {
    settingsDefinitionLanguage = null;
    appDefinitionHistory = null;
  }

  static String get settingsDefinitionLanguage =>
      prefs?.getString('settingsDefinitionLanguage') ?? 'en';
  static set settingsDefinitionLanguage(String? val) => val != null
      ? prefs?.setString('settingsDefinitionLanguage', val)
      : prefs?.remove('settingsDefinitionLanguage');
  static String get settingsDisplayMode =>
      prefs?.getString('settingsDisplayMode') ?? 'system';
  static set settingsDisplayMode(String? val) => val != null
      ? prefs?.setString('settingsDisplayMode', val)
      : prefs?.remove('settingsDisplayMode');

  static List<String> get appDefinitionHistory =>
      prefs?.getStringList('app_definition_history') ?? const [];
  static set appDefinitionHistory(List<String>? val) => val != null
      ? prefs?.setStringList('app_definition_history', val)
      : prefs?.remove('app_definition_history');
}
*/
final Map<SettingCategory, List<SettingTile>> settings = {
  SettingCategory(id: 'display', icon: Icons.monitor): [
    SettingTile<String>(
      id: 'mode',
      key: 'settingsDisplayMode',
      defaultval: 'system',
      options: ['system', 'light', 'dark'],
    ),
    SettingTile<List<String>>(
      id: 'display',
      key: 'settingsDt',
      isVisible: false,
      defaultval: [],
    ),
    SettingTile(id: 'home', key: '', defaultval: null),
    SettingTile<bool>(
      id: 'homeBgEnable',
      key: 'settingsDisplayHomeBgEnable',
      defaultval: true,
    ),
    SettingTile<int>(
      id: 'homeBgWordCount',
      key: 'settingsDisplayHomeBgWordCount',
      defaultval: 30,
      options: [1, 100],
      prerequisiteIdCategory: 'display',
      prerequisiteIdTile: 'homeBgEnable',
      isAdvanced: true,
    ),
    SettingTile<double>(
      id: 'homeBgTargetSize',
      key: 'settingsDisplayHomeBgTargetSize',
      defaultval: 20,
      options: [1, 100],
      prerequisiteIdCategory: 'display',
      prerequisiteIdTile: 'homeBgEnable',
      isAdvanced: true,
    ),
    SettingTile<int>(
      id: 'homeBgScaleFactor',
      key: 'settingsDisplayHomeBgScaleFactor',
      defaultval: 10,
      options: [1, 50],
      prerequisiteIdCategory: 'display',
      prerequisiteIdTile: 'homeBgEnable',
      isAdvanced: true,
    ),
  ],
  SettingCategory(id: 'definition', icon: MdiIcons.bookOpenPageVariant): [
    SettingTile<String>(
      id: 'language',
      key: 'settingsDefinitionLanguage',
      defaultval: 'en',
      isVisible: false,
      options: SourceWiktionary.map.keys.toList(),
    ),
    SettingTile(id: 'edit', key: '', defaultval: null),
    SettingTile(
      id: 'editMode',
      key: 'settingsDefinitionEdit',
      defaultval: false,
    ),
    SettingTile(id: 'overview', key: '', defaultval: null),
    SettingTile<String>(
      id: 'overviewLanguagesListing',
      key: 'settingsDefinitionOverviewLanguageListing',
      defaultval: isPlatformDesktop() ? 'card' : 'list',
      options: ['list', 'card'],
    ),
    SettingTile(
      id: 'overviewShowLanguageExerpt',
      key: 'settingsDefinitionOverviewShowLanguageExerpt',
      defaultval: false,
    ),
    SettingTile(
      id: 'overviewShowIdPage',
      key: 'settingsDefinitionOverviewShowIdPage',
      isAdvanced: true,
      defaultval: false,
    ),
    SettingTile(
      id: 'overviewShowIdRevision',
      key: 'settingsDefinitionOverviewShowIdRevision',
      isAdvanced: true,
      defaultval: false,
    ),
    SettingTile(id: 'html', key: '', defaultval: null),
    SettingTile(
      id: 'htmlSelectableText',
      key: 'settingsDefinitionHtmlSelectableText',
      defaultval: true,
    ),
    SettingTile(
      id: 'htmlShowRaw',
      key: 'settingsDefinitionHtmlShowRaw',
      isAdvanced: true,
      defaultval: false,
    ),
  ],
  SettingCategory(
    id: 'ads',
    icon: MdiIcons.googleAds,
    isVisible: !kIsWeb && (Platform.isAndroid || Platform.isIOS),
  ): [
    SettingTile(id: 'cmp', key: '', defaultval: null),
    SettingTile<bool>(
      id: 'cmpHasConsent',
      key: 'adsCmpHasConsent',
      defaultval: false,
      showIndicator: false,
      onTap: (context) {
        // The completer stuff is when we can access the consent status programmatically
        // Right now, we cannot due to it being stored on native NSUserDefaults(iOS) or SharedPreferences(Android) values which we cannot access directly
        // See https://github.com/InteractiveAdvertisingBureau/GDPR-Transparency-and-Consent-Framework/blob/master/TCFv2/IAB%20Tech%20Lab%20-%20CMP%20API%20v2.md#in-app-details
        //final completer = Completer<bool>();

        ConsentInformation.instance.requestConsentInfoUpdate(
          ConsentRequestParameters(
            consentDebugSettings: ConsentDebugSettings(),
          ),
          () async {
            final status = await ConsentInformation.instance.getConsentStatus();
            printIfDebug("STATUS1: $status");
            if (await ConsentInformation.instance.isConsentFormAvailable()) {
              ConsentForm.loadConsentForm(
                (ConsentForm consentForm) async {
                  consentForm.show((FormError? error) {
                    if (error != null) {
                      debugPrint(error.toString());
                      //completer.complete(false);
                    }

                    //completer.complete(() async {
                    //  final status =
                    //      await ConsentInformation.instance.getConsentStatus();
                    //  printIfDebug("STATUS2: $status");
                    //  // THIS DOES NOT GUARANTEE that "Do not consent" HAS BEEN PRESSED
                    //  // WHYY
                    //  return status == ConsentStatus.obtained;
                    //}());
                  });
                },
                (FormError error) {
                  debugPrint(error.toString());
                  //completer.complete(false);
                },
              );
            }
          },
          (FormError error) {
            debugPrint(error.errorCode.toString());
            debugPrint(error.message);
            //completer.complete(false);
          },
        );
        //return completer.future;
      },
    ),
    // TODO add tiles for seeing the CMP values
    // https://github.com/InteractiveAdvertisingBureau/GDPR-Transparency-and-Consent-Framework/blob/master/TCFv2/IAB%20Tech%20Lab%20-%20CMP%20API%20v2.md
    //SettingTile(
    //  id: 'cmpSdkId',
    //  key: 'IABTCF_CmpSdkID',
    //  subtitle: prefs.get('IABTCF_CmpSdkID').toString(),
    //  defaultval: null,
    //  onTap: (context) async {
    //    final pref = await SharedPreferences.getInstance();
    //    print(pref.get('IABTCF_CmpSdkID').toString());
    //    //Clipboard.setData(ClipboardData(text: ''));
    //  },
    //),
    SettingTile(id: 'adrequest', key: '', defaultval: null, isAdvanced: true),
    SettingTile<int>(
      // in seconds
      id: 'adrequestHttpTimeout',
      key: 'adsAdrequestHttpTimeout',
      // based from https://developers.google.com/android/reference/com/google/android/gms/ads/AdRequest.Builder#public-adrequest.builder-sethttptimeoutmillis-int-httptimeoutmillis
      defaultval: 60,
      isAdvanced: true,
      // because AdRequest.httpTimeoutMillis is only on Android
      isVisible: !kIsWeb && Platform.isAndroid,
      options: [5, 300],
    ),
    SettingTile(
      id: 'adrequestAddKeywords',
      key: 'adsAdrequestAddKeywords',
      defaultval: true,
      isAdvanced: true,
    ),
  ],
  SettingCategory(id: 'miscellaneous', icon: MdiIcons.cogs): [
    SettingTile(
      id: 'advanced',
      key: 'settingsMiscellaneousAdvanced',
      defaultval: false,
    ),
    SettingTile(
      id: 'reset',
      key: '',
      defaultval: null,
      onTap: (context) async {
        var prefs = await SharedPreferences.getInstance();
        prefs.clear();

        // Resets ad consent state
        if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
          ConsentInformation.instance.reset();
        }
      },
    )
  ]
};

dynamic getSettings(
  String categoryId,
  String tileId,
) =>
    settings.entries
        .singleWhere((element) => element.key.id == categoryId)
        .value
        .singleWhere((element) => element.id == tileId)
        .getValue();

Future<bool> setSettings(String categoryId, String tileId, dynamic value) =>
    settings.entries
        .singleWhere((element) => element.key.id == categoryId)
        .value
        .singleWhere((element) => element.id == tileId)
        .setValue(value);

class SettingCategory {
  final String id;
  final IconData icon;
  final void Function() onTap;
  final bool isVisible;

  const SettingCategory({
    required this.id,
    this.icon = kEmptyIcon,
    this.onTap = _,
    this.isVisible = true,
  });
}

class SettingTile<T> {
  final String id;
  final String key;
  final T defaultval;
  final IconData icon;
  final void Function(BuildContext context)? onTap;
  final List<T>? options;
  final bool isVisible;
  final bool isAdvanced;
  final String? subtitle;
  final bool showIndicator;
  final String? prerequisiteIdCategory;
  final String? prerequisiteIdTile;

  /// Called before a value gets changed.
  ///
  /// Return `true` if the new [value] will be saved. <br/>
  /// Return `false` to retain the current `getValue()` value.
  final Future<bool> Function(dynamic value) onChanged;

  ///
  final Future<dynamic> Function(dynamic value)? modifyValue;

  static Future<bool> _onChanged(_) async => true;

  const SettingTile({
    required this.id,
    required this.key,
    required this.defaultval,
    this.icon = kEmptyIcon,
    this.subtitle,
    this.onTap,
    this.onChanged = _onChanged,
    this.options,
    this.isVisible = true,
    this.isAdvanced = false,
    this.showIndicator = true,
    this.prerequisiteIdCategory,
    this.prerequisiteIdTile,
    this.modifyValue,
  });

  dynamic getValue() {
    var value = () {
      switch (defaultval.runtimeType) {
        case String:
          return prefs.getString(key);
        case List<String>:
          return prefs.getStringList(key);
        case bool:
          return prefs.getBool(key);
        case double:
          return prefs.getDouble(key);
        case int:
          return prefs.getInt(key);
        default:
          return null;
      }
    }();

    printIfDebug('GET $key  ${value.runtimeType} : $value');

    return value ?? defaultval;
  }

  Future<bool> setValue(T? value) async {
    final prefs = await SharedPreferences.getInstance();
    bool output = false;

    if (value == null)
      output = await prefs.remove(key);
    else if (value is String)
      output = await prefs.setString(key, value);
    else if (value is List<String>)
      output = await prefs.setStringList(key, value);
    else if (value is bool)
      output = await prefs.setBool(key, value);
    else if (value is double)
      output = await prefs.setDouble(key, value);
    else if (value is int) output = await prefs.setInt(key, value);
    printIfDebug('SET $key ${value.runtimeType} TO $value');

    return output;
  }

  bool get isEnabled =>
      (prerequisiteIdCategory == null && prerequisiteIdTile == null)
          ? true
          : getSettings(prerequisiteIdCategory!, prerequisiteIdTile!);
}

void _() {}
