/// Generated file. Do not edit.
///
/// Locales: 1
/// Strings: 71


// coverage:ignore-file
// ignore_for_file: type=lint


import 'package:slang/slang.dart';
export 'package:slang/slang.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<_StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<_StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of strings).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = strings.someKey.anotherKey;
/// String b = strings['someKey.anotherKey']; // Only for edge cases!
_StringsEn get strings => LocaleSettings.instance.currentTranslations;

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(
		locales: AppLocale.values,
		baseLocale: _baseLocale,
		utils: AppLocaleUtils.instance,
	);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale) => instance.setLocale(locale);
	static AppLocale setLocaleRaw(String rawLocale) => instance.setLocaleRaw(rawLocale);
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: _cardinalResolver = cardinalResolver,
		  _ordinalResolver = ordinalResolver;

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	final PluralResolver? _cardinalResolver; // ignore: unused_field
	final PluralResolver? _ordinalResolver; // ignore: unused_field

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsDefinitionEn definition = _StringsDefinitionEn._(_root);
	late final _StringsDefinitionDictionaryEn definitionDictionary = _StringsDefinitionDictionaryEn._(_root);
	late final _StringsGeneralEn general = _StringsGeneralEn._(_root);
	late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
}

// Path: definition
class _StringsDefinitionEn {
	_StringsDefinitionEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsDefinitionSnackbarEn snackbar = _StringsDefinitionSnackbarEn._(_root);
	late final _StringsDefinitionHtmlEn html = _StringsDefinitionHtmlEn._(_root);
	late final _StringsDefinitionNamespaceEn namespace = _StringsDefinitionNamespaceEn._(_root);
}

// Path: definitionDictionary
class _StringsDefinitionDictionaryEn {
	_StringsDefinitionDictionaryEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Dictionary';
	String get description => 'View definitions';
	late final _StringsDefinitionDictionaryOverviewEn overview = _StringsDefinitionDictionaryOverviewEn._(_root);
	late final _StringsDefinitionDictionarySnackbarEn snackbar = _StringsDefinitionDictionarySnackbarEn._(_root);
}

// Path: general
class _StringsGeneralEn {
	_StringsGeneralEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsGeneralAppEn app = _StringsGeneralAppEn._(_root);
	late final _StringsGeneralTooltipEn tooltip = _StringsGeneralTooltipEn._(_root);
	late final _StringsGeneralSnackbarEn snackbar = _StringsGeneralSnackbarEn._(_root);
}

// Path: settings
class _StringsSettingsEn {
	_StringsSettingsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsSettingsDisplayEn display = _StringsSettingsDisplayEn._(_root);
	late final _StringsSettingsDefinitionEn definition = _StringsSettingsDefinitionEn._(_root);
	late final _StringsSettingsMiscellaneousEn miscellaneous = _StringsSettingsMiscellaneousEn._(_root);
}

// Path: definition.snackbar
class _StringsDefinitionSnackbarEn {
	_StringsDefinitionSnackbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String entryNotExist({required Object title}) => 'Entry \"${title}\" doesn\'t exist yet.';
}

// Path: definition.html
class _StringsDefinitionHtmlEn {
	_StringsDefinitionHtmlEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsDefinitionHtmlQuotationsEn quotations = _StringsDefinitionHtmlQuotationsEn._(_root);
	late final _StringsDefinitionHtmlTranslationsEn translations = _StringsDefinitionHtmlTranslationsEn._(_root);
	late final _StringsDefinitionHtmlPronounciationsEn pronounciations = _StringsDefinitionHtmlPronounciationsEn._(_root);
	late final _StringsDefinitionHtmlTermlistEn termlist = _StringsDefinitionHtmlTermlistEn._(_root);
}

