// Copyright (c) 2022 Tudlang
// 
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:math';
import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:salita/settings.dart';
import 'package:salita/strings.g.dart';
import 'package:salita/utils/functions.dart';
import '/opensource/adaptive.dart';

import 'drawer.dart';
import 'definition/definition_search.dart';
import '/main.dart';
import '/opensource/wordlist.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({
    super.key,
  });

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScaffoldAdaptive(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        leading: isPlatformDesktop()
            ? null
            : Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Theme.of(context).iconTheme.color,
                  ),
                );
              }),
        actions: [],
      ),
      body: parentOrChild(
        condition: getSettings('display', 'homeBgEnable'),
        parent: (child) => AnimatedBackground(
          behaviour: HomeParticleBehaviour(
            options: HomeParticleOptions(
              wordCount: getSettings('display', 'homeBgWordCount'),
              targetSize: getSettings('display', 'homeBgTargetSize'),
              scaleFactor: getSettings('display', 'homeBgScaleFactor')
            ),
          ),
          vsync: this,
          child: child,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                strings.general.app.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontWeight: FontWeight.w500, fontFamily: 'Raleway'),
              ),
              Text(
                strings.general.app.subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.w500, fontFamily: 'Raleway'),
              ),
              if (isPlatformDesktop())
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: DefinitionSearchField(
                    isAppbar: false,
                  ),
                )
              else
                OutlinedButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: DefinitionSearchDelegate(
                        isOnline: true,
                      ),
                    );
                  },
                  child: Text('Search'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Class containing info for each word in the background
class HomeParticleWord {
  late Offset position;
  late String text;
  late Color color;
  late double size;
  late double targetSize;
}

/// Options for the background
class HomeParticleOptions {
  final int wordCount;
  final double targetSize;
  final int scaleFactor;

  const HomeParticleOptions({
    this.wordCount = 30,
    this.targetSize = 20,
    this.scaleFactor = 10,
  });
}

class HomeParticleBehaviour extends Behaviour {
  static Random random = Random();
  List<HomeParticleWord>? words;
  HomeParticleOptions options;

  HomeParticleBehaviour({
    this.options = const HomeParticleOptions(),
  });

  @override
  void init() {
    words = List.generate(
      options.wordCount,
      (index) => initWord(HomeParticleWord()),
    );
  }

  HomeParticleWord initWord(HomeParticleWord word) {
    word.text = wordlist[random.nextInt(527)];
    word.position = Offset(
      random.nextDouble() * size!.width,
      random.nextDouble() * size!.height,
    );
    word.color = HSVColor.fromAHSV(
      random.nextDouble() * 0.3 + 0.2,
      random.nextInt(45) * 8.0,
      random.nextDouble() * 0.6 + 0.3,
      random.nextDouble() * 0.6 + 0.3,
    ).toColor();
    word.size = 0;
    word.targetSize = random.nextDouble() * options.targetSize + 15;

    return word;
  }

  @override
  void initFrom(Behaviour oldBehaviour) {
    if (oldBehaviour is HomeParticleBehaviour) {
      words = oldBehaviour.words;
    }
  }

  @override
  bool get isInitialized => words != null;

  @override
  void paint(PaintingContext context, Offset offset) {
    for (var word in words!) {
      var paint = TextPainter(
        //textScaleFactor:  word.size/12,
        maxLines: 1,
        text: TextSpan(
          text: word.text,
          style: TextStyle(
            color: word.color,
            fontSize: word.size,
            fontFamily: 'NotoSans-Regular',
            fontFamilyFallback: const [
              'NotoSansEthiopic-Regular',
              'NotoSansBengali-Regular',
              'NotoSansTifinagh-Regular',
              'NotoSansMyanmar-Regular',
              'NotoSansSC-Regular',
              'NotoSansHK-Regular',
              'NotoSansTC-Regular',
              'NotoSansJP-Regular',
              'NotoSansKR-Regular',
              'NotoSansThai-Regular',
            ],
          ),
        ),
        textDirection: TextDirection.ltr,
        //textAlign: TextAlign.right,
        //textScaleFactor: word.size/10
      )..layout();

      paint.paint(context.canvas, word.position);
    }
  }

  @override
  bool tick(double delta, Duration elapsed) {
    if (!isInitialized) return false;

    // logic to make words expand
    for (var word in words!) {
      word.size = word.size + delta * options.scaleFactor;
      //word.size = lerpDouble(formerSize, wor

      if (word.size >= word.targetSize) {
        initWord(word);
      } else if (word.size > word.targetSize - 7) {
        word.color = word.color.withOpacity((word.targetSize - word.size) / 10);
      }
    }
    return true;
  }
}
