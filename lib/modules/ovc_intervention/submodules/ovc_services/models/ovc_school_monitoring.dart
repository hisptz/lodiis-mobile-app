import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcSchoolMonitoring {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'DOMAIN SCHOOLED',
          translatedName: 'TSA SEKOLO',
          color: const Color(0xFF4A9F46),
          borderColor: const Color(0xFF4A9F46),
          inputFields: [
            InputField(
                id: 'Uw2Z1XNFgXI',
                name: '1. Is the child still in school?',
                translatedName: '1. Na ngoana on ntse a kena sekolo?',
                valueType: 'BOOLEAN',
                inputColor: const Color(0xFF4A9F46),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 't6kN1SwgMSs',
                name: '2. School name?',
                translatedName: '2. Lebitso la Sekolo?',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4A9F46),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'yYuNppDTRji',
                name: 'Grade?',
                translatedName: 'Sehlopha',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4A9F46),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'vigylZN5Wjz',
                name: '3. Why is the child not in school?',
                translatedName: '3. Ha Karabo e le Che, Fana ka Mabaka',
                valueType: 'LONG_TEXT',
                inputColor: const Color(0xFF4A9F46),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'vci20we0Ypg',
                name:
                    '4. Has the child/OVC missed school for 10 or more consecutive days?',
                translatedName:
                    '4. Na khoeling tse tharo tse fetileng ngoana o la ka se ee sekolong matsatsi a 10 a hlahlamanang?',
                valueType: 'BOOLEAN',
                inputColor: const Color(0xFF4A9F46),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'O8VSN74kSJx',
                name:
                    '5. Did the child/OVC have any challenges related to school that could have led to low/bad/poor performance?',
                translatedName:
                    '5. Na ngoana o bile le mathata a amanang le ho kena sekolo a neng a ka ama tsebetso ea hae sekolong?',
                valueType: 'BOOLEAN',
                inputColor: const Color(0xFF4A9F46),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'na5YEZYwY0l',
                name:
                    'What were the challenges the child had related to school that could have led to low/bad performance?',
                translatedName: 'Ha Karabo e le E, Fana ka Mabaka',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4A9F46),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'sCR0ebG3UWX',
                name:
                    '6. Does the caregiver play any role to boost the child school performance?',
                translatedName:
                    '6. Na Mohlokomeli o na le karolo eo a e bapalang ho thusa ho nyolla mosebetsi oa ngoana oa sekolo?',
                valueType: 'BOOLEAN',
                inputColor: const Color(0xFF4A9F46),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'IWxxfSkEplj',
                name:
                    'Explain how caregiver boost the child school performance',
                translatedName: 'Hlalosa Karabo ea hau',
                valueType: 'LONG_TEXT',
                inputColor: const Color(0xFF4A9F46),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'fZEQ0wIyB5h',
                name:
                    '8. Comparing the last quarter to the current quarter performance; how has the child performed?',
                translatedName:
                    '8. Ha o bapisa sephetho sa nako e fetileng le sa hona joale, ngoana o sebelitseng joang?',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Better', name: 'Better'),
                  InputFieldOption(code: 'Same', name: 'Same'),
                  InputFieldOption(code: 'Worse', name: 'Worse')
                ]),
            InputField(
                id: 'iBanzhFYlRN',
                name:
                    '9. What are the Caregiver’s comments about child attendance and performance',
                translatedName:
                    '9. Maikutlo a Mohlokomeli ke a fe ke tsela eo ngoana a kenang sekolo ka eona le tsebetso ea hae sekolong?',
                valueType: 'LONG_TEXT',
                inputColor: const Color(0xFF4A9F46),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'uEeaGfuxHyV',
                name: 'End of Quarter/year Result',
                translatedName: 'Sephetho sa qetello ea kotara kapa selemo',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Passed', name: 'Passed'),
                  InputFieldOption(code: 'Failed', name: 'Failed'),
                  InputFieldOption(
                      code: 'Did not write exams', name: 'Did not write exams')
                ]),
            InputField(
                id: 'zpykd7zvLsC',
                name: 'End of year result',
                translatedName: 'Sephetho sa qetello ea selemo',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Progressing to next grade',
                      translatedName: 'O ea sehlopheng se seng ',
                      name: 'Progressing to next grade'),
                  InputFieldOption(
                      code: 'Repeating same grade',
                      translatedName: 'O pheta sehlopha',
                      name: 'Repeating same grade'),
                  InputFieldOption(
                      code: 'Dropped-out',
                      translatedName: 'O tlohela sekola',
                      name: 'Dropped-out')
                ]),
          ])
    ];
  }
}
