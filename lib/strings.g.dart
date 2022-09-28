/// Generated file. Do not edit.
///
/// Locales: 1
/// Strings: 41


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
	late final _StringsDefinitionEn Definition = _StringsDefinitionEn._(_root);
	late final _StringsDefinitionDictionaryEn DefinitionDictionary = _StringsDefinitionDictionaryEn._(_root);
	late final _StringsGeneralEn General = _StringsGeneralEn._(_root);
}

// Path: Definition
class _StringsDefinitionEn {
	_StringsDefinitionEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsDefinitionSnackbarEn snackbar = _StringsDefinitionSnackbarEn._(_root);
	late final _StringsDefinitionHtmlEn html = _StringsDefinitionHtmlEn._(_root);
	late final _StringsDefinitionNamespaceEn namespace = _StringsDefinitionNamespaceEn._(_root);
}

// Path: DefinitionDictionary
class _StringsDefinitionDictionaryEn {
	_StringsDefinitionDictionaryEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Dictionary';
	String get description => 'View definitions';
	late final _StringsDefinitionDictionaryOverviewEn overview = _StringsDefinitionDictionaryOverviewEn._(_root);
	late final _StringsDefinitionDictionarySnackbarEn snackbar = _StringsDefinitionDictionarySnackbarEn._(_root);
}

// Path: General
class _StringsGeneralEn {
	_StringsGeneralEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsGeneralAppEn app = _StringsGeneralAppEn._(_root);
	late final _StringsGeneralTooltipEn tooltip = _StringsGeneralTooltipEn._(_root);
	late final _StringsGeneralSnackbarEn snackbar = _StringsGeneralSnackbarEn._(_root);
}

// Path: Definition.snackbar
class _StringsDefinitionSnackbarEn {
	_StringsDefinitionSnackbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String entryNotExist({required Object title}) => 'Entry \"${title}\" doesn\'t exist yet.';
}

// Path: Definition.html
class _StringsDefinitionHtmlEn {
	_StringsDefinitionHtmlEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsDefinitionHtmlQuotationsEn quotations = _StringsDefinitionHtmlQuotationsEn._(_root);
	late final _StringsDefinitionHtmlTranslationsEn translations = _StringsDefinitionHtmlTranslationsEn._(_root);
	late final _StringsDefinitionHtmlPronounciationsEn pronounciations = _StringsDefinitionHtmlPronounciationsEn._(_root);
	late final _StringsDefinitionHtmlTermlistEn termlist = _StringsDefinitionHtmlTermlistEn._(_root);
}

// Path: Definition.namespace
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

// Path: DefinitionDictionary.overview
class _StringsDefinitionDictionaryOverviewEn {
	_StringsDefinitionDictionaryOverviewEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Overview';
	String get seealso => 'See also';
	late final _StringsDefinitionDictionaryOverviewLanguagesEn languages = _StringsDefinitionDictionaryOverviewLanguagesEn._(_root);
	late final _StringsDefinitionDictionaryOverviewInformationEn information = _StringsDefinitionDictionaryOverviewInformationEn._(_root);
}

// Path: DefinitionDictionary.snackbar
class _StringsDefinitionDictionarySnackbarEn {
	_StringsDefinitionDictionarySnackbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String headingNotExist({required Object language}) => 'Language \"${language}\" doesn\'t exist for this entry.';
}

// Path: General.app
class _StringsGeneralAppEn {
	_StringsGeneralAppEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Salita';
}

// Path: General.tooltip
class _StringsGeneralTooltipEn {
	_StringsGeneralTooltipEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get openInBrowser => 'Open in browser';
	String get refresh => 'Refresh';
	String get search => 'Search';
	String get copyToClipboard => 'Copy to clipboard';
}

// Path: General.snackbar
class _StringsGeneralSnackbarEn {
	_StringsGeneralSnackbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String copyToClipboard({required Object message}) => 'Copied \"${message}\" to clipboard';
	String get noDescription => 'No description provided';
	String get unsupported => 'This feature is currently unsupported.';
}

// Path: Definition.html.quotations
class _StringsDefinitionHtmlQuotationsEn {
	_StringsDefinitionHtmlQuotationsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Quotations';
	String get button => 'View quotations';
}

// Path: Definition.html.translations
class _StringsDefinitionHtmlTranslationsEn {
	_StringsDefinitionHtmlTranslationsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Translations';
	String get button => 'View translations';
}

// Path: Definition.html.pronounciations
class _StringsDefinitionHtmlPronounciationsEn {
	_StringsDefinitionHtmlPronounciationsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Pronounciations';
	String get button => 'View pronounciations';
}

// Path: Definition.html.termlist
class _StringsDefinitionHtmlTermlistEn {
	_StringsDefinitionHtmlTermlistEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Terms';
	String get button => 'View terms';
}

