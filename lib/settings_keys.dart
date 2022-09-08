import 'package:shared_preferences/shared_preferences.dart';

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
