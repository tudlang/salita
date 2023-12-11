// Copyright (c) 2022 Tudlang
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart' hide Element;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:salita/strings.g.dart';

/// Class containing a valid Namespace.
abstract class Namespace {
  /// The id, used for switch-case stuff
  final String id;

  /// The numerical namespace ID, used in MediaWiki
  final int namespaceId;

  /// The name of the namespace
  final String namespaceName;

  /// A list of aliases for the namespace
  final List<String> namespaceAlias;

  /// An icon for the namespace
  final IconData icon;

  const Namespace({
    required this.id,
    required this.namespaceId,
    required this.namespaceName,
    this.icon = MdiIcons.text,
    this.namespaceAlias = const [],
  });

  /// The localized name for the namespace.
  ///
  /// Must be overriden with a translated string.
  String get nameLocalized => namespaceName.replaceFirst(":", '');

  String removePrefix(String old) {
    if (old.toLowerCase().startsWith(namespaceName.toLowerCase())) {
      return old.replaceAll(RegExp(RegExp.escape(namespaceName)), '');
    } else {
      return old;
    }
  }
}

class NamespaceDictionary extends Namespace {
  const NamespaceDictionary({
    super.namespaceId = 0,
    super.namespaceName = ':',
    super.icon = MdiIcons.bookAlphabet,
    super.namespaceAlias,
  }) : super(id: 'dictionary');

  @override
  String get nameLocalized => strings.definition.namespace.dictionary.name;
}

class NamespaceThesaurus extends Namespace {
  const NamespaceThesaurus({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = MdiIcons.bookEducation,
    super.namespaceAlias,
  }) : super(id: 'thesaurus');

  @override
  String get nameLocalized => strings.definition.namespace.thesaurus.name;
}

class NamespaceRhymes extends Namespace {
  const NamespaceRhymes({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = Icons.try_sms_star,
    super.namespaceAlias,
  }) : super(id: 'rhymes');

  @override
  String get nameLocalized => strings.definition.namespace.rhymes.name;
}

class NamespaceReconstruction extends Namespace {
  const NamespaceReconstruction({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = MdiIcons.bookClock,
    super.namespaceAlias,
  }) : super(id: 'reconstruction');

  @override
  String get nameLocalized => strings.definition.namespace.reconstruction.name;
}

class NamespaceConcordance extends Namespace {
  const NamespaceConcordance({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = Icons.auto_stories,
    super.namespaceAlias,
  }) : super(id: 'concordance');

  @override
  String get nameLocalized => strings.definition.namespace.concordance.name;
}

class NamespaceCitations extends Namespace {
  const NamespaceCitations({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = MdiIcons.commentQuote,
    super.namespaceAlias,
  }) : super(id: 'citations');

  @override
  String get nameLocalized => strings.definition.namespace.citations.name;
}

class NamespaceSigngloss extends Namespace {
  const NamespaceSigngloss({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = Icons.sign_language,
    super.namespaceAlias,
  }) : super(id: 'signgloss');

  @override
  String get nameLocalized => strings.definition.namespace.signgloss.name;
}

class NamespaceAppendix extends Namespace {
  const NamespaceAppendix({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = Icons.quiz,
    super.namespaceAlias,
  }) : super(id: 'appendix');

  @override
  String get nameLocalized => strings.definition.namespace.appendix.name;
}

class NamespaceIndex extends Namespace {
  const NamespaceIndex({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = MdiIcons.bookOpenVariant,
    super.namespaceAlias,
  }) : super(id: 'index');

  @override
  String get nameLocalized => strings.definition.namespace.index.name;
}

class NamespaceInflection extends Namespace {
  const NamespaceInflection({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = MdiIcons.transitConnectionHorizontal,
    super.namespaceAlias,
  }) : super(id: 'inflection');

  @override
  String get nameLocalized => strings.definition.namespace.inflection.name;
}

class NamespaceRoot extends Namespace {
  const NamespaceRoot({
    required super.namespaceId,
    required super.namespaceName,
    super.icon = MdiIcons.relationOneToOneOrMany,
    super.namespaceAlias,
  }) : super(id: 'root');

  @override
  String get nameLocalized => strings.definition.namespace.root.name;
}
