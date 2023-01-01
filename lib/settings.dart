// Copyright (c) 2022 Tudlang
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:salita/src/data/wiktionary.dart';
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
  SettingCategory(id: 'display', icon: Icons.monitor_outlined): [
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
  SettingCategory(id: 'definition', icon: Icons.book_outlined): [
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
      defaultval: 'list',
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
      isVisible: !kIsWeb && (Platform.isAndroid || Platform.isIOS)): [],
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
      onTap: () async {
        var prefs = await SharedPreferences.getInstance();
        prefs.clear();
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
  final VoidCallback onTap;
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
  final VoidCallback? onTap;
  final List<T>? options;
  final bool isVisible;
  final bool isAdvanced;
  final String? prerequisiteIdCategory;
  final String? prerequisiteIdTile;

  const SettingTile({
    required this.id,
    required this.key,
    required this.defaultval,
    this.icon = kEmptyIcon,
    this.onTap,
    this.options,
    this.isVisible = true,
    this.isAdvanced = false,
    this.prerequisiteIdCategory,
    this.prerequisiteIdTile,
  });

  void onChanged(T value) {}

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

    print('GET $key  ${value.runtimeType} : $value');

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
    print('SET $key ${value.runtimeType} TO $value');

    return output;
  }

  bool get isEnabled =>
      (prerequisiteIdCategory == null && prerequisiteIdTile == null)
          ? true
          : getSettings(prerequisiteIdCategory!, prerequisiteIdTile!);
}

void _() {}