// Path: Definition.namespace.dictionary
class _StringsDefinitionNamespaceDictionaryEn {
	_StringsDefinitionNamespaceDictionaryEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Dictionary';
}

// Path: Definition.namespace.thesaurus
class _StringsDefinitionNamespaceThesaurusEn {
	_StringsDefinitionNamespaceThesaurusEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Thesaurus';
}

// Path: Definition.namespace.rhymes
class _StringsDefinitionNamespaceRhymesEn {
	_StringsDefinitionNamespaceRhymesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Rhymes';
}

// Path: Definition.namespace.reconstruction
class _StringsDefinitionNamespaceReconstructionEn {
	_StringsDefinitionNamespaceReconstructionEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Reconstruction';
}

// Path: Definition.namespace.concordance
class _StringsDefinitionNamespaceConcordanceEn {
	_StringsDefinitionNamespaceConcordanceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Concordance';
}

// Path: Definition.namespace.citations
class _StringsDefinitionNamespaceCitationsEn {
	_StringsDefinitionNamespaceCitationsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Citations';
}

// Path: Definition.namespace.signgloss
class _StringsDefinitionNamespaceSignglossEn {
	_StringsDefinitionNamespaceSignglossEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Sign language gloss';
}

// Path: Definition.namespace.appendix
class _StringsDefinitionNamespaceAppendixEn {
	_StringsDefinitionNamespaceAppendixEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Appendix';
}

// Path: Definition.namespace.index
class _StringsDefinitionNamespaceIndexEn {
	_StringsDefinitionNamespaceIndexEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Index';
}

// Path: Definition.namespace.inflection
class _StringsDefinitionNamespaceInflectionEn {
	_StringsDefinitionNamespaceInflectionEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Inflection';
}

// Path: Definition.namespace.root
class _StringsDefinitionNamespaceRootEn {
	_StringsDefinitionNamespaceRootEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Root';
}

// Path: DefinitionDictionary.overview.languages
class _StringsDefinitionDictionaryOverviewLanguagesEn {
	_StringsDefinitionDictionaryOverviewLanguagesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Languages';
}

// Path: DefinitionDictionary.overview.information
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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'Definition.snackbar.entryNotExist': ({required Object title}) => 'Entry \"${title}\" doesn\'t exist yet.',
			'Definition.html.quotations.title': 'Quotations',
			'Definition.html.quotations.button': 'View quotations',
			'Definition.html.translations.title': 'Translations',
			'Definition.html.translations.button': 'View translations',
			'Definition.html.pronounciations.title': 'Pronounciations',
			'Definition.html.pronounciations.button': 'View pronounciations',
			'Definition.html.termlist.title': 'Terms',
			'Definition.html.termlist.button': 'View terms',
			'Definition.namespace.dictionary.name': 'Dictionary',
			'Definition.namespace.thesaurus.name': 'Thesaurus',
			'Definition.namespace.rhymes.name': 'Rhymes',
			'Definition.namespace.reconstruction.name': 'Reconstruction',
			'Definition.namespace.concordance.name': 'Concordance',
			'Definition.namespace.citations.name': 'Citations',
			'Definition.namespace.signgloss.name': 'Sign language gloss',
			'Definition.namespace.appendix.name': 'Appendix',
			'Definition.namespace.index.name': 'Index',
			'Definition.namespace.inflection.name': 'Inflection',
			'Definition.namespace.root.name': 'Root',
			'DefinitionDictionary.name': 'Dictionary',
			'DefinitionDictionary.description': 'View definitions',
			'DefinitionDictionary.overview.name': 'Overview',
			'DefinitionDictionary.overview.seealso': 'See also',
			'DefinitionDictionary.overview.languages.name': 'Languages',
			'DefinitionDictionary.overview.information.name': 'Entry information',
			'DefinitionDictionary.overview.information.dateRetrieved': 'Date retrieved:',
			'DefinitionDictionary.overview.information.wikititle': 'Full title:',
			'DefinitionDictionary.overview.information.idPage': 'Page ID:',
			'DefinitionDictionary.overview.information.idRevision': 'Revision ID:',
			'DefinitionDictionary.overview.information.wotd': 'Selected for the Word of the Day:',
			'DefinitionDictionary.overview.information.redirect': 'Redirected from:',
			'DefinitionDictionary.snackbar.headingNotExist': ({required Object language}) => 'Language \"${language}\" doesn\'t exist for this entry.',
			'General.app.name': 'Salita',
			'General.tooltip.openInBrowser': 'Open in browser',
			'General.tooltip.refresh': 'Refresh',
			'General.tooltip.search': 'Search',
			'General.tooltip.copyToClipboard': 'Copy to clipboard',
			'General.snackbar.copyToClipboard': ({required Object message}) => 'Copied \"${message}\" to clipboard',
			'General.snackbar.noDescription': 'No description provided',
			'General.snackbar.unsupported': 'This feature is currently unsupported.',
		};
	}
}
