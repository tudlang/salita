// ignore_for_file: avoid_web_libraries_in_flutter

import 'db.dart';
import 'dart:html';

Future<String> post({
  required String url,
  required Map<String, String> body,
}) async{
    return (await HttpRequest.postFormData(url, body)).response;
  }