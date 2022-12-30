// Copyright (c) 2022 Tudlang
// 
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'db.dart';
import 'package:http/http.dart' as http;

Future<String> post({
  required String url,
  required Map<String, String> body,
}) async {
  return (await http.post(Uri.parse(url), body: body)).body;
}