// Path: definition.namespace
class _StringsDefinitionNamespaceEn {
	_StringsDefinitionNamespaceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsDefinitionNamespaceDictionaryEn dictionary = _StringsDefinitionNamespaceDictionaryEn._(_root);
	late final _StringsDefinitionNamespaceThesaurusEn thesaurus = _StringsDefinitionNamespaceThesaurusEn._(_root);
	late final _StringsDefinitionNamespaceRhymesEn rhymes = _StringsDefinitionNamespaceRhymesEn._(_root);
	late final _StringsDefinitionNamespaceReconstructionEn reconstruction = _StringsDefinitionNamespaceReconstructionEn._(_root);
	late final _StringsDefinitionNamespaceConcordanceEn concordance = _StringsDefinitionNamespaceConcordanceEn._(_root);
	late final _StringsDefinitionNamespaceCitationsEn citations = _StringsDefinitionNamespaceCitationsEn._(_root);
	late final _StringsDefinitionNamespaceSignglossEn signgloss = _StringsDefinitionNamespaceSignglossEn._(_root);
	late final _StringsDefinitionNamespaceAppendixEn appendix = _StringsDefinitionNamespaceAppendixEn._(_root);
	late final _StringsDefinitionNamespaceIndexEn index = _StringsDefinitionNamespaceIndexEn._(_root);
	late final _StringsDefinitionNamespaceInflectionEn inflection = _StringsDefinitionNamespaceInflectionEn._(_root);
	late final _StringsDefinitionNamespaceRootEn root = _StringsDefinitionNamespaceRootEn._(_root);
}

// Path: definitionDictionary.overview
class _StringsDefinitionDictionaryOverviewEn {
	_StringsDefinitionDictionaryOverviewEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Overview';
	String get seealso => 'See also';
	late final _StringsDefinitionDictionaryOverviewLanguagesEn languages = _StringsDefinitionDictionaryOverviewLanguagesEn._(_root);
	late final _StringsDefinitionDictionaryOverviewInformationEn information = _StringsDefinitionDictionaryOverviewInformationEn._(_root);
}

// Path: definitionDictionary.snackbar
class _StringsDefinitionDictionarySnackbarEn {
	_StringsDefinitionDictionarySnackbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String headingNotExist({required Object language}) => 'Language \"${language}\" doesn\'t exist for this entry.';
}

// Path: general.app
class _StringsGeneralAppEn {
	_StringsGeneralAppEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Salita';
	String get subtitle => 'All-in-one Dictionary';
}

// Path: general.tooltip
class _StringsGeneralTooltipEn {
	_StringsGeneralTooltipEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get openInBrowser => 'Open in browser';
	String get refresh => 'Refresh';
	String get search => 'Search';
	String get copyToClipboard => 'Copy to clipboard';
}

// Path: general.snackbar
class _StringsGeneralSnackbarEn {
	_StringsGeneralSnackbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String copyToClipboard({required Object message}) => 'Copied \"${message}\" to clipboard';
	String get noDescription => 'No description provided';
	String get unsupported => 'This feature is currently unsupported.';
}

// Path: settings.display
class _StringsSettingsDisplayEn {
	_StringsSettingsDisplayEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Display';
	late final _StringsSettingsDisplayTilesEn tiles = _StringsSettingsDisplayTilesEn._(_root);
}

// Path: settings.definition
class _StringsSettingsDefinitionEn {
	_StringsSettingsDefinitionEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Definition';
	late final _StringsSettingsDefinitionTilesEn tiles = _StringsSettingsDefinitionTilesEn._(_root);
}

// Path: settings.miscellaneous
class _StringsSettingsMiscellaneousEn {
	_StringsSettingsMiscellaneousEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Miscellaneous';
	late final _StringsSettingsMiscellaneousTilesEn tiles = _StringsSettingsMiscellaneousTilesEn._(_root);
}

// Path: definition.html.quotations
class _StringsDefinitionHtmlQuotationsEn {
	_StringsDefinitionHtmlQuotationsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Quotations';
	String get button => 'View quotations';
}

// Path: definition.html.translations
class _StringsDefinitionHtmlTranslationsEn {
	_StringsDefinitionHtmlTranslationsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Translations';
	String get button => 'View translations';
}

// Path: definition.html.pronounciations
class _StringsDefinitionHtmlPronounciationsEn {
	_StringsDefinitionHtmlPronounciationsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Pronounciations';
	String get button => 'View pronounciations';
}

// Path: definition.html.termlist
class _StringsDefinitionHtmlTermlistEn {
	_StringsDefinitionHtmlTermlistEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Terms';
	String get button => 'View terms';
}

// Path: definition.namespace.dictionary
class _StringsDefinitionNamespaceDictionaryEn {
	_StringsDefinitionNamespaceDictionaryEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Dictionary';
}

// Path: definition.namespace.thesaurus
class _StringsDefinitionNamespaceThesaurusEn {
	_StringsDefinitionNamespaceThesaurusEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Thesaurus';
}

// Path: definition.namespace.rhymes
class _StringsDefinitionNamespaceRhymesEn {
	_StringsDefinitionNamespaceRhymesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Rhymes';
}

