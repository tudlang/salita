import 'dart:io';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
//import 'package:sqflite/sqflite.dart';

void main(List<String> args) async {
  sqfliteFfiInit();

  var db = await databaseFactoryFfi.openDatabase('C:/Programming/salita/db/en.db');
  await db.execute('''
  CREATE TABLE Product (
      id INTEGER PRIMARY KEY,
      title TEXT
  )
  ''');
  await db.insert('Product', <String, Object?>{'title': 'Product 1'});
  await db.insert('Product', <String, Object?>{'title': 'Product 1'});

}
