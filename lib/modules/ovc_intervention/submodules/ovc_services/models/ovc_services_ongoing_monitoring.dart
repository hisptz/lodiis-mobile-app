import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/constants/ovc_intervention_constant.dart';

class OvcServicesOngoingMonitoring {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          id: 'Health',
          name: 'DOMAIN HEALTH',
          translatedName: 'BOPHELO BO BOTLE',
          color: const Color(0xFF4D9E49),
          borderColor: const Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'kVvlzs4hSP3',
                name: 'HIVSCREEN Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa HIVSCREEN',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'DC4B9EIMZN9',
                name: 'HTS Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa HTS',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'yOoWkd9dHsJ',
                name: 'HIVTREAT Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa HIVTREAT',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'PcLhqLEjKGw',
                name: 'HIVS&D/HIV Messaging Service progress',
                translatedName:
                    'Tsoelo-pele ea litšebeletso tsa HIVS&D/HIV Messaging ',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'fySDvo8AXNy',
                name: 'HEALTH Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa HEALTH',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'kWyCcWCVJjv',
                name: 'PRG&L Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa PRG&L',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'QvFFo0xqZCy',
                name: 'SAIDS Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa SAIDS',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'Kcy88uJjTQl',
                name: 'IMMUNIZE Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa IMMUNIZE',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'a7yFGFtZ3U9',
                name: 'MALNU Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa MALNU',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'A3aXfHkuywQ',
                name: 'CCFLS Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa CCFLS',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'qhTPL1R9OlY',
                name: 'STIMULATE Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa STIMULATE',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'FroSdO9AGHb',
                name: 'TBSCREEN Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa TBSCREEN',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'lviiwATI5uv',
                name: 'TBREFER Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa TBREFER',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'BLuel6eSkV3',
                name: 'FOODPREP Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa FOODPREP',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'JINWcteYR7D',
                name: 'FOODPREV Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa FOODPREV',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'gtXZARFG9Pa',
                name: 'FOODSUPP Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa FOODSUPP',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373))
          ]),
      FormSection(
          id: 'Stable',
          name: 'DOMAIN STABLE',
          translatedName: 'BOTSITSO',
          color: const Color(0xFF0000FF),
          borderColor: const Color(0xFF0000FF),
          inputFields: [
            InputField(
                id: 'EG4MGO83vqG',
                name: 'OVCFUND Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa OVCFUND',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'a7GDFMWz1qf',
                name: 'Savings Group Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa Savings Group',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'VtX5d8LBcZP',
                name: 'EST COOPRTVS Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa EST COOPRTVS',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'b2f8Bv0MozX',
                name: 'FUNCT COOPRTVS Service progress',
                translatedName:
                    'Tsoelo-pele ea litšebeletso tsa FUNCT COOPRTVS ',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'HwbAyUqRqjT',
                name: 'MARKT COOPRTVS Service progress',
                translatedName:
                    'Tsoelo-pele ea litšebeletso tsa MARKT COOPRTVS ',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373))
          ]),
      FormSection(
          id: 'Safe',
          name: 'DOMAIN SAFE',
          translatedName: 'TSIRELETSO',
          color: const Color(0xFF0F9587),
          borderColor: const Color(0xFF0F9587),
          inputFields: [
            InputField(
                id: 'KNRkkNs8IeP',
                name: 'Singing to the LION Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa SLION',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0F9587),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'UqQEuWwhwBd',
                name: 'RTEEN/Parenting Service progress',
                translatedName:
                    'Tsoelo-pele ea litšebeletso tsa RTEEN/Parenting',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0F9587),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'amHHA220xdt',
                name: 'RKIDS Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa RKIDS',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0F9587),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'es23GNgSa7N',
                name: 'VAC/VAC Messaging Service progress',
                translatedName:
                    'Tsoelo-pele ea litšebeletso tsa VAC/VAC Messaging',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0F9587),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'x3FxC6Bw139',
                name: 'VAC Legal Messaging progress',
                translatedName:
                    'Tsoelo-pele ea litšebeletso tsa VAC Legal Messaging progress',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0F9587),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'akSICiOvXty',
                name: 'Survivors of Abuse Service progress',
                translatedName:
                    'Tsoelo-pele ea litšebeletso tsa Survivors of Abuse',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0F9587),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'J5Tw8gd59Aq',
                name: 'COUNSEL Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa COUNSEL',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0F9587),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'HY12JH4WYIl',
                name: 'FCARE Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa FCARE',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0F9587),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'ouQhwyHxW0W',
                name: 'SHELTER Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa SHELTER',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0F9587),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'ngjLjWJjPmN',
                name: 'ABUSE Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa ABUSE',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0F9587),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'XPFvUiqedGQ',
                name: 'LEGALPROT Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa LEGALPROT',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0F9587),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'zYjncKPdz9C',
                name: 'BIRTHCERT Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa BIRTHCERT',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0F9587),
                labelColor: const Color(0xFF737373))
          ]),
      FormSection(
          id: 'Schooled',
          name: 'DOMAIN SCHOOLED',
          translatedName: 'TSA SEKOLO',
          color: const Color(0xFF9B2BAE),
          borderColor: const Color(0xFF9B2BAE),
          inputFields: [
            InputField(
                id: 'AKjlaqY2VFZ',
                name: 'Aflatoun/teen Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa Aflatoun/teen',
                valueType: 'TEXT',
                inputColor: const Color(0xFF9B2BAE),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'KURLrgcqqZS',
                name: 'PTS4G Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa PTS4G',
                valueType: 'TEXT',
                inputColor: const Color(0xFF9B2BAE),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'MKfKx93j7Mb',
                name: 'PTS4NG Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa PTS4NG',
                valueType: 'TEXT',
                inputColor: const Color(0xFF9B2BAE),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'I4vmREMJZug',
                name: 'HWCLUB Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa HWCLUB',
                valueType: 'TEXT',
                inputColor: const Color(0xFF9B2BAE),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'wJergsqzGLz',
                name: 'BURSARY Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa BURSARY',
                valueType: 'TEXT',
                inputColor: const Color(0xFF9B2BAE),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'V8IMX0zD0Of',
                name: 'SFEES Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa SFEES',
                valueType: 'TEXT',
                inputColor: const Color(0xFF9B2BAE),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'ks2bazFqWHo',
                name: 'SMATERIAL Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa SMATERIAL',
                valueType: 'TEXT',
                inputColor: const Color(0xFF9B2BAE),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'T51fsJaITSM',
                name: 'REENROL Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa REENROL',
                valueType: 'TEXT',
                inputColor: const Color(0xFF9B2BAE),
                labelColor: const Color(0xFF737373)),
          ]),
      FormSection(
          name: 'Other activities',
          color: const Color(0xFF4D9E49),
          borderColor: const Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'C06k1O4qrjw',
                name: 'Other activities progress',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373))
          ]),
      FormSection(
          id: '',
          name: 'For those who were referred and changing HIV status',
          translatedName:
              'Bakeng sa ba fetiselitsoeng litsing tsa bophelo le bao boemo ba bona ba tšoaetso bo fetohileng',
          color: const Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'gdbL3fKWwXn',
                name: 'Tested for HIV?',
                translatedName: 'Hlahlobile HIV?',
                valueType: 'BOOLEAN',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'uRsImCXXDXe',
                name: 'HIV status',
                valueType: 'TEXT',
                options: [
                  InputFieldOption(code: 'Positive', name: 'Positive'),
                  InputFieldOption(code: 'Negative', name: 'Negative'),
                  InputFieldOption(code: 'No Response', name: 'No Response'),
                ],
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'jiS3es770I1',
                name: 'Has the child been referred for ART?',
                translatedName: 'Has the child been referred for ART?',
                valueType: 'BOOLEAN',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'ywYdzitJvSi',
                name: 'Was the referred child enrolled for ART services?',
                translatedName:
                    'Na ngoana o ile a fumana litšebeletso tsa kalafo?',
                valueType: 'BOOLEAN',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'KgLtXquRot3',
                name: 'Health facility',
                valueType: 'ORGANISATION_UNIT',
                allowedSelectedLevels: [4],
                filteredPrograms: [OvcInterventionConstant.program],
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373)),
          ]),
    ];
  }
}