// Path: definition.namespace.reconstruction
class _StringsDefinitionNamespaceReconstructionEn {
	_StringsDefinitionNamespaceReconstructionEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Reconstruction';
}

// Path: definition.namespace.concordance
class _StringsDefinitionNamespaceConcordanceEn {
	_StringsDefinitionNamespaceConcordanceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Concordance';
}

// Path: definition.namespace.citations
class _StringsDefinitionNamespaceCitationsEn {
	_StringsDefinitionNamespaceCitationsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Citations';
}

// Path: definition.namespace.signgloss
class _StringsDefinitionNamespaceSignglossEn {
	_StringsDefinitionNamespaceSignglossEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Sign language gloss';
}

// Path: definition.namespace.appendix
class _StringsDefinitionNamespaceAppendixEn {
	_StringsDefinitionNamespaceAppendixEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Appendix';
}

// Path: definition.namespace.index
class _StringsDefinitionNamespaceIndexEn {
	_StringsDefinitionNamespaceIndexEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Index';
}

// Path: definition.namespace.inflection
class _StringsDefinitionNamespaceInflectionEn {
	_StringsDefinitionNamespaceInflectionEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Inflection';
}

// Path: definition.namespace.root
class _StringsDefinitionNamespaceRootEn {
	_StringsDefinitionNamespaceRootEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Root';
}

// Path: definitionDictionary.overview.languages
class _StringsDefinitionDictionaryOverviewLanguagesEn {
	_StringsDefinitionDictionaryOverviewLanguagesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Languages';
}

// Path: definitionDictionary.overview.information
class _StringsDefinitionDictionaryOverviewInformationEn {
	_StringsDefinitionDictionaryOverviewInformationEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Entry information';
	String get dateRetrieved => 'Date retrieved:';
	String get wikititle => 'Full title:';
	String get idPage => 'Page ID:';
	String get idRevision => 'Revision ID:';
	String get wotd => 'Selected for the Word of the Day:';
	String get redirect => 'Redirected from:';
}

// Path: settings.display.tiles
class _StringsSettingsDisplayTilesEn {
	_StringsSettingsDisplayTilesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsSettingsDisplayTilesModeEn mode = _StringsSettingsDisplayTilesModeEn._(_root);
	String get home => 'Home settings';
	late final _StringsSettingsDisplayTilesHomeBgEnableEn homeBgEnable = _StringsSettingsDisplayTilesHomeBgEnableEn._(_root);
	late final _StringsSettingsDisplayTilesHomeBgWordCountEn homeBgWordCount = _StringsSettingsDisplayTilesHomeBgWordCountEn._(_root);
	late final _StringsSettingsDisplayTilesHomeBgTargetSizeEn homeBgTargetSize = _StringsSettingsDisplayTilesHomeBgTargetSizeEn._(_root);
	late final _StringsSettingsDisplayTilesHomeBgScaleFactorEn homeBgScaleFactor = _StringsSettingsDisplayTilesHomeBgScaleFactorEn._(_root);
}

// Path: settings.definition.tiles
class _StringsSettingsDefinitionTilesEn {
	_StringsSettingsDefinitionTilesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get edit => 'Editing settings';
	late final _StringsSettingsDefinitionTilesEditModeEn editMode = _StringsSettingsDefinitionTilesEditModeEn._(_root);
	String get overview => 'Overview settings';
	late final _StringsSettingsDefinitionTilesOverviewLanguagesListingEn overviewLanguagesListing = _StringsSettingsDefinitionTilesOverviewLanguagesListingEn._(_root);
	late final _StringsSettingsDefinitionTilesOverviewShowIdPageEn overviewShowIdPage = _StringsSettingsDefinitionTilesOverviewShowIdPageEn._(_root);
	late final _StringsSettingsDefinitionTilesOverviewShowIdRevisionEn overviewShowIdRevision = _StringsSettingsDefinitionTilesOverviewShowIdRevisionEn._(_root);
}

// Path: settings.miscellaneous.tiles
class _StringsSettingsMiscellaneousTilesEn {
	_StringsSettingsMiscellaneousTilesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsSettingsMiscellaneousTilesAdvancedEn advanced = _StringsSettingsMiscellaneousTilesAdvancedEn._(_root);
	late final _StringsSettingsMiscellaneousTilesResetEn reset = _StringsSettingsMiscellaneousTilesResetEn._(_root);
}

// Path: settings.display.tiles.mode
class _StringsSettingsDisplayTilesModeEn {
	_StringsSettingsDisplayTilesModeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Display mode';
	late final _StringsSettingsDisplayTilesModeOptionsEn options = _StringsSettingsDisplayTilesModeOptionsEn._(_root);
}

// Path: settings.display.tiles.homeBgEnable
class _StringsSettingsDisplayTilesHomeBgEnableEn {
	_StringsSettingsDisplayTilesHomeBgEnableEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Animated background';
	String get subtitle => 'Enables the cool animated background in the home screen';
}

// Path: settings.display.tiles.homeBgWordCount
class _StringsSettingsDisplayTilesHomeBgWordCountEn {
	_StringsSettingsDisplayTilesHomeBgWordCountEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Animated background word count';
	String get subtitle => 'The maximum number of words to show at a single time';
}

// Path: settings.display.tiles.homeBgTargetSize
class _StringsSettingsDisplayTilesHomeBgTargetSizeEn {
	_StringsSettingsDisplayTilesHomeBgTargetSizeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Animated background word size';
	String get subtitle => 'The maximum size each word can grow';
}

// Path: settings.display.tiles.homeBgScaleFactor
class _StringsSettingsDisplayTilesHomeBgScaleFactorEn {
	_StringsSettingsDisplayTilesHomeBgScaleFactorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Animated background word growth';
	String get subtitle => 'The speed of size growth for each word';
}

// Path: settings.definition.tiles.editMode
class _StringsSettingsDefinitionTilesEditModeEn {
	_StringsSettingsDefinitionTilesEditModeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Enable edit mode';
}

// Path: settings.definition.tiles.overviewLanguagesListing
class _StringsSettingsDefinitionTilesOverviewLanguagesListingEn {
	_StringsSettingsDefinitionTilesOverviewLanguagesListingEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Language list type';
	String get subtitle => 'Controls how languges should be listed in the Overview';
	late final _StringsSettingsDefinitionTilesOverviewLanguagesListingOptionsEn options = _StringsSettingsDefinitionTilesOverviewLanguagesListingOptionsEn._(_root);
}

// Path: settings.definition.tiles.overviewShowIdPage
class _StringsSettingsDefinitionTilesOverviewShowIdPageEn {
	_StringsSettingsDefinitionTilesOverviewShowIdPageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Show Wiktionary page ID';
}

// Path: settings.definition.tiles.overviewShowIdRevision
class _StringsSettingsDefinitionTilesOverviewShowIdRevisionEn {
	_StringsSettingsDefinitionTilesOverviewShowIdRevisionEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Show Wiktionary revision ID';
}

// Path: settings.miscellaneous.tiles.advanced
class _StringsSettingsMiscellaneousTilesAdvancedEn {
	_StringsSettingsMiscellaneousTilesAdvancedEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Show advanced settings';
	String get subtitle => 'Advanced settings are preceeded with a \"\uD83C\uDD30\"';
}

// Path: settings.miscellaneous.tiles.reset
class _StringsSettingsMiscellaneousTilesResetEn {
	_StringsSettingsMiscellaneousTilesResetEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Reset';
	String get subtitle => 'Resets all settings to their default values';
}

// Path: settings.display.tiles.mode.options
class _StringsSettingsDisplayTilesModeOptionsEn {
	_StringsSettingsDisplayTilesModeOptionsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get system => 'Use system default';
	String get light => 'Light mode';
	String get dark => 'Dark mode';
}

