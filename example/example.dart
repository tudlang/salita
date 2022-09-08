import 'dart:convert';

void main() async {
  var a = '%28';
  print(a);
  print(Uri.encodeComponent(Uri.decodeComponent(a)));
  //var a = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ@`';
  //a = a.tryEncodeUri()!;
  //print(a);
//
  //a = a.tryDecodeUri()!;
  //print(a);
}

extension MatchExtensions on Match {
  String get match => input.substring(start, end);
}

extension StringExtensions on String? {
  String? tryEncodeUri() {
    String? out = this;
    out = out?.replaceAllMapped(RegExp(r'[^A-Za-z0-9\-_.~]'), (match) {
      return const Utf8Encoder()
          .convert(match.match)
          .map((e) => '%${e.toRadixString(16)}')
          .reduce((value, element) => value + element);
    });

    return out;
  }

  String? tryDecodeUri() {
    String? out = this?.replaceAll('+', ' ');

    out =
        out?.replaceAllMapped(RegExp(r'(\%[a-fA-F0-9][a-fA-F0-9])+'), (match) {
      var list = match.match
          .split('%')
          .map((e) => int.tryParse(e, radix: 16) ?? -1)
          .toList()
        ..removeWhere((e) => e == -1);
      return const Utf8Decoder(allowMalformed: true).convert(list);
    });

    return out;
  }

  static const _encodeUri = {
    // percent is first so that it wont encode the others
    '%': '%25',
    ':': '%3A',
    '/': '%2F',
    '?': '%3F',
    '#': '%23',
    '[': '%5B',
    ']': '%5D',
    '@': '%40',
    '!': '%21',
    r'$': '%24',
    '&': '%26',
    "'": '%27',
    '(': '%28',
    ')': '%29',
    '*': '%2A',
    '+': '%2B',
    ',': '%2C',
    ';': '%3B',
    '=': '%3D',
    ' ': '+',
  };
}
