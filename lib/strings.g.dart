/// Generated file. Do not edit.
///
/// Locales: 1
/// Strings: 85


// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:slang/builder/model/node.dart';
import 'package:slang/slang.dart';
export 'package:slang/slang.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

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
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
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
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

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
	late final _StringsSettingsAdsEn ads = _StringsSettingsAdsEn._(_root);
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

// Path: settings.ads
class _StringsSettingsAdsEn {
	_StringsSettingsAdsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Ads';
	late final _StringsSettingsAdsTilesEn tiles = _StringsSettingsAdsTilesEn._(_root);
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
	late final _StringsSettingsDefinitionTilesOverviewShowLanguageExerptEn overviewShowLanguageExerpt = _StringsSettingsDefinitionTilesOverviewShowLanguageExerptEn._(_root);
	late final _StringsSettingsDefinitionTilesOverviewShowIdPageEn overviewShowIdPage = _StringsSettingsDefinitionTilesOverviewShowIdPageEn._(_root);
	late final _StringsSettingsDefinitionTilesOverviewShowIdRevisionEn overviewShowIdRevision = _StringsSettingsDefinitionTilesOverviewShowIdRevisionEn._(_root);
	String get html => 'HTML settings';
	late final _StringsSettingsDefinitionTilesHtmlSelectableTextEn htmlSelectableText = _StringsSettingsDefinitionTilesHtmlSelectableTextEn._(_root);
	late final _StringsSettingsDefinitionTilesHtmlShowRawEn htmlShowRaw = _StringsSettingsDefinitionTilesHtmlShowRawEn._(_root);
}

// Path: settings.ads.tiles
class _StringsSettingsAdsTilesEn {
	_StringsSettingsAdsTilesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get adrequest => 'AdRequest settings';
	late final _StringsSettingsAdsTilesAdrequestHttpTimeoutEn adrequestHttpTimeout = _StringsSettingsAdsTilesAdrequestHttpTimeoutEn._(_root);
	late final _StringsSettingsAdsTilesAdrequestAddKeywordsEn adrequestAddKeywords = _StringsSettingsAdsTilesAdrequestAddKeywordsEn._(_root);
	String get cmp => 'GDPR Transparency and Consent Framework';
	late final _StringsSettingsAdsTilesCmpHasConsentEn cmpHasConsent = _StringsSettingsAdsTilesCmpHasConsentEn._(_root);
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

// Path: settings.definition.tiles.overviewShowLanguageExerpt
class _StringsSettingsDefinitionTilesOverviewShowLanguageExerptEn {
	_StringsSettingsDefinitionTilesOverviewShowLanguageExerptEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Show definition exerpt for each language';
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

// Path: settings.definition.tiles.htmlSelectableText
class _StringsSettingsDefinitionTilesHtmlSelectableTextEn {
	_StringsSettingsDefinitionTilesHtmlSelectableTextEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Make text selectable';
}

// Path: settings.definition.tiles.htmlShowRaw
class _StringsSettingsDefinitionTilesHtmlShowRawEn {
	_StringsSettingsDefinitionTilesHtmlShowRawEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Show raw HTML';
	String get subtitle => 'Shows a button to toggle between seeing the raw HTML and the rendered result. May decrease performance.';
}

// Path: settings.ads.tiles.adrequestHttpTimeout
class _StringsSettingsAdsTilesAdrequestHttpTimeoutEn {
	_StringsSettingsAdsTilesAdrequestHttpTimeoutEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'HTTPS call timeout';
	String get subtitle => 'The timeout in milliseconds for HTTPS calls made by the Google Mobile Ads SDK during an ad request';
}

// Path: settings.ads.tiles.adrequestAddKeywords
class _StringsSettingsAdsTilesAdrequestAddKeywordsEn {
	_StringsSettingsAdsTilesAdrequestAddKeywordsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Add entry details as keywords';
	String get subtitle => 'Whether to add details of the currently viewed entry as keywords for the ad request';
}

// Path: settings.ads.tiles.cmpHasConsent
class _StringsSettingsAdsTilesCmpHasConsentEn {
	_StringsSettingsAdsTilesCmpHasConsentEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Consent settings';
	String get subtitle => 'You need to provide consent to show personalized ads';
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
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'definition.snackbar.entryNotExist': return ({required Object title}) => 'Entry \"${title}\" doesn\'t exist yet.';
			case 'definition.html.quotations.title': return 'Quotations';
			case 'definition.html.quotations.button': return 'View quotations';
			case 'definition.html.translations.title': return 'Translations';
			case 'definition.html.translations.button': return 'View translations';
			case 'definition.html.pronounciations.title': return 'Pronounciations';
			case 'definition.html.pronounciations.button': return 'View pronounciations';
			case 'definition.html.termlist.title': return 'Terms';
			case 'definition.html.termlist.button': return 'View terms';
			case 'definition.namespace.dictionary.name': return 'Dictionary';
			case 'definition.namespace.thesaurus.name': return 'Thesaurus';
			case 'definition.namespace.rhymes.name': return 'Rhymes';
			case 'definition.namespace.reconstruction.name': return 'Reconstruction';
			case 'definition.namespace.concordance.name': return 'Concordance';
			case 'definition.namespace.citations.name': return 'Citations';
			case 'definition.namespace.signgloss.name': return 'Sign language gloss';
			case 'definition.namespace.appendix.name': return 'Appendix';
			case 'definition.namespace.index.name': return 'Index';
			case 'definition.namespace.inflection.name': return 'Inflection';
			case 'definition.namespace.root.name': return 'Root';
			case 'definitionDictionary.name': return 'Dictionary';
			case 'definitionDictionary.description': return 'View definitions';
			case 'definitionDictionary.overview.name': return 'Overview';
			case 'definitionDictionary.overview.seealso': return 'See also';
			case 'definitionDictionary.overview.languages.name': return 'Languages';
			case 'definitionDictionary.overview.information.name': return 'Entry information';
			case 'definitionDictionary.overview.information.dateRetrieved': return 'Date retrieved:';
			case 'definitionDictionary.overview.information.wikititle': return 'Full title:';
			case 'definitionDictionary.overview.information.idPage': return 'Page ID:';
			case 'definitionDictionary.overview.information.idRevision': return 'Revision ID:';
			case 'definitionDictionary.overview.information.wotd': return 'Selected for the Word of the Day:';
			case 'definitionDictionary.overview.information.redirect': return 'Redirected from:';
			case 'definitionDictionary.snackbar.headingNotExist': return ({required Object language}) => 'Language \"${language}\" doesn\'t exist for this entry.';
			case 'general.app.title': return 'Salita';
			case 'general.app.subtitle': return 'All-in-one Dictionary';
			case 'general.tooltip.openInBrowser': return 'Open in browser';
			case 'general.tooltip.refresh': return 'Refresh';
			case 'general.tooltip.search': return 'Search';
			case 'general.tooltip.copyToClipboard': return 'Copy to clipboard';
			case 'general.snackbar.copyToClipboard': return ({required Object message}) => 'Copied \"${message}\" to clipboard';
			case 'general.snackbar.noDescription': return 'No description provided';
			case 'general.snackbar.unsupported': return 'This feature is currently unsupported.';
			case 'settings.display.title': return 'Display';
			case 'settings.display.tiles.mode.title': return 'Display mode';
			case 'settings.display.tiles.mode.options.system': return 'Use system default';
			case 'settings.display.tiles.mode.options.light': return 'Light mode';
			case 'settings.display.tiles.mode.options.dark': return 'Dark mode';
			case 'settings.display.tiles.home': return 'Home settings';
			case 'settings.display.tiles.homeBgEnable.title': return 'Animated background';
			case 'settings.display.tiles.homeBgEnable.subtitle': return 'Enables the cool animated background in the home screen';
			case 'settings.display.tiles.homeBgWordCount.title': return 'Animated background word count';
			case 'settings.display.tiles.homeBgWordCount.subtitle': return 'The maximum number of words to show at a single time';
			case 'settings.display.tiles.homeBgTargetSize.title': return 'Animated background word size';
			case 'settings.display.tiles.homeBgTargetSize.subtitle': return 'The maximum size each word can grow';
			case 'settings.display.tiles.homeBgScaleFactor.title': return 'Animated background word growth';
			case 'settings.display.tiles.homeBgScaleFactor.subtitle': return 'The speed of size growth for each word';
			case 'settings.definition.title': return 'Definition';
			case 'settings.definition.tiles.edit': return 'Editing settings';
			case 'settings.definition.tiles.editMode.title': return 'Enable edit mode';
			case 'settings.definition.tiles.overview': return 'Overview settings';
			case 'settings.definition.tiles.overviewLanguagesListing.title': return 'Language list type';
			case 'settings.definition.tiles.overviewLanguagesListing.subtitle': return 'Controls how languges should be listed in the Overview';
			case 'settings.definition.tiles.overviewLanguagesListing.options.list': return 'List';
			case 'settings.definition.tiles.overviewLanguagesListing.options.card': return 'Card';
			case 'settings.definition.tiles.overviewShowLanguageExerpt.title': return 'Show definition exerpt for each language';
			case 'settings.definition.tiles.overviewShowIdPage.title': return 'Show Wiktionary page ID';
			case 'settings.definition.tiles.overviewShowIdRevision.title': return 'Show Wiktionary revision ID';
			case 'settings.definition.tiles.html': return 'HTML settings';
			case 'settings.definition.tiles.htmlSelectableText.title': return 'Make text selectable';
			case 'settings.definition.tiles.htmlShowRaw.title': return 'Show raw HTML';
			case 'settings.definition.tiles.htmlShowRaw.subtitle': return 'Shows a button to toggle between seeing the raw HTML and the rendered result. May decrease performance.';
			case 'settings.ads.title': return 'Ads';
			case 'settings.ads.tiles.adrequest': return 'AdRequest settings';
			case 'settings.ads.tiles.adrequestHttpTimeout.title': return 'HTTPS call timeout';
			case 'settings.ads.tiles.adrequestHttpTimeout.subtitle': return 'The timeout in milliseconds for HTTPS calls made by the Google Mobile Ads SDK during an ad request';
			case 'settings.ads.tiles.adrequestAddKeywords.title': return 'Add entry details as keywords';
			case 'settings.ads.tiles.adrequestAddKeywords.subtitle': return 'Whether to add details of the currently viewed entry as keywords for the ad request';
			case 'settings.ads.tiles.cmp': return 'GDPR Transparency and Consent Framework';
			case 'settings.ads.tiles.cmpHasConsent.title': return 'Consent settings';
			case 'settings.ads.tiles.cmpHasConsent.subtitle': return 'You need to provide consent to show personalized ads';
			case 'settings.miscellaneous.title': return 'Miscellaneous';
			case 'settings.miscellaneous.tiles.advanced.title': return 'Show advanced settings';
			case 'settings.miscellaneous.tiles.advanced.subtitle': return 'Advanced settings are preceeded with a \"\uD83C\uDD30\"';
			case 'settings.miscellaneous.tiles.reset.title': return 'Reset';
			case 'settings.miscellaneous.tiles.reset.subtitle': return 'Resets all settings to their default values';
			default: return null;
		}
	}
}
