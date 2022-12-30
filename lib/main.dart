// Copyright (c) 2022 Tudlang
// 
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:io';
import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_split_view/flutter_split_view.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '/src/data/namespace.dart';
import '/src/data/wiktionary.dart';
import '/src/drawer.dart';
import '/src/definition/definition_search.dart';
import 'settings.dart';
import '/src/data/entry.dart';
import '/src/home_activity.dart';
import '/src/settings_activity.dart';
import '/utils/extensions.dart';
import '/src/definition/definition_activity.dart';
import '/src/definition/dictionary/dict_fragment.dart';
import '/opensource/bordertabindicator.dart';

late final SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // get preferences
  prefs = await SharedPreferences.getInstance();

  if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
    MobileAds.instance.initialize();
  }

  runApp(App(
    prefs: prefs,
  ));
}

class App extends StatelessWidget {
  final SharedPreferences prefs;
  App({
    super.key,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {

    final _router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => HomeActivity()),
        GoRoute(
          path: '/definition',
          redirect: (state) => '/definition/',
        ),
        GoRoute(
          path: '/definition/:wikititle',
          builder: (context, state) {
            //print('ROUTE URI: ${state.queryParams}');

            if (kIsWeb) {
              return DefinitionActivity.web(
                key: ValueKey(state.params['wikititle']?.tryDecodeUri()),
                title: state.params['wikititle']?.tryDecodeUri() ?? '',
                // get enum value from string, default to `dictionary`
                mode: SourceWiktionary.fromSettings()
                    .namespaces
                    .singleWhere(
                        (element) =>
                            element.id ==
                            (state.queryParams['mode'] ?? 'dictionary'),
                        orElse: () => const NamespaceDictionary()),
                redirect: state.extra?.toMap()?['redirect'],
                heading: state.queryParams['heading'].tryDecodeUri(),
              );
            }

            return DefinitionActivity(
              key: ValueKey(state.params['wikititle']?.tryDecodeUri()),
              title: state.params['wikititle']?.tryDecodeUri() ?? '',
              // get enum value from string, default to `dictionary`
              mode: SourceWiktionary.fromSettings().namespaces.singleWhere(
                  (element) =>
                      element.id == (state.queryParams['mode'] ?? 'dictionary'),
                  orElse: () => const NamespaceDictionary()),
              isOnline: state.queryParams['online'] == 'true',
              redirect: state.extra?.toMap()?['redirect'],
              heading: state.queryParams['heading'].tryDecodeUri(),
              isWikititle: true,
            );
          },
        ),
        GoRoute(
            path: '/settings', builder: (context, state) => SettingsActivity()),
      ],
    );

    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      //theme: ThemeData,
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(),
        textTheme: TextTheme(
          //displayLarge:
          //    Typography.englishLike2014.displayLarge!.merge(textstyle),
          //displayMedium:
          //    Typography.englishLike2014.displayMedium!.merge(textstyle),
          //displaySmall:
          //    Typography.englishLike2014.displaySmall!.merge(textstyle),
          //headlineLarge:
          //    Typography.englishLike2014.headlineLarge!.merge(textstyle),
          //headlineMedium:
          //    Typography.englishLike2014.headlineMedium!.merge(textstyle),
          //headlineSmall:
          //    Typography.englishLike2014.headlineSmall!.merge(textstyle),
          //titleLarge:
          //    Typography.englishLike2014.titleLarge!.merge(textstyle),
          //titleMedium:
          //    Typography.englishLike2014.titleMedium!.merge(textstyle),
          //titleSmall:
          //    Typography.englishLike2014.titleSmall!.merge(textstyle),
          //bodyLarge:
          //    Typography.englishLike2014.bodyLarge!.merge(textstyle),
          //bodyMedium:
          //    Typography.englishLike2014.bodyMedium!.merge(textstyle),
          //bodySmall:
          //    Typography.englishLike2014.bodyMedium!.merge(textstyle),
          //labelLarge:
          //    Typography.englishLike2014.labelLarge!.merge(textstyle),
          //labelMedium:
          //    Typography.englishLike2014.labelMedium!.merge(textstyle),
          //labelSmall:
          //    Typography.englishLike2014.labelSmall!.merge(textstyle),
          headline1: Typography.blackRedmond.headline1!.merge(textstyle),
          headline2: Typography.blackRedmond.headline2!.merge(textstyle),
          headline3: Typography.blackRedmond.headline3!.merge(textstyle),
          headline4: Typography.blackRedmond.headline4!.merge(textstyle),
          headline5: Typography.blackRedmond.headline5!.merge(textstyle),
          headline6: Typography.blackRedmond.headline6!.merge(textstyle),
          subtitle1: Typography.blackRedmond.subtitle1!.merge(textstyle),
          subtitle2: Typography.blackRedmond.subtitle2!.merge(textstyle),
          bodyText1: Typography.blackRedmond.bodyText1!.merge(textstyle),
          bodyText2: Typography.blackRedmond.bodyText2!.merge(textstyle),
          caption: Typography.blackRedmond.caption!.merge(textstyle),
          button: Typography.blackRedmond.button!.merge(textstyle),
          overline: Typography.blackRedmond.overline!.merge(textstyle),
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.dark(),
        textTheme: TextTheme(
          //displayLarge:
          //    Typography.englishLike2014.displayLarge!.merge(textstyle),
          //displayMedium:
          //    Typography.englishLike2014.displayMedium!.merge(textstyle),
          //displaySmall:
          //    Typography.englishLike2014.displaySmall!.merge(textstyle),
          //headlineLarge:
          //    Typography.englishLike2014.headlineLarge!.merge(textstyle),
          //headlineMedium:
          //    Typography.englishLike2014.headlineMedium!.merge(textstyle),
          //headlineSmall:
          //    Typography.englishLike2014.headlineSmall!.merge(textstyle),
          //titleLarge:
          //    Typography.englishLike2014.titleLarge!.merge(textstyle),
          //titleMedium:
          //    Typography.englishLike2014.titleMedium!.merge(textstyle),
          //titleSmall:
          //    Typography.englishLike2014.titleSmall!.merge(textstyle),
          //bodyLarge:
          //    Typography.englishLike2014.bodyLarge!.merge(textstyle),
          //bodyMedium:
          //    Typography.englishLike2014.bodyMedium!.merge(textstyle),
          //bodySmall:
          //    Typography.englishLike2014.bodyMedium!.merge(textstyle),
          //labelLarge:
          //    Typography.englishLike2014.labelLarge!.merge(textstyle),
          //labelMedium:
          //    Typography.englishLike2014.labelMedium!.merge(textstyle),
          //labelSmall:
          //    Typography.englishLike2014.labelSmall!.merge(textstyle),
          headline1: Typography.whiteRedmond.headline1!.merge(textstyle),
          headline2: Typography.whiteRedmond.headline2!.merge(textstyle),
          headline3: Typography.whiteRedmond.headline3!.merge(textstyle),
          headline4: Typography.whiteRedmond.headline4!.merge(textstyle),
          headline5: Typography.whiteRedmond.headline5!.merge(textstyle),
          headline6: Typography.whiteRedmond.headline6!.merge(textstyle),
          subtitle1: Typography.whiteRedmond.subtitle1!.merge(textstyle),
          subtitle2: Typography.whiteRedmond.subtitle2!.merge(textstyle),
          bodyText1: Typography.whiteRedmond.bodyText1!.merge(textstyle),
          bodyText2: Typography.whiteRedmond.bodyText2!.merge(textstyle),
          caption: Typography.whiteRedmond.caption!.merge(textstyle),
          button: Typography.whiteRedmond.button!.merge(textstyle),
          overline: Typography.whiteRedmond.overline!.merge(textstyle),
        ),
      ).copyWith(
        tooltipTheme: TooltipThemeData(
          waitDuration: Duration(milliseconds: 500),
        ),
      ),
      themeMode: ThemeMode.values.byName(getSettings('display', 'mode')),
      //themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}

const textstyle = TextStyle(
  fontFamily: 'NotoSans-Regular',
  fontFamilyFallback: [
    'NotoKufiArabic-Regular',
    'NotoMusic-Regular',
    'NotoNaskhArabic-Regular',
    'NotoNastaliqUrdu-Regular',
    'NotoRashiHebrew-Regular',
    'NotoSans-Regular',
    'NotoSansAdlam-Regular',
    'NotoSansAdlamUnjoined-Regular',
    'NotoSansAnatolianHieroglyphs-Regular',
    'NotoSansArabic-Regular',
    'NotoSansArabicUI-Regular',
    'NotoSansArmenian-Regular',
    'NotoSansAvestan-Regular',
    'NotoSansBalinese-Regular',
    'NotoSansBamum-Regular',
    'NotoSansBassaVah-Regular',
    'NotoSansBatak-Regular',
    'NotoSansBengali-Regular',
    'NotoSansBengaliUI-Regular',
    'NotoSansBhaiksuki-Regular',
    'NotoSansBrahmi-Regular',
    'NotoSansBuginese-Regular',
    'NotoSansBuhid-Regular',
    'NotoSansCanadianAboriginal-Regular',
    'NotoSansCarian-Regular',
    'NotoSansCaucasianAlbanian-Regular',
    'NotoSansChakma-Regular',
    'NotoSansCham-Regular',
    'NotoSansCherokee-Regular',
    'NotoSansCoptic-Regular',
    'NotoSansCuneiform-Regular',
    'NotoSansCypriot-Regular',
    'NotoSansDeseret-Regular',
    'NotoSansDevanagari-Regular',
    'NotoSansDevanagariUI-Regular',
    'NotoSansDisplay-Regular',
    'NotoSansDuployan-Regular',
    'NotoSansEgyptianHieroglyphs-Regular',
    'NotoSansElbasan-Regular',
    'NotoSansElymaic-Regular',
    'NotoSansEthiopic-Regular',
    'NotoSansGeorgian-Regular',
    'NotoSansGlagolitic-Regular',
    'NotoSansGothic-Regular',
    'NotoSansGrantha-Regular',
    'NotoSansGujarati-Regular',
    'NotoSansGujaratiUI-Regular',
    'NotoSansGunjalaGondi-Regular',
    'NotoSansGurmukhi-Regular',
    'NotoSansGurmukhiUI-Regular',
    'NotoSansHanifiRohingya-Regular',
    'NotoSansHanunoo-Regular',
    'NotoSansHatran-Regular',
    'NotoSansHebrew-Regular',
    'NotoSansImperialAramaic-Regular',
    'NotoSansIndicSiyaqNumbers-Regular',
    'NotoSansInscriptionalPahlavi-Regular',
    'NotoSansInscriptionalParthian-Regular',
    'NotoSansJavanese-Regular',
    'NotoSansKaithi-Regular',
    'NotoSansKannada-Regular',
    'NotoSansKannadaUI-Regular',
    'NotoSansKayahLi-Regular',
    'NotoSansKharoshthi-Regular',
    'NotoSansKhmer-Regular',
    'NotoSansKhmerUI-Regular',
    'NotoSansKhojki-Regular',
    'NotoSansKhudawadi-Regular',
    'NotoSansLao-Regular',
    'NotoSansLaoLooped-Regular',
    'NotoSansLaoUI-Regular',
    'NotoSansLepcha-Regular',
    'NotoSansLimbu-Regular',
    'NotoSansLinearA-Regular',
    'NotoSansLinearB-Regular',
    'NotoSansLisu-Regular',
    'NotoSansLycian-Regular',
    'NotoSansLydian-Regular',
    'NotoSansMahajani-Regular',
    'NotoSansMalayalam-Regular',
    'NotoSansMalayalamUI-Regular',
    'NotoSansMandaic-Regular',
    'NotoSansManichaean-Regular',
    'NotoSansMarchen-Regular',
    'NotoSansMasaramGondi-Regular',
    'NotoSansMath-Regular',
    'NotoSansMayanNumerals-Regular',
    'NotoSansMedefaidrin-Regular',
    'NotoSansMeeteiMayek-Regular',
    'NotoSansMendeKikakui-Regular',
    'NotoSansMeroitic-Regular',
    'NotoSansMiao-Regular',
    'NotoSansModi-Regular',
    'NotoSansMongolian-Regular',
    'NotoSansMro-Regular',
    'NotoSansMultani-Regular',
    'NotoSansMyanmar-Regular',
    'NotoSansMyanmarUI-Regular',
    'NotoSansNabataean-Regular',
    'NotoSansNewa-Regular',
    'NotoSansNewTaiLue-Regular',
    'NotoSansNKo-Regular',
    'NotoSansNushu-Regular',
    'NotoSansOgham-Regular',
    'NotoSansOlChiki-Regular',
    'NotoSansOldHungarian-Regular',
    'NotoSansOldItalic-Regular',
    'NotoSansOldNorthArabian-Regular',
    'NotoSansOldPermic-Regular',
    'NotoSansOldPersian-Regular',
    'NotoSansOldSogdian-Regular',
    'NotoSansOldSouthArabian-Regular',
    'NotoSansOldTurkic-Regular',
    'NotoSansOriya-Regular',
    'NotoSansOriyaUI-Regular',
    'NotoSansOsage-Regular',
    'NotoSansOsmanya-Regular',
    'NotoSansPahawhHmong-Regular',
    'NotoSansPalmyrene-Regular',
    'NotoSansPauCinHau-Regular',
    'NotoSansPhagsPa-Regular',
    'NotoSansPhoenician-Regular',
    'NotoSansPsalterPahlavi-Regular',
    'NotoSansRejang-Regular',
    'NotoSansRunic-Regular',
    'NotoSansSamaritan-Regular',
    'NotoSansSaurashtra-Regular',
    'NotoSansSharada-Regular',
    'NotoSansShavian-Regular',
    'NotoSansSiddham-Regular',
    'NotoSansSignWriting-Regular',
    'NotoSansSinhala-Regular',
    'NotoSansSinhalaUI-Regular',
    'NotoSansSogdian-Regular',
    'NotoSansSoraSompeng-Regular',
    'NotoSansSoyombo-Regular',
    'NotoSansSundanese-Regular',
    'NotoSansSylotiNagri-Regular',
    'NotoSansSymbols-Regular',
    'NotoSansSymbols2-Regular',
    'NotoSansSyriac-Regular',
    'NotoSansTagalog-Regular',
    'NotoSansTagbanwa-Regular',
    'NotoSansTaiLe-Regular',
    'NotoSansTaiTham-Regular',
    'NotoSansTaiViet-Regular',
    'NotoSansTakri-Regular',
    'NotoSansTamil-Regular',
    'NotoSansTamilSupplement-Regular',
    'NotoSansTamilUI-Regular',
    'NotoSansTelugu-Regular',
    'NotoSansTeluguUI-Regular',
    'NotoSansThaana-Regular',
    'NotoSansThai-Regular',
    'NotoSansThaiLooped-Regular',
    'NotoSansThaiUI-Regular',
    'NotoSansTifinaghAdrar-Regular',
    'NotoSansTifinaghAgrawImazighen-Regular',
    'NotoSansTifinaghAhaggar-Regular',
    'NotoSansTifinaghAir-Regular',
    'NotoSansTifinaghAPT-Regular',
    'NotoSansTifinaghAzawagh-Regular',
    'NotoSansTifinaghGhat-Regular',
    'NotoSansTifinaghHawad-Regular',
    'NotoSansTifinagh-Regular',
    'NotoSansTifinaghRhissaIxa-Regular',
    'NotoSansTifinaghSIL-Regular',
    'NotoSansTifinaghTawellemmet-Regular',
    'NotoSansTirhuta-Regular',
    'NotoSansUgaritic-Regular',
    'NotoSansVai-Regular',
    'NotoSansWancho-Regular',
    'NotoSansWarangCiti-Regular',
    'NotoSansYi-Regular',
    'NotoSansZanabazarSquare-Regular',
    'NotoSerifAhom-Regular',
    'NotoSerifDogra-Regular',
    'NotoSerifNyiakengPuachueHmong-Regular',
    'NotoSerifTamilSlanted-Regular',
    'NotoSerifTangut-Regular',
    'NotoSerifTibetan-Regular',
    'NotoSerifYezidi-Regular',
    'NotoTraditionalNushu-Regular',
    'NotoSansSC-Regular',
    'NotoSansHK-Regular',
    'NotoSansTC-Regular',
    'NotoSansJP-Regular',
    'NotoSansKR-Regular',
  ],
);