// Path: settings.definition.tiles.overviewLanguagesListing.options
class _StringsSettingsDefinitionTilesOverviewLanguagesListingOptionsEn {
	_StringsSettingsDefinitionTilesOverviewLanguagesListingOptionsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get list => 'List';
	String get card => 'Card';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'definition.snackbar.entryNotExist': ({required Object title}) => 'Entry \"${title}\" doesn\'t exist yet.',
			'definition.html.quotations.title': 'Quotations',
			'definition.html.quotations.button': 'View quotations',
			'definition.html.translations.title': 'Translations',
			'definition.html.translations.button': 'View translations',
			'definition.html.pronounciations.title': 'Pronounciations',
			'definition.html.pronounciations.button': 'View pronounciations',
			'definition.html.termlist.title': 'Terms',
			'definition.html.termlist.button': 'View terms',
			'definition.namespace.dictionary.name': 'Dictionary',
			'definition.namespace.thesaurus.name': 'Thesaurus',
			'definition.namespace.rhymes.name': 'Rhymes',
			'definition.namespace.reconstruction.name': 'Reconstruction',
			'definition.namespace.concordance.name': 'Concordance',
			'definition.namespace.citations.name': 'Citations',
			'definition.namespace.signgloss.name': 'Sign language gloss',
			'definition.namespace.appendix.name': 'Appendix',
			'definition.namespace.index.name': 'Index',
			'definition.namespace.inflection.name': 'Inflection',
			'definition.namespace.root.name': 'Root',
			'definitionDictionary.name': 'Dictionary',
			'definitionDictionary.description': 'View definitions',
			'definitionDictionary.overview.name': 'Overview',
			'definitionDictionary.overview.seealso': 'See also',
			'definitionDictionary.overview.languages.name': 'Languages',
			'definitionDictionary.overview.information.name': 'Entry information',
			'definitionDictionary.overview.information.dateRetrieved': 'Date retrieved:',
			'definitionDictionary.overview.information.wikititle': 'Full title:',
			'definitionDictionary.overview.information.idPage': 'Page ID:',
			'definitionDictionary.overview.information.idRevision': 'Revision ID:',
			'definitionDictionary.overview.information.wotd': 'Selected for the Word of the Day:',
			'definitionDictionary.overview.information.redirect': 'Redirected from:',
			'definitionDictionary.snackbar.headingNotExist': ({required Object language}) => 'Language \"${language}\" doesn\'t exist for this entry.',
			'general.app.title': 'Salita',
			'general.app.subtitle': 'All-in-one Dictionary',
			'general.tooltip.openInBrowser': 'Open in browser',
			'general.tooltip.refresh': 'Refresh',
			'general.tooltip.search': 'Search',
			'general.tooltip.copyToClipboard': 'Copy to clipboard',
			'general.snackbar.copyToClipboard': ({required Object message}) => 'Copied \"${message}\" to clipboard',
			'general.snackbar.noDescription': 'No description provided',
			'general.snackbar.unsupported': 'This feature is currently unsupported.',
			'settings.display.title': 'Display',
			'settings.display.tiles.mode.title': 'Display mode',
			'settings.display.tiles.mode.options.system': 'Use system default',
			'settings.display.tiles.mode.options.light': 'Light mode',
			'settings.display.tiles.mode.options.dark': 'Dark mode',
			'settings.display.tiles.home': 'Home settings',
			'settings.display.tiles.homeBgEnable.title': 'Animated background',
			'settings.display.tiles.homeBgEnable.subtitle': 'Enables the cool animated background in the home screen',
			'settings.display.tiles.homeBgWordCount.title': 'Animated background word count',
			'settings.display.tiles.homeBgWordCount.subtitle': 'The maximum number of words to show at a single time',
			'settings.display.tiles.homeBgTargetSize.title': 'Animated background word size',
			'settings.display.tiles.homeBgTargetSize.subtitle': 'The maximum size each word can grow',
			'settings.display.tiles.homeBgScaleFactor.title': 'Animated background word growth',
			'settings.display.tiles.homeBgScaleFactor.subtitle': 'The speed of size growth for each word',
			'settings.definition.title': 'Definition',
			'settings.definition.tiles.edit': 'Editing settings',
			'settings.definition.tiles.editMode.title': 'Enable edit mode',
			'settings.definition.tiles.overview': 'Overview settings',
			'settings.definition.tiles.overviewLanguagesListing.title': 'Language list type',
			'settings.definition.tiles.overviewLanguagesListing.subtitle': 'Controls how languges should be listed in the Overview',
			'settings.definition.tiles.overviewLanguagesListing.options.list': 'List',
			'settings.definition.tiles.overviewLanguagesListing.options.card': 'Card',
			'settings.definition.tiles.overviewShowIdPage.title': 'Show Wiktionary page ID',
			'settings.definition.tiles.overviewShowIdRevision.title': 'Show Wiktionary revision ID',
			'settings.miscellaneous.title': 'Miscellaneous',
			'settings.miscellaneous.tiles.advanced.title': 'Show advanced settings',
			'settings.miscellaneous.tiles.advanced.subtitle': 'Advanced settings are preceeded with a \"\uD83C\uDD30\"',
			'settings.miscellaneous.tiles.reset.title': 'Reset',
			'settings.miscellaneous.tiles.reset.subtitle': 'Resets all settings to their default values',
		};
	}
}
