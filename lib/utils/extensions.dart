import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart' hide Element;
import 'package:html/dom.dart';
import 'package:html/parser.dart';

extension ObjectNExtensions on Object? {
  Map? toMap() {
    try {
      if (this != null) return this as Map;
    } finally {}
    // return null for any exceptions
    return null;
  }
}

extension IterableExtensions<E> on Iterable<E> {
  E? get tryFirst => isNotEmpty ? first : null;
  E? get tryLast => isNotEmpty ? last : null;
}

extension NodeExtensions on Node {
  Element? get asElement {
    try {
      return this as Element;
    } catch (_) {}
    return null;
  }
}

extension StringExtensions on String? {
  String? tryDecodeHtml() {
    return this == null ? null : parseFragment(this).text;
    //return this == null ? null : Element.html('<span>$this</span>').text;
  }

  String? tryEncodeUri() {
    if (this == null) return null;
    String out = this!;
    //out = out?.replaceAllMapped(RegExp(r'[^A-Za-z0-9\-_.~]'), (match) {
    //  return const Utf8Encoder()
    //      .convert(match.match)
    //      .map((e) => '%${e.toRadixString(16)}')
    //      .reduce((value, element) => value + element);
    //});
    for (final i in _encodeUri.entries) {
      out = out.replaceAll(i.key, i.value);
    }

    return out;
  }

  String? tryDecodeUri() {
    if (this == null) return null;
    String out = this!;
    //String? out = this?.replaceAll('+', ' ');

    //out =
    //    out?.replaceAllMapped(RegExp(r'(\%[a-fA-F0-9][a-fA-F0-9])+'), (match) {
    //  var list = match.match
    //      .split('%')
    //      .map((e) => int.tryParse(e, radix: 16) ?? -1)
    //      .toList()
    //    ..removeWhere((e) => e == -1);
    //  return const Utf8Decoder(allowMalformed: true).convert(list);
    //});
    for (final i in _encodeUri.entries) {
      out = out.replaceAll(i.value, i.key);
    }

    return out;
  }

  String? htmlTryText() {
    return this == null ? null : parse(this).children[0].children[1].text;
  }

  static const _encodeUri = {
    // // percent is first so that it wont encode the others

    ':': '%3A',
    '/': '%2F',
    '?': '%3F',
    '#': '%23',
    //'[': '%5B',
    //']': '%5D',
    '@': '%40',
    //'!': '%21',
    //r'$': '%24',
    '&': '%26',
    //"'": '%27',
    //'(': '%28',
    //')': '%29',
    //'*': '%2A',
    //',': '%2C',
    //';': '%3B',
    //'=': '%3D',
    '_': ' ',
    ' ': '+', 
    '+': '%2B',
    //'%': '%25',
  };
}

extension MatchExtensions on Match {
  String get match => input.substring(start, end);
}

extension SetExtensions<T> on Set<T> {
  T operator [](int index) => elementAt(index);
}

extension EnumExtensions on Enum {}

extension PlatformExtensions on Platform{
  static bool get tryAndroid{
    try {
      return Platform.isAndroid;
    } catch (_){
      return false;
    }
  }
  static bool get tryIos{
    try {
      return Platform.isIOS;
    } catch (_){
      return false;
    }
  }
}

extension IconsExtensions on Icons{
  static const IconData empty = IconData(0x0020);
}