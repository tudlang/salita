// Copyright (c) 2022 Tudlang
// 
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart' hide Element;
import 'package:html/dom.dart';

import 'namespace.dart';
import 'wiktionary.dart';

class SourceWiktionaryAng extends SourceWiktionary {
  const SourceWiktionaryAng._()
      : super(
          urlApi: 'https://ang.wiktionary.org/w/api.php',
          name: 'Ænglisc',
          numberEntries: 2195,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Ætēaca:'),
          ],
        );
  static const SourceWiktionaryAng instance = SourceWiktionaryAng._();
}

class SourceWiktionaryAf extends SourceWiktionary {
  const SourceWiktionaryAf._()
      : super(
          urlApi: 'https://af.wiktionary.org/w/api.php',
          name: 'Afrikaans',
          numberEntries: 22073,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryAf instance = SourceWiktionaryAf._();
}

class SourceWiktionaryAn extends SourceWiktionary {
  const SourceWiktionaryAn._()
      : super(
          urlApi: 'https://an.wiktionary.org/w/api.php',
          name: 'aragonés',
          numberEntries: 2649,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryAn instance = SourceWiktionaryAn._();
}

class SourceWiktionaryRoaRup extends SourceWiktionary {
  const SourceWiktionaryRoaRup._()
      : super(
          urlApi: 'https://roa-rup.wiktionary.org/w/api.php',
          name: 'armãneashti',
          numberEntries: 1308,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryRoaRup instance = SourceWiktionaryRoaRup._();
}

class SourceWiktionaryAst extends SourceWiktionary {
  const SourceWiktionaryAst._()
      : super(
          urlApi: 'https://ast.wiktionary.org/w/api.php',
          name: 'asturianu',
          numberEntries: 43596,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryAst instance = SourceWiktionaryAst._();
}

class SourceWiktionaryGn extends SourceWiktionary {
  const SourceWiktionaryGn._()
      : super(
          urlApi: 'https://gn.wiktionary.org/w/api.php',
          name: 'Avañe\'ẽ',
          numberEntries: 1785,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryGn instance = SourceWiktionaryGn._();
}

class SourceWiktionaryAy extends SourceWiktionary {
  const SourceWiktionaryAy._()
      : super(
          urlApi: 'https://ay.wiktionary.org/w/api.php',
          name: 'Aymar aru',
          numberEntries: 1048,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryAy instance = SourceWiktionaryAy._();
}

class SourceWiktionaryAz extends SourceWiktionary {
  const SourceWiktionaryAz._()
      : super(
          urlApi: 'https://az.wiktionary.org/w/api.php',
          name: 'azərbaycanca',
          numberEntries: 55958,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Əlavə:'),
          ],
        );
  static const SourceWiktionaryAz instance = SourceWiktionaryAz._();
}

class SourceWiktionaryId extends SourceWiktionary {
  const SourceWiktionaryId._()
      : super(
          urlApi: 'https://id.wiktionary.org/w/api.php',
          name: 'Bahasa Indonesia',
          numberEntries: 143897,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceIndex(namespaceId: 100, namespaceName: 'Indeks:'),
            NamespaceAppendix(namespaceId: 102, namespaceName: 'Lampiran:'),
          ],
        );
  static const SourceWiktionaryId instance = SourceWiktionaryId._();
}

class SourceWiktionaryMs extends SourceWiktionary {
  const SourceWiktionaryMs._()
      : super(
          urlApi: 'https://ms.wiktionary.org/w/api.php',
          name: 'Bahasa Melayu',
          numberEntries: 11743,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Lampiran:'),
            NamespaceRhymes(namespaceId: 102, namespaceName: 'Rima:'),
            NamespaceThesaurus(namespaceId: 104, namespaceName: 'Tesaurus:'),
            NamespaceIndex(namespaceId: 106, namespaceName: 'Indeks:'),
            NamespaceReconstruction(
                namespaceId: 110, namespaceName: 'Rekonstruksi:'),
            NamespaceSigngloss(
                namespaceId: 112, namespaceName: 'Padanan isyarat:'),
            NamespaceConcordance(
                namespaceId: 114, namespaceName: 'Konkordans:'),
          ],
        );
  static const SourceWiktionaryMs instance = SourceWiktionaryMs._();
}

class SourceWiktionaryZhMinNan extends SourceWiktionary {
  const SourceWiktionaryZhMinNan._()
      : super(
          urlApi: 'https://zh-min-nan.wiktionary.org/w/api.php',
          name: 'Bân-lâm-gú',
          numberEntries: 21860,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryZhMinNan instance = SourceWiktionaryZhMinNan._();
}

class SourceWiktionaryJv extends SourceWiktionary {
  const SourceWiktionaryJv._()
      : super(
          urlApi: 'https://jv.wiktionary.org/w/api.php',
          name: 'Basa Jawa',
          numberEntries: 60892,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryJv instance = SourceWiktionaryJv._();
}

class SourceWiktionarySu extends SourceWiktionary {
  const SourceWiktionarySu._()
      : super(
          urlApi: 'https://su.wiktionary.org/w/api.php',
          name: 'Basa Sunda',
          numberEntries: 3327,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionarySu instance = SourceWiktionarySu._();
}

class SourceWiktionaryBcl extends SourceWiktionary {
  const SourceWiktionaryBcl._()
      : super(
          urlApi: 'https://bcl.wiktionary.org/w/api.php',
          name: 'Bikol',
          numberEntries: 2854,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryBcl instance = SourceWiktionaryBcl._();
}

class SourceWiktionaryBs extends SourceWiktionary {
  const SourceWiktionaryBs._()
      : super(
          urlApi: 'https://bs.wiktionary.org/w/api.php',
          name: 'bosanski',
          numberEntries: 7851,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceIndex(namespaceId: 102, namespaceName: 'Indeks:'),
            NamespaceAppendix(namespaceId: 104, namespaceName: 'Dodatak:'),
          ],
        );
  static const SourceWiktionaryBs instance = SourceWiktionaryBs._();
}

class SourceWiktionaryBr extends SourceWiktionary {
  const SourceWiktionaryBr._()
      : super(
          urlApi: 'https://br.wiktionary.org/w/api.php',
          name: 'brezhoneg',
          numberEntries: 47231,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceIndex(namespaceId: 100, namespaceName: 'Stagadenn:'),
          ],
        );
  static const SourceWiktionaryBr instance = SourceWiktionaryBr._();
}

class SourceWiktionaryCa extends SourceWiktionary {
  const SourceWiktionaryCa._()
      : super(
          urlApi: 'https://ca.wiktionary.org/w/api.php',
          name: 'català',
          numberEntries: 557932,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryCa instance = SourceWiktionaryCa._();
}

class SourceWiktionaryCs extends SourceWiktionary {
  const SourceWiktionaryCs._()
      : super(
          urlApi: 'https://cs.wiktionary.org/w/api.php',
          name: 'čeština',
          numberEntries: 138744,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Příloha:'),
          ],
        );
  static const SourceWiktionaryCs instance = SourceWiktionaryCs._();
}

class SourceWiktionaryCo extends SourceWiktionary {
  const SourceWiktionaryCo._()
      : super(
          urlApi: 'https://co.wiktionary.org/w/api.php',
          name: 'corsu',
          numberEntries: 9512,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryCo instance = SourceWiktionaryCo._();
}

class SourceWiktionaryCy extends SourceWiktionary {
  const SourceWiktionaryCy._()
      : super(
          urlApi: 'https://cy.wiktionary.org/w/api.php',
          name: 'Cymraeg',
          numberEntries: 24775,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Atodiad:'),
            NamespaceRhymes(namespaceId: 102, namespaceName: 'Odliadur:'),
            NamespaceThesaurus(namespaceId: 104, namespaceName: 'WiciSawrws:'),
          ],
        );
  static const SourceWiktionaryCy instance = SourceWiktionaryCy._();
}

class SourceWiktionaryDa extends SourceWiktionary {
  const SourceWiktionaryDa._()
      : super(
          urlApi: 'https://da.wiktionary.org/w/api.php',
          name: 'dansk',
          numberEntries: 39036,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryDa instance = SourceWiktionaryDa._();
}

class SourceWiktionaryDe extends SourceWiktionary {
  const SourceWiktionaryDe._()
      : super(
          urlApi: 'https://de.wiktionary.org/w/api.php',
          name: 'Deutsch',
          numberEntries: 1051330,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceIndex(namespaceId: 102, namespaceName: 'Verzeichnis:'),
            NamespaceThesaurus(namespaceId: 104, namespaceName: 'Thesaurus:'),
            NamespaceRhymes(namespaceId: 106, namespaceName: 'Reim:'),
            NamespaceInflection(namespaceId: 108, namespaceName: 'Flexion:'),
            NamespaceReconstruction(
                namespaceId: 111, namespaceName: 'Rekonstruktion:'),
          ],
        );
  static const SourceWiktionaryDe instance = SourceWiktionaryDe._();
}

class SourceWiktionaryNa extends SourceWiktionary {
  const SourceWiktionaryNa._()
      : super(
          urlApi: 'https://na.wiktionary.org/w/api.php',
          name: 'dorerin Naoero',
          numberEntries: 620,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryNa instance = SourceWiktionaryNa._();
}

class SourceWiktionaryEt extends SourceWiktionary {
  const SourceWiktionaryEt._()
      : super(
          urlApi: 'https://et.wiktionary.org/w/api.php',
          name: 'eesti',
          numberEntries: 148278,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryEt instance = SourceWiktionaryEt._();
}

class SourceWiktionaryEn extends SourceWiktionary {
  const SourceWiktionaryEn._()
      : super(
          urlApi: 'https://en.wiktionary.org/w/api.php',
          name: 'English',
          numberEntries: 7126215,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceThesaurus(
                namespaceId: 110,
                namespaceName: 'Thesaurus:',
                namespaceAlias: ['WS:', 'Wikisaurus:']),
            NamespaceRhymes(namespaceId: 106, namespaceName: 'Rhymes:'),
            NamespaceReconstruction(
                namespaceId: 118,
                namespaceName: 'Reconstruction:',
                namespaceAlias: ['RC:']),
            NamespaceConcordance(
                namespaceId: 102, namespaceName: 'Concordance:'),
            NamespaceCitations(namespaceId: 114, namespaceName: 'Citations:'),
            NamespaceSigngloss(namespaceId: 116, namespaceName: 'Sign gloss:'),
            NamespaceAppendix(
                namespaceId: 100,
                namespaceName: 'Appendix:',
                namespaceAlias: ['AP:']),
          ],
        );
  static const SourceWiktionaryEn instance = SourceWiktionaryEn._();

