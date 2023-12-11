// Copyright (c) 2023 Tudlang
// 
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salita/src/drawer.dart';

class CreateActivity extends StatefulWidget {
  const CreateActivity({super.key});

  @override
  State<CreateActivity> createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context)=>_Entry(),
      child: ScaffoldAdaptive(
        title: "Create new entry",
        appBar: AppBar(
        ),
        body: ListView(
          children: [
            
          ],
        ),
      ),
    );
  }
}

class _Entry{
  String name;
  List<_EntryLanguage> languages;
  
  _Entry({this.name='', this.languages=const[],});
}

class _EntryLanguage {
  String id;
  List<_EntryHeading> headings;

  _EntryLanguage({required this.id, required this.headings});
}

class _EntryHeading{
  String name;
  String body;

  _EntryHeading({required this.name, this.body=''});
}
