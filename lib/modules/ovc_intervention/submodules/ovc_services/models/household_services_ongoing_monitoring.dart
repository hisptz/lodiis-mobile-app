import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class HouseholdServicesOngoingMonitoring {
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
                id: 'qezhtOHXgaK',
                name: 'WASHMES Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa WASHMES',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'W4UjM09aOEw',
                name: 'SOACKAGE Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa SOACKAGE',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'TaSyHHXKYhF',
                name: 'TIPPY Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa TIPPY',
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
                id: 'wNUBfCAg3Fq',
                name: 'SILC Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa SILC',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'QD77bNjavza',
                name: 'Financial Education Service progress',
                translatedName:
                    'Tsoelo-pele ea litšebeletso tsa Financial Education',
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
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'legjCg7fomo',
                name: 'K/TPLOTS Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa K/TPLOTS ',
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
                id: 'JgokYFY6IWK',
                name: 'P&FC Service progress',
                translatedName: 'Tsoelo-pele ea litšebeletso tsa P&FC',
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
                    'Tsoelo-pele ea litšebeletso tsa VAC Legal Messaging',
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
          ]),
      // FormSection(
      //     name: 'Other activities',
      //     color: Color(0xFF4D9E49),
      //     borderColor: Color(0xFF4D9E49),
      //     inputFields: [
      //       InputField(
      //           id: 'C06k1O4qrjw',
      //           name: 'Other activities progress',
      //           valueType: 'TEXT',
      //           inputColor: Color(0xFF4D9E49),
      //           labelColor: Color(0xFF737373))
      //     ]),
      FormSection(
        id: '',
        name: 'Household ongoing monitoring',
        color: const Color(0xFF4D9E49),
        inputFields: [
          InputField(
              id: 'kEa51XegbF1',
              name:
                  'Since our last visit, has there been any major positive and/ or negative changes within your family which has affected you?',
              translatedName:
                  'Khetlo la ho qetela ha re kopana, na ho na le liphetoho tse kholo tse ntle le / kapa tse mpe ka har\'a lelapa la hau tse u etsahalletseng kapa bana le litho tse ling tsa lelapa',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF4D9E49),
              labelColor: const Color(0xFF737373)),
          InputField(
              id: 'whQroZXYFXl',
              name: 'Positive Changes',
              translatedName: 'Liphetoho tse ntle',
              valueType: 'LONG_TEXT',
              inputColor: const Color(0xFF4D9E49),
              labelColor: const Color(0xFF737373)),
          InputField(
              id: 'u7CdxVqH9Cv',
              name: 'Challenges hindering progress',
              translatedName: 'Mathata a sitisang tsoelo-pele',
              valueType: 'LONG_TEXT',
              inputColor: const Color(0xFF4D9E49),
              labelColor: const Color(0xFF737373)),
          InputField(
              id: 'pgjVoHQ4rr7',
              name: 'Has the size of your family changed since our last visit',
              translatedName:
                  'Na boholo ba lelapa la hau bo fetohile ho tloha ha re etela ka lekhetlo la ho qetela',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF4D9E49),
              labelColor: const Color(0xFF737373)),
          InputField(
              id: 'lHfHlWRFF7C',
              name: 'how?',
              translatedName: 'ho joalo',
              description:
                  'Please note if any child or adult has either joined or left the household',
              translatedDescription:
                  'ka kopo, ela hloko haeba ho na le ngoana kapa motho e moholo ea seng a lula kapa a tsoileng lelapeng leno',
              valueType: 'LONG_TEXT',
              inputColor: const Color(0xFF4D9E49),
              labelColor: const Color(0xFF737373)),
          InputField(
              id: 'hf7JylP0eB2',
              name:
                  'Since our last visit, is there other information you would like to share (any changes in the Case Plan that need to be made)?',
              translatedName:
                  'Ho tloha ha ke etile  lekhetlo la ho qetela, na ho na le tlhahiso-leseling e \'ngoe eo u ka ratang ho e mpolella (liphetoho life kapa life ka moralo oa tsebetso tse lokelang ho etsoa)?',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF4D9E49),
              labelColor: const Color(0xFF737373)),
        ],
      ),
      FormSection(
          id: '',
          name: 'For those who were referred and changing HIV status',
          translatedName:
              'Bakeng sa ba fetiselitsoeng litsing tsa bophelo le bao boemo ba bona ba tšoaetso bo fetohileng',
          color: const Color(0xFF4D9E49),
          inputFields: [
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
          ]),
    ];
  }
}