  @override
  Element parseHtmlString(BuildContext context, String html) {
    final source = super.parseHtmlString(context, html);

    // Removing the interwiki link boxes
    source
        .querySelectorAll(
            '.checktrans, hr, .sister-wikipedia, .noprint, .sister-wikiquote, .sister-wikiversity, .thumb, .interProject, .mw-empty-elt')
        .forEach((e) {
      e.remove();
    });
    return source;
  }
}

class SourceWiktionaryEs extends SourceWiktionary {
  const SourceWiktionaryEs._()
      : super(
          urlApi: 'https://es.wiktionary.org/w/api.php',
          name: 'español',
          numberEntries: 913311,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Apéndice'),
          ],
        );
  static const SourceWiktionaryEs instance = SourceWiktionaryEs._();
}

class SourceWiktionaryEo extends SourceWiktionary {
  const SourceWiktionaryEo._()
      : super(
          urlApi: 'https://eo.wiktionary.org/w/api.php',
          name: 'Esperanto',
          numberEntries: 107655,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 102, namespaceName: 'Aldono'),
          ],
        );
  static const SourceWiktionaryEo instance = SourceWiktionaryEo._();
}

class SourceWiktionaryEu extends SourceWiktionary {
  const SourceWiktionaryEu._()
      : super(
          urlApi: 'https://eu.wiktionary.org/w/api.php',
          name: 'euskara',
          numberEntries: 54639,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryEu instance = SourceWiktionaryEu._();
}

class SourceWiktionaryFo extends SourceWiktionary {
  const SourceWiktionaryFo._()
      : super(
          urlApi: 'https://fo.wiktionary.org/w/api.php',
          name: 'føroyskt',
          numberEntries: 2108,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryFo instance = SourceWiktionaryFo._();
}

class SourceWiktionaryFr extends SourceWiktionary {
  const SourceWiktionaryFr._()
      : super(
          urlApi: 'https://fr.wiktionary.org/w/api.php',
          name: 'français',
          numberEntries: 4463763,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Annexe:'),
            NamespaceThesaurus(namespaceId: 106, namespaceName: 'Thésaurus:'),
            NamespaceReconstruction(
                namespaceId: 111, namespaceName: 'Reconstruction:'),
            //Namespace(
            //    namespaceId: 112, namespaceName: 'Tutoriel:', id: 'tutorial'),
            NamespaceRhymes(namespaceId: 114, namespaceName: 'Rime:'),
            NamespaceInflection(
                namespaceId: 116, namespaceName: 'Conjugaison:'),
            NamespaceRoot(namespaceId: 119, namespaceName: 'Racine:'),
          ],
        );
  static const SourceWiktionaryFr instance = SourceWiktionaryFr._();
}

class SourceWiktionaryFy extends SourceWiktionary {
  const SourceWiktionaryFy._()
      : super(
          urlApi: 'https://fy.wiktionary.org/w/api.php',
          name: 'Frysk',
          numberEntries: 14045,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryFy instance = SourceWiktionaryFy._();
}

class SourceWiktionaryGa extends SourceWiktionary {
  const SourceWiktionaryGa._()
      : super(
          urlApi: 'https://ga.wiktionary.org/w/api.php',
          name: 'Gaeilge',
          numberEntries: 2903,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Aguisín'),
          ],
        );
  static const SourceWiktionaryGa instance = SourceWiktionaryGa._();
}

class SourceWiktionaryGv extends SourceWiktionary {
  const SourceWiktionaryGv._()
      : super(
          urlApi: 'https://gv.wiktionary.org/w/api.php',
          name: 'Gaelg',
          numberEntries: 555,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryGv instance = SourceWiktionaryGv._();
}

class SourceWiktionarySm extends SourceWiktionary {
  const SourceWiktionarySm._()
      : super(
          urlApi: 'https://sm.wiktionary.org/w/api.php',
          name: 'Gagana Samoa',
          numberEntries: 4317,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionarySm instance = SourceWiktionarySm._();
}

class SourceWiktionaryGd extends SourceWiktionary {
  const SourceWiktionaryGd._()
      : super(
          urlApi: 'https://gd.wiktionary.org/w/api.php',
          name: 'Gàidhlig',
          numberEntries: 2913,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryGd instance = SourceWiktionaryGd._();
}

class SourceWiktionaryGl extends SourceWiktionary {
  const SourceWiktionaryGl._()
      : super(
          urlApi: 'https://gl.wiktionary.org/w/api.php',
          name: 'galego',
          numberEntries: 73724,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Apéndice'),
          ],
        );
  static const SourceWiktionaryGl instance = SourceWiktionaryGl._();
}

class SourceWiktionaryHa extends SourceWiktionary {
  const SourceWiktionaryHa._()
      : super(
          urlApi: 'https://ha.wiktionary.org/w/api.php',
          name: 'Hausa',
          numberEntries: 1136,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryHa instance = SourceWiktionaryHa._();
}

class SourceWiktionaryHr extends SourceWiktionary {
  const SourceWiktionaryHr._()
      : super(
          urlApi: 'https://hr.wiktionary.org/w/api.php',
          name: 'hrvatski',
          numberEntries: 32864,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryHr instance = SourceWiktionaryHr._();
}

class SourceWiktionaryIo extends SourceWiktionary {
  const SourceWiktionaryIo._()
      : super(
          urlApi: 'https://io.wiktionary.org/w/api.php',
          name: 'Ido',
          numberEntries: 308896,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryIo instance = SourceWiktionaryIo._();
}

class SourceWiktionaryIa extends SourceWiktionary {
  const SourceWiktionaryIa._()
      : super(
          urlApi: 'https://ia.wiktionary.org/w/api.php',
          name: 'interlingua',
          numberEntries: 2198,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 102, namespaceName: 'Appendice:'),
          ],
        );
  static const SourceWiktionaryIa instance = SourceWiktionaryIa._();
}

class SourceWiktionaryIe extends SourceWiktionary {
  const SourceWiktionaryIe._()
      : super(
          urlApi: 'https://ie.wiktionary.org/w/api.php',
          name: 'Interlingue',
          numberEntries: 1711,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryIe instance = SourceWiktionaryIe._();
}

class SourceWiktionaryIk extends SourceWiktionary {
  const SourceWiktionaryIk._()
      : super(
          urlApi: 'https://ik.wiktionary.org/w/api.php',
          name: 'Iñupiak',
          numberEntries: 143,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryIk instance = SourceWiktionaryIk._();
}

class SourceWiktionaryZu extends SourceWiktionary {
  const SourceWiktionaryZu._()
      : super(
          urlApi: 'https://zu.wiktionary.org/w/api.php',
          name: 'isiZulu',
          numberEntries: 1121,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryZu instance = SourceWiktionaryZu._();
}

class SourceWiktionaryIs extends SourceWiktionary {
  const SourceWiktionaryIs._()
      : super(
          urlApi: 'https://is.wiktionary.org/w/api.php',
          name: 'íslenska',
          numberEntries: 40150,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 106, namespaceName: 'Viðauki:'),
            NamespaceThesaurus(
                namespaceId: 110, namespaceName: 'Samheitasafn:'),
          ],
        );
  static const SourceWiktionaryIs instance = SourceWiktionaryIs._();
}

class SourceWiktionaryIt extends SourceWiktionary {
  const SourceWiktionaryIt._()
      : super(
          urlApi: 'https://it.wiktionary.org/w/api.php',
          name: 'italiano',
          numberEntries: 557513,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Appendice'),
          ],
        );
  static const SourceWiktionaryIt instance = SourceWiktionaryIt._();
}

class SourceWiktionaryKl extends SourceWiktionary {
  const SourceWiktionaryKl._()
      : super(
          urlApi: 'https://kl.wiktionary.org/w/api.php',
          name: 'kalaallisut',
          numberEntries: 1172,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryKl instance = SourceWiktionaryKl._();
}

class SourceWiktionaryCsb extends SourceWiktionary {
  const SourceWiktionaryCsb._()
      : super(
          urlApi: 'https://csb.wiktionary.org/w/api.php',
          name: 'kaszëbsczi',
          numberEntries: 1678,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryCsb instance = SourceWiktionaryCsb._();
}

class SourceWiktionaryKw extends SourceWiktionary {
  const SourceWiktionaryKw._()
      : super(
          urlApi: 'https://kw.wiktionary.org/w/api.php',
          name: 'kernowek',
          numberEntries: 521,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryKw instance = SourceWiktionaryKw._();
}

class SourceWiktionaryRw extends SourceWiktionary {
  const SourceWiktionaryRw._()
      : super(
          urlApi: 'https://rw.wiktionary.org/w/api.php',
          name: 'Ikinyarwanda',
          numberEntries: 399,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryRw instance = SourceWiktionaryRw._();
}

class SourceWiktionarySw extends SourceWiktionary {
  const SourceWiktionarySw._()
      : super(
          urlApi: 'https://sw.wiktionary.org/w/api.php',
          name: 'Kiswahili',
          numberEntries: 14089,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionarySw instance = SourceWiktionarySw._();
}

class SourceWiktionaryKu extends SourceWiktionary {
  const SourceWiktionaryKu._()
      : super(
          urlApi: 'https://ku.wiktionary.org/w/api.php',
          name: 'kurdî',
          numberEntries: 738314,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Pêvek:'),
            NamespaceIndex(namespaceId: 102, namespaceName: 'Nimînok:'),
            NamespaceInflection(namespaceId: 106, namespaceName: 'Tewandin:'),
            NamespaceReconstruction(
                namespaceId: 108, namespaceName: 'Jinûvesazî:'),
          ],
        );
  static const SourceWiktionaryKu instance = SourceWiktionaryKu._();
}

class SourceWiktionaryLa extends SourceWiktionary {
  const SourceWiktionaryLa._()
      : super(
          urlApi: 'https://la.wiktionary.org/w/api.php',
          name: 'Latina',
          numberEntries: 34098,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryLa instance = SourceWiktionaryLa._();
}

class SourceWiktionaryLv extends SourceWiktionary {
  const SourceWiktionaryLv._()
      : super(
          urlApi: 'https://lv.wiktionary.org/w/api.php',
          name: 'latviešu',
          numberEntries: 11304,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Pielikums:'),
          ],
        );
  static const SourceWiktionaryLv instance = SourceWiktionaryLv._();
}

class SourceWiktionaryLb extends SourceWiktionary {
  const SourceWiktionaryLb._()
      : super(
          urlApi: 'https://lb.wiktionary.org/w/api.php',
          name: 'Lëtzebuergesch',
          numberEntries: 9554,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Annexen:'),
          ],
        );
  static const SourceWiktionaryLb instance = SourceWiktionaryLb._();
}

class SourceWiktionaryLt extends SourceWiktionary {
  const SourceWiktionaryLt._()
      : super(
          urlApi: 'https://lt.wiktionary.org/w/api.php',
          name: 'lietuvių',
          numberEntries: 618784,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceIndex(namespaceId: 100, namespaceName: 'Sąrašas:'),
            NamespaceAppendix(namespaceId: 102, namespaceName: 'Priedas:'),
          ],
        );
  static const SourceWiktionaryLt instance = SourceWiktionaryLt._();
}

class SourceWiktionaryLi extends SourceWiktionary {
  const SourceWiktionaryLi._()
      : super(
          urlApi: 'https://li.wiktionary.org/w/api.php',
          name: 'Limburgs',
          numberEntries: 116417,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryLi instance = SourceWiktionaryLi._();
}

class SourceWiktionaryLn extends SourceWiktionary {
  const SourceWiktionaryLn._()
      : super(
          urlApi: 'https://ln.wiktionary.org/w/api.php',
          name: 'lingála',
          numberEntries: 693,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryLn instance = SourceWiktionaryLn._();
}

class SourceWiktionaryJbo extends SourceWiktionary {
  const SourceWiktionaryJbo._()
      : super(
          urlApi: 'https://jbo.wiktionary.org/w/api.php',
          name: 'la .lojban.',
          numberEntries: 884,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryJbo instance = SourceWiktionaryJbo._();
}

class SourceWiktionaryHu extends SourceWiktionary {
  const SourceWiktionaryHu._()
      : super(
          urlApi: 'https://hu.wiktionary.org/w/api.php',
          name: 'magyar',
          numberEntries: 370317,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Függelék:'),
            NamespaceIndex(namespaceId: 102, namespaceName: 'Index:'),
          ],
        );
  static const SourceWiktionaryHu instance = SourceWiktionaryHu._();
}

class SourceWiktionaryMg extends SourceWiktionary {
  const SourceWiktionaryMg._()
      : super(
          urlApi: 'https://mg.wiktionary.org/w/api.php',
          name: 'Malagasy',
          numberEntries: 1753439,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceRhymes(namespaceId: 100, namespaceName: 'Rakibolana:'),
          ],
        );
  static const SourceWiktionaryMg instance = SourceWiktionaryMg._();
}

class SourceWiktionaryMt extends SourceWiktionary {
  const SourceWiktionaryMt._()
      : super(
          urlApi: 'https://mt.wiktionary.org/w/api.php',
          name: 'Malti',
          numberEntries: 2178,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryMt instance = SourceWiktionaryMt._();
}

class SourceWiktionaryMi extends SourceWiktionary {
  const SourceWiktionaryMi._()
      : super(
          urlApi: 'https://mi.wiktionary.org/w/api.php',
          name: 'Māori',
          numberEntries: 1095,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryMi instance = SourceWiktionaryMi._();
}

class SourceWiktionaryFj extends SourceWiktionary {
  const SourceWiktionaryFj._()
      : super(
          urlApi: 'https://fj.wiktionary.org/w/api.php',
          name: 'Na Vosa Vakaviti',
          numberEntries: 31356,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryFj instance = SourceWiktionaryFj._();
}

class SourceWiktionaryNah extends SourceWiktionary {
  const SourceWiktionaryNah._()
      : super(
          urlApi: 'https://nah.wiktionary.org/w/api.php',
          name: 'Nāhuatl',
          numberEntries: 7058,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryNah instance = SourceWiktionaryNah._();
}

class SourceWiktionaryNl extends SourceWiktionary {
  const SourceWiktionaryNl._()
      : super(
          urlApi: 'https://nl.wiktionary.org/w/api.php',
          name: 'Nederlands',
          numberEntries: 820449,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryNl instance = SourceWiktionaryNl._();
}

class SourceWiktionaryNo extends SourceWiktionary {
  const SourceWiktionaryNo._()
      : super(
          urlApi: 'https://no.wiktionary.org/w/api.php',
          name: 'Norsk Bokmål',
          numberEntries: 156031,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Tillegg:'),
          ],
        );
  static const SourceWiktionaryNo instance = SourceWiktionaryNo._();
}

class SourceWiktionaryNn extends SourceWiktionary {
  const SourceWiktionaryNn._()
      : super(
          urlApi: 'https://nn.wiktionary.org/w/api.php',
          name: 'Nynorsk',
          numberEntries: 12184,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryNn instance = SourceWiktionaryNn._();
}

class SourceWiktionaryOc extends SourceWiktionary {
  const SourceWiktionaryOc._()
      : super(
          urlApi: 'https://oc.wiktionary.org/w/api.php',
          name: 'occitan',
          numberEntries: 63735,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Annèxa:'),
          ],
        );
  static const SourceWiktionaryOc instance = SourceWiktionaryOc._();
}

class SourceWiktionaryOm extends SourceWiktionary {
  const SourceWiktionaryOm._()
      : super(
          urlApi: 'https://om.wiktionary.org/w/api.php',
          name: 'Oromoo',
          numberEntries: 23323,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryOm instance = SourceWiktionaryOm._();
}

class SourceWiktionaryUz extends SourceWiktionary {
  const SourceWiktionaryUz._()
      : super(
          urlApi: 'https://uz.wiktionary.org/w/api.php',
          name: 'oʻzbekcha/ўзбекча',
          numberEntries: 117007,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryUz instance = SourceWiktionaryUz._();
}

class SourceWiktionaryNds extends SourceWiktionary {
  const SourceWiktionaryNds._()
      : super(
          urlApi: 'https://nds.wiktionary.org/w/api.php',
          name: 'Plattdüütsch',
          numberEntries: 10038,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Anhang:'),
            NamespaceCitations(namespaceId: 114, namespaceName: 'Zitaten:'),
          ],
        );
  static const SourceWiktionaryNds instance = SourceWiktionaryNds._();
}

class SourceWiktionaryPl extends SourceWiktionary {
  const SourceWiktionaryPl._()
      : super(
          urlApi: 'https://pl.wiktionary.org/w/api.php',
          name: 'polski',
          numberEntries: 763016,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Aneks:'),
            NamespaceIndex(namespaceId: 102, namespaceName: 'Indeks:'),
          ],
        );
  static const SourceWiktionaryPl instance = SourceWiktionaryPl._();
}

class SourceWiktionaryPt extends SourceWiktionary {
  const SourceWiktionaryPt._()
      : super(
          urlApi: 'https://pt.wiktionary.org/w/api.php',
          name: 'português',
          numberEntries: 271109,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Apêndice:'),
            NamespaceIndex(namespaceId: 102, namespaceName: 'Vocabulário:'),
            NamespaceRhymes(namespaceId: 104, namespaceName: 'Rimas:'),
            NamespaceCitations(namespaceId: 108, namespaceName: 'Citações:'),
          ],
        );
  static const SourceWiktionaryPt instance = SourceWiktionaryPt._();
}

class SourceWiktionaryRo extends SourceWiktionary {
  const SourceWiktionaryRo._()
      : super(
          urlApi: 'https://ro.wiktionary.org/w/api.php',
          name: 'română',
          numberEntries: 163333,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 102, namespaceName: 'Apendice:'),
          ],
        );
  static const SourceWiktionaryRo instance = SourceWiktionaryRo._();
}

class SourceWiktionaryQu extends SourceWiktionary {
  const SourceWiktionaryQu._()
      : super(
          urlApi: 'https://qu.wiktionary.org/w/api.php',
          name: 'Runa Simi',
          numberEntries: 351,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryQu instance = SourceWiktionaryQu._();
}

class SourceWiktionarySg extends SourceWiktionary {
  const SourceWiktionarySg._()
      : super(
          urlApi: 'https://sg.wiktionary.org/w/api.php',
          name: 'Sängö',
          numberEntries: 31903,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionarySg instance = SourceWiktionarySg._();
}

class SourceWiktionarySt extends SourceWiktionary {
  const SourceWiktionarySt._()
      : super(
          urlApi: 'https://st.wiktionary.org/w/api.php',
          name: 'Sesotho',
          numberEntries: 1374,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionarySt instance = SourceWiktionarySt._();
}

class SourceWiktionaryTn extends SourceWiktionary {
  const SourceWiktionaryTn._()
      : super(
          urlApi: 'https://tn.wiktionary.org/w/api.php',
          name: 'Setswana',
          numberEntries: 100,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryTn instance = SourceWiktionaryTn._();
}

class SourceWiktionarySq extends SourceWiktionary {
  const SourceWiktionarySq._()
      : super(
          urlApi: 'https://sq.wiktionary.org/w/api.php',
          name: 'shqip',
          numberEntries: 10086,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionarySq instance = SourceWiktionarySq._();
}

class SourceWiktionaryScn extends SourceWiktionary {
  const SourceWiktionaryScn._()
      : super(
          urlApi: 'https://scn.wiktionary.org/w/api.php',
          name: 'sicilianu',
          numberEntries: 18784,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryScn instance = SourceWiktionaryScn._();
}

class SourceWiktionarySimple extends SourceWiktionary {
  const SourceWiktionarySimple._()
      : super(
          urlApi: 'https://simple.wiktionary.org/w/api.php',
          name: 'Simple English',
          numberEntries: 36722,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionarySimple instance = SourceWiktionarySimple._();
}

class SourceWiktionarySs extends SourceWiktionary {
  const SourceWiktionarySs._()
      : super(
          urlApi: 'https://ss.wiktionary.org/w/api.php',
          name: 'SiSwati',
          numberEntries: 326,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionarySs instance = SourceWiktionarySs._();
}

class SourceWiktionaryTl extends SourceWiktionary {
  const SourceWiktionaryTl._()
      : super(
          urlApi: 'https://tl.wiktionary.org/w/api.php',
          name: 'Tagalog',
          numberEntries: 16012,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryTl instance = SourceWiktionaryTl._();
}

class SourceWiktionaryVi extends SourceWiktionary {
  const SourceWiktionaryVi._()
      : super(
          urlApi: 'https://vi.wiktionary.org/w/api.php',
          name: 'Tiếng Việt',
          numberEntries: 242103,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Phụ lục:'),
          ],
        );
  static const SourceWiktionaryVi instance = SourceWiktionaryVi._();
}

class SourceWiktionaryTpi extends SourceWiktionary {
  const SourceWiktionaryTpi._()
      : super(
          urlApi: 'https://tpi.wiktionary.org/w/api.php',
          name: 'Tok Pisin',
          numberEntries: 1211,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryTpi instance = SourceWiktionaryTpi._();
}

class SourceWiktionaryTr extends SourceWiktionary {
  const SourceWiktionaryTr._()
      : super(
          urlApi: 'https://tr.wiktionary.org/w/api.php',
          name: 'Türkçe',
          numberEntries: 350848,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceReconstruction(
                namespaceId: 102, namespaceName: 'YeniKurum:'),
            NamespaceAppendix(namespaceId: 104, namespaceName: 'Ek:'),
            NamespaceCitations(namespaceId: 106, namespaceName: 'Alıntılar:'),
          ],
        );
  static const SourceWiktionaryTr instance = SourceWiktionaryTr._();
}

class SourceWiktionaryTk extends SourceWiktionary {
  const SourceWiktionaryTk._()
      : super(
          urlApi: 'https://tk.wiktionary.org/w/api.php',
          name: 'Türkmençe',
          numberEntries: 4674,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryTk instance = SourceWiktionaryTk._();
}

class SourceWiktionaryVo extends SourceWiktionary {
  const SourceWiktionaryVo._()
      : super(
          urlApi: 'https://vo.wiktionary.org/w/api.php',
          name: 'Volapük',
          numberEntries: 23434,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryVo instance = SourceWiktionaryVo._();
}

class SourceWiktionaryWa extends SourceWiktionary {
  const SourceWiktionaryWa._()
      : super(
          urlApi: 'https://wa.wiktionary.org/w/api.php',
          name: 'walon',
          numberEntries: 28944,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceInflection(namespaceId: 100, namespaceName: 'Rawete:'),
            NamespaceCitations(
                namespaceId: 102,
                namespaceName: 'Sourdant:',
                icon: Icons.person),
            NamespaceThesaurus(namespaceId: 104, namespaceName: 'Motyince:'),
          ],
        );
  static const SourceWiktionaryWa instance = SourceWiktionaryWa._();
}

class SourceWiktionaryWo extends SourceWiktionary {
  const SourceWiktionaryWo._()
      : super(
          urlApi: 'https://wo.wiktionary.org/w/api.php',
          name: 'Wolof',
          numberEntries: 2607,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryWo instance = SourceWiktionaryWo._();
}

class SourceWiktionaryTs extends SourceWiktionary {
  const SourceWiktionaryTs._()
      : super(
          urlApi: 'https://ts.wiktionary.org/w/api.php',
          name: 'Xitsonga',
          numberEntries: 394,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryTs instance = SourceWiktionaryTs._();
}

class SourceWiktionaryEl extends SourceWiktionary {
  const SourceWiktionaryEl._()
      : super(
          urlApi: 'https://el.wiktionary.org/w/api.php',
          name: 'Ελληνικά',
          numberEntries: 803919,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Παράρτημα:'),
          ],
        );
  static const SourceWiktionaryEl instance = SourceWiktionaryEl._();
}

class SourceWiktionaryBe extends SourceWiktionary {
  const SourceWiktionaryBe._()
      : super(
          urlApi: 'https://be.wiktionary.org/w/api.php',
          name: 'беларуская',
          numberEntries: 4909,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryBe instance = SourceWiktionaryBe._();
}

class SourceWiktionaryBg extends SourceWiktionary {
  const SourceWiktionaryBg._()
      : super(
          urlApi: 'https://bg.wiktionary.org/w/api.php',
          name: 'български',
          numberEntries: 29195,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceInflection(namespaceId: 100, namespaceName: 'Словоформи:'),
          ],
        );
  static const SourceWiktionaryBg instance = SourceWiktionaryBg._();
}

class SourceWiktionaryKy extends SourceWiktionary {
  const SourceWiktionaryKy._()
      : super(
          urlApi: 'https://ky.wiktionary.org/w/api.php',
          name: 'кыргызча',
          numberEntries: 29807,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryKy instance = SourceWiktionaryKy._();
}

class SourceWiktionaryKk extends SourceWiktionary {
  const SourceWiktionaryKk._()
      : super(
          urlApi: 'https://kk.wiktionary.org/w/api.php',
          name: 'қазақша',
          numberEntries: 5827,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryKk instance = SourceWiktionaryKk._();
}

class SourceWiktionaryMk extends SourceWiktionary {
  const SourceWiktionaryMk._()
      : super(
          urlApi: 'https://mk.wiktionary.org/w/api.php',
          name: 'македонски',
          numberEntries: 4512,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryMk instance = SourceWiktionaryMk._();
}

class SourceWiktionaryMn extends SourceWiktionary {
  const SourceWiktionaryMn._()
      : super(
          urlApi: 'https://mn.wiktionary.org/w/api.php',
          name: 'монгол',
          numberEntries: 9397,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryMn instance = SourceWiktionaryMn._();
}

class SourceWiktionaryRu extends SourceWiktionary {
  const SourceWiktionaryRu._()
      : super(
          urlApi: 'https://ru.wiktionary.org/w/api.php',
          name: 'Русский',
          numberEntries: 1200882,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Приложение:'),
            NamespaceConcordance(
                namespaceId: 102, namespaceName: 'Конкорданс:'),
            NamespaceIndex(namespaceId: 104, namespaceName: 'Индекс:'),
            NamespaceRhymes(namespaceId: 106, namespaceName: 'Рифмы:'),
          ],
        );
  static const SourceWiktionaryRu instance = SourceWiktionaryRu._();
}

class SourceWiktionarySr extends SourceWiktionary {
  const SourceWiktionarySr._()
      : super(
          urlApi: 'https://sr.wiktionary.org/w/api.php',
          name: 'српски / srpski',
          numberEntries: 223248,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 102, namespaceName: 'Додатак:'),
          ],
        );
  static const SourceWiktionarySr instance = SourceWiktionarySr._();
}

class SourceWiktionaryTt extends SourceWiktionary {
  const SourceWiktionaryTt._()
      : super(
          urlApi: 'https://tt.wiktionary.org/w/api.php',
          name: 'татарча/tatarça',
          numberEntries: 2089,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryTt instance = SourceWiktionaryTt._();
}

class SourceWiktionaryTg extends SourceWiktionary {
  const SourceWiktionaryTg._()
      : super(
          urlApi: 'https://tg.wiktionary.org/w/api.php',
          name: 'тоҷикӣ',
          numberEntries: 30677,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryTg instance = SourceWiktionaryTg._();
}

class SourceWiktionaryUk extends SourceWiktionary {
  const SourceWiktionaryUk._()
      : super(
          urlApi: 'https://uk.wiktionary.org/w/api.php',
          name: 'українська',
          numberEntries: 52888,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Додаток:'),
            NamespaceIndex(namespaceId: 102, namespaceName: 'Індекс:'),
          ],
        );
  static const SourceWiktionaryUk instance = SourceWiktionaryUk._();
}

class SourceWiktionaryHy extends SourceWiktionary {
  const SourceWiktionaryHy._()
      : super(
          urlApi: 'https://hy.wiktionary.org/w/api.php',
          name: 'հայերեն',
          numberEntries: 303106,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryHy instance = SourceWiktionaryHy._();
}

class SourceWiktionaryKa extends SourceWiktionary {
  const SourceWiktionaryKa._()
      : super(
          urlApi: 'https://ka.wiktionary.org/w/api.php',
          name: 'ქართული',
          numberEntries: 11816,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceInflection(
                namespaceId: 100, namespaceName: 'ფორმაწარმოება:'),
          ],
        );
  static const SourceWiktionaryKa instance = SourceWiktionaryKa._();
}

class SourceWiktionaryGom extends SourceWiktionary {
  const SourceWiktionaryGom._()
      : super(
          urlApi: 'https://gom.wiktionary.org/w/api.php',
          name: 'गोंयची कोंकणी / Gõychi Konknni',
          numberEntries: 2706,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryGom instance = SourceWiktionaryGom._();
}

class SourceWiktionaryKs extends SourceWiktionary {
  const SourceWiktionaryKs._()
      : super(
          urlApi: 'https://ks.wiktionary.org/w/api.php',
          name: 'कॉशुर / کٲشُر',
          numberEntries: 3699,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryKs instance = SourceWiktionaryKs._();
}

class SourceWiktionaryNe extends SourceWiktionary {
  const SourceWiktionaryNe._()
      : super(
          urlApi: 'https://ne.wiktionary.org/w/api.php',
          name: 'नेपाली',
          numberEntries: 431,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryNe instance = SourceWiktionaryNe._();
}

class SourceWiktionaryMr extends SourceWiktionary {
  const SourceWiktionaryMr._()
      : super(
          urlApi: 'https://mr.wiktionary.org/w/api.php',
          name: 'मराठी',
          numberEntries: 2717,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceIndex(namespaceId: 104, namespaceName: 'सूची:'),
          ],
        );
  static const SourceWiktionaryMr instance = SourceWiktionaryMr._();
}

class SourceWiktionarySa extends SourceWiktionary {
  const SourceWiktionarySa._()
      : super(
          urlApi: 'https://sa.wiktionary.org/w/api.php',
          name: 'संस्कृतम्',
          numberEntries: 6021,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionarySa instance = SourceWiktionarySa._();
}

class SourceWiktionaryHi extends SourceWiktionary {
  const SourceWiktionaryHi._()
      : super(
          urlApi: 'https://hi.wiktionary.org/w/api.php',
          name: 'हिन्दी',
          numberEntries: 183550,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryHi instance = SourceWiktionaryHi._();
}

class SourceWiktionaryHif extends SourceWiktionary {
  const SourceWiktionaryHif._()
      : super(
          urlApi: 'https://hif.wiktionary.org/w/api.php',
          name: 'Fiji Hindi',
          numberEntries: 1194,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryHif instance = SourceWiktionaryHif._();
}

class SourceWiktionaryHsb extends SourceWiktionary {
  const SourceWiktionaryHsb._()
      : super(
          urlApi: 'https://hsb.wiktionary.org/w/api.php',
          name: 'hornjoserbsce',
          numberEntries: 4217,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryHsb instance = SourceWiktionaryHsb._();
}

class SourceWiktionaryBn extends SourceWiktionary {
  const SourceWiktionaryBn._()
      : super(
          urlApi: 'https://bn.wiktionary.org/w/api.php',
          name: 'বাংলা',
          numberEntries: 35221,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceThesaurus(namespaceId: 100, namespaceName: 'উইকিসরাস:'),
          ],
        );
  static const SourceWiktionaryBn instance = SourceWiktionaryBn._();
}

class SourceWiktionaryPa extends SourceWiktionary {
  const SourceWiktionaryPa._()
      : super(
          urlApi: 'https://pa.wiktionary.org/w/api.php',
          name: 'ਪੰਜਾਬੀ',
          numberEntries: 15450,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryPa instance = SourceWiktionaryPa._();
}

class SourceWiktionaryGu extends SourceWiktionary {
  const SourceWiktionaryGu._()
      : super(
          urlApi: 'https://gu.wiktionary.org/w/api.php',
          name: 'ગુજરાતી',
          numberEntries: 672,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryGu instance = SourceWiktionaryGu._();
}

class SourceWiktionaryOr extends SourceWiktionary {
  const SourceWiktionaryOr._()
      : super(
          urlApi: 'https://or.wiktionary.org/w/api.php',
          name: 'ଓଡ଼ିଆ',
          numberEntries: 108627,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceIndex(namespaceId: 102, namespaceName: 'ସୂଚୀ:'),
            NamespaceRoot(namespaceId: 114, namespaceName: 'ଆଧାର:'),
          ],
        );
  static const SourceWiktionaryOr instance = SourceWiktionaryOr._();
}

class SourceWiktionaryTa extends SourceWiktionary {
  const SourceWiktionaryTa._()
      : super(
          urlApi: 'https://ta.wiktionary.org/w/api.php',
          name: 'தமிழ்',
          numberEntries: 404133,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryTa instance = SourceWiktionaryTa._();
}

class SourceWiktionaryTe extends SourceWiktionary {
  const SourceWiktionaryTe._()
      : super(
          urlApi: 'https://te.wiktionary.org/w/api.php',
          name: 'తెలుగు',
          numberEntries: 106436,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryTe instance = SourceWiktionaryTe._();
}

class SourceWiktionaryKn extends SourceWiktionary {
  const SourceWiktionaryKn._()
      : super(
          urlApi: 'https://kn.wiktionary.org/w/api.php',
          name: 'ಕನ್ನಡ',
          numberEntries: 264277,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryKn instance = SourceWiktionaryKn._();
}

class SourceWiktionaryMin extends SourceWiktionary {
  const SourceWiktionaryMin._()
      : super(
          urlApi: 'https://min.wiktionary.org/w/api.php',
          name: 'Minangkabau',
          numberEntries: 10253,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryMin instance = SourceWiktionaryMin._();
}

class SourceWiktionaryMl extends SourceWiktionary {
  const SourceWiktionaryMl._()
      : super(
          urlApi: 'https://ml.wiktionary.org/w/api.php',
          name: 'മലയാളം',
          numberEntries: 131087,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryMl instance = SourceWiktionaryMl._();
}

class SourceWiktionarySi extends SourceWiktionary {
  const SourceWiktionarySi._()
      : super(
          urlApi: 'https://si.wiktionary.org/w/api.php',
          name: 'සිංහල',
          numberEntries: 1393,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionarySi instance = SourceWiktionarySi._();
}

class SourceWiktionaryTh extends SourceWiktionary {
  const SourceWiktionaryTh._()
      : super(
          urlApi: 'https://th.wiktionary.org/w/api.php',
          name: 'ไทย',
          numberEntries: 214634,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'ภาคผนวก:'),
            NamespaceIndex(namespaceId: 102, namespaceName: 'ดัชนี:'),
            NamespaceRhymes(namespaceId: 104, namespaceName: 'สัมผัส:'),
            NamespaceThesaurus(namespaceId: 119, namespaceName: 'อรรถาภิธาน:'),
          ],
        );
  static const SourceWiktionaryTh instance = SourceWiktionaryTh._();
}

class SourceWiktionaryMy extends SourceWiktionary {
  const SourceWiktionaryMy._()
      : super(
          urlApi: 'https://my.wiktionary.org/w/api.php',
          name: 'မြန်မာဘာသာ',
          numberEntries: 124525,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'နောက်ဆက်တွဲ:'),
          ],
        );
  static const SourceWiktionaryMy instance = SourceWiktionaryMy._();
}

class SourceWiktionaryLo extends SourceWiktionary {
  const SourceWiktionaryLo._()
      : super(
          urlApi: 'https://lo.wiktionary.org/w/api.php',
          name: 'ລາວ',
          numberEntries: 37774,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryLo instance = SourceWiktionaryLo._();
}

class SourceWiktionaryKm extends SourceWiktionary {
  const SourceWiktionaryKm._()
      : super(
          urlApi: 'https://km.wiktionary.org/w/api.php',
          name: 'ភាសាខ្មែរ',
          numberEntries: 5651,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryKm instance = SourceWiktionaryKm._();
}

class SourceWiktionaryIu extends SourceWiktionary {
  const SourceWiktionaryIu._()
      : super(
          urlApi: 'https://iu.wiktionary.org/w/api.php',
          name: 'ᐃᓄᒃᑎᑐᑦ/inuktitut',
          numberEntries: 316,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryIu instance = SourceWiktionaryIu._();
}

class SourceWiktionaryChr extends SourceWiktionary {
  const SourceWiktionaryChr._()
      : super(
          urlApi: 'https://chr.wiktionary.org/w/api.php',
          name: 'ᏣᎳᎩ',
          numberEntries: 312,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryChr instance = SourceWiktionaryChr._();
}

class SourceWiktionaryTi extends SourceWiktionary {
  const SourceWiktionaryTi._()
      : super(
          urlApi: 'https://ti.wiktionary.org/w/api.php',
          name: 'ትግርኛ',
          numberEntries: 148,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryTi instance = SourceWiktionaryTi._();
}

class SourceWiktionaryAm extends SourceWiktionary {
  const SourceWiktionaryAm._()
      : super(
          urlApi: 'https://am.wiktionary.org/w/api.php',
          name: 'አማርኛ',
          numberEntries: 449,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryAm instance = SourceWiktionaryAm._();
}

class SourceWiktionaryKo extends SourceWiktionary {
  const SourceWiktionaryKo._()
      : super(
          urlApi: 'https://ko.wiktionary.org/w/api.php',
          name: '한국어',
          numberEntries: 297839,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: '부록:'),
          ],
        );
  static const SourceWiktionaryKo instance = SourceWiktionaryKo._();
}

class SourceWiktionaryJa extends SourceWiktionary {
  const SourceWiktionaryJa._()
      : super(
          urlApi: 'https://ja.wiktionary.org/w/api.php',
          name: '日本語',
          numberEntries: 300948,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: '付録:'),
          ],
        );
  static const SourceWiktionaryJa instance = SourceWiktionaryJa._();
}

class SourceWiktionaryZh extends SourceWiktionary {
  const SourceWiktionaryZh._()
      : super(
          urlApi: 'https://zh.wiktionary.org/w/api.php',
          name: '中文',
          numberEntries: 1204369,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'Appendix:'),
            NamespaceRhymes(namespaceId: 106, namespaceName: 'Rhymes:'),
            NamespaceThesaurus(namespaceId: 110, namespaceName: 'Thesaurus:'),
            NamespaceCitations(namespaceId: 114, namespaceName: 'Citations:'),
            NamespaceReconstruction(
                namespaceId: 118, namespaceName: 'Reconstruction:'),
          ],
        );
  static const SourceWiktionaryZh instance = SourceWiktionaryZh._();
}

class SourceWiktionaryYue extends SourceWiktionary {
  const SourceWiktionaryYue._()
      : super(
          urlApi: 'https://yue.wiktionary.org/w/api.php',
          name: '粵語',
          numberEntries: 6920,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceIndex(namespaceId: 100, namespaceName: '索引:'),
            NamespaceAppendix(namespaceId: 102, namespaceName: '附錄:'),
            NamespaceReconstruction(namespaceId: 104, namespaceName: '重構:'),
          ],
        );
  static const SourceWiktionaryYue instance = SourceWiktionaryYue._();
}

class SourceWiktionaryYi extends SourceWiktionary {
  const SourceWiktionaryYi._()
      : super(
          urlApi: 'https://yi.wiktionary.org/w/api.php',
          name: 'ייִדיש',
          numberEntries: 714,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryYi instance = SourceWiktionaryYi._();
}

class SourceWiktionaryHe extends SourceWiktionary {
  const SourceWiktionaryHe._()
      : super(
          urlApi: 'https://he.wiktionary.org/w/api.php',
          name: 'עברית',
          numberEntries: 23145,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'נספח:'),
          ],
        );
  static const SourceWiktionaryHe instance = SourceWiktionaryHe._();
}

class SourceWiktionaryUr extends SourceWiktionary {
  const SourceWiktionaryUr._()
      : super(
          urlApi: 'https://ur.wiktionary.org/w/api.php',
          name: 'اردو',
          numberEntries: 26622,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'ضمیمہ:'),
            //Namespace(namespaceId: 102, namespaceName: 'کلید:', id: 'کلید'),
            NamespaceIndex(namespaceId: 104, namespaceName: 'اشاریہ:'),
            NamespaceRhymes(namespaceId: 106, namespaceName: 'قوافی:'),
            NamespaceThesaurus(namespaceId: 110, namespaceName: 'مترادفات:'),
            NamespaceCitations(namespaceId: 114, namespaceName: 'حوالہ جات:'),
            NamespaceSigngloss(
                namespaceId: 116, namespaceName: 'فرہنگ اشارات:'),
            NamespaceReconstruction(
                namespaceId: 118, namespaceName: 'تعمیرنو:'),
          ],
        );
  static const SourceWiktionaryUr instance = SourceWiktionaryUr._();
}

class SourceWiktionaryAr extends SourceWiktionary {
  const SourceWiktionaryAr._()
      : super(
          urlApi: 'https://ar.wiktionary.org/w/api.php',
          name: 'العربية',
          numberEntries: 67109,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryAr instance = SourceWiktionaryAr._();
}

class SourceWiktionaryPs extends SourceWiktionary {
  const SourceWiktionaryPs._()
      : super(
          urlApi: 'https://ps.wiktionary.org/w/api.php',
          name: 'پښتو',
          numberEntries: 25576,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryPs instance = SourceWiktionaryPs._();
}

class SourceWiktionaryPnb extends SourceWiktionary {
  const SourceWiktionaryPnb._()
      : super(
          urlApi: 'https://pnb.wiktionary.org/w/api.php',
          name: 'پنجابی',
          numberEntries: 9313,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryPnb instance = SourceWiktionaryPnb._();
}

class SourceWiktionarySd extends SourceWiktionary {
  const SourceWiktionarySd._()
      : super(
          urlApi: 'https://sd.wiktionary.org/w/api.php',
          name: 'سنڌي',
          numberEntries: 2107,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionarySd instance = SourceWiktionarySd._();
}

class SourceWiktionaryShn extends SourceWiktionary {
  const SourceWiktionaryShn._()
      : super(
          urlApi: 'https://shn.wiktionary.org/w/api.php',
          name: 'ၽႃႇသႃႇတႆး',
          numberEntries: 27258,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryShn instance = SourceWiktionaryShn._();
}

class SourceWiktionaryShy extends SourceWiktionary {
  const SourceWiktionaryShy._()
      : super(
          urlApi: 'https://shy.wiktionary.org/w/api.php',
          name: 'tacawit',
          numberEntries: 3651,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryShy instance = SourceWiktionaryShy._();
}

class SourceWiktionaryVec extends SourceWiktionary {
  const SourceWiktionaryVec._()
      : super(
          urlApi: 'https://vec.wiktionary.org/w/api.php',
          name: 'vèneto',
          numberEntries: 4938,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryVec instance = SourceWiktionaryVec._();
}

class SourceWiktionaryFa extends SourceWiktionary {
  const SourceWiktionaryFa._()
      : super(
          urlApi: 'https://fa.wiktionary.org/w/api.php',
          name: 'فارسی',
          numberEntries: 103915,
          namespaces: const [
            NamespaceDictionary(),
            NamespaceAppendix(namespaceId: 100, namespaceName: 'پیوست:'),
          ],
        );
  static const SourceWiktionaryFa instance = SourceWiktionaryFa._();
}

class SourceWiktionaryUg extends SourceWiktionary {
  const SourceWiktionaryUg._()
      : super(
          urlApi: 'https://ug.wiktionary.org/w/api.php',
          name: 'ئۇيغۇرچە / Uyghurche',
          numberEntries: 1570,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryUg instance = SourceWiktionaryUg._();
}

class SourceWiktionaryDv extends SourceWiktionary {
  const SourceWiktionaryDv._()
      : super(
          urlApi: 'https://dv.wiktionary.org/w/api.php',
          name: 'ދިވެހިބަސް',
          numberEntries: 226,
          namespaces: const [
            NamespaceDictionary(),
          ],
        );
  static const SourceWiktionaryDv instance = SourceWiktionaryDv._();
}

//class SourceWiktionaryAls extends SourceWiktionary {
//  const SourceWiktionaryAls._()
//      : super(
//          url: 'https://als.wiktionary.org/w/api.php',
//          name: 'Alemannisch',
//        );
//  static const SourceWiktionaryAls instance = SourceWiktionaryAls._();
//}
//
