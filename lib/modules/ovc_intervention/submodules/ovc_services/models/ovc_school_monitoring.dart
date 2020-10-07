import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcSchoolMonitoring {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'DOMAIN SCHOOLED',
          color: Color(0xFF4A9F46),
          borderColor: Color(0xFF4A9F46),
          inputFields: [
            InputField(
                id: 'Uw2Z1XNFgXI',
                name: 'Is the child still in school?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF4A9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 't6kN1SwgMSs',
                name: 'School name?',
                valueType: 'TEXT',
                inputColor: Color(0xFF4A9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yYuNppDTRji',
                name: 'Grade?',
                valueType: 'TEXT',
                inputColor: Color(0xFF4A9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'vigylZN5Wjz',
                name: 'Why is the child not in school?',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF4A9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'vci20we0Ypg',
                name:
                    'Has the child/OVC missed school for 10 or more consecutive days?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF4A9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'O8VSN74kSJx',
                name:
                    'Did the child/OVC have any challenges related to school that could have led to low/bad/poor performance?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF4A9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'na5YEZYwY0l',
                name:
                    'What were the challenges the child had related to school that could have led to low/bad performance?',
                valueType: 'TEXT',
                inputColor: Color(0xFF4A9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'sCR0ebG3UWX',
                name:
                    'Does the caregiver play any role to boost the child school performance?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF4A9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'IWxxfSkEplj',
                name:
                    'Explain how caregiver boost the child school performance',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF4A9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fZEQ0wIyB5h',
                name:
                    'Comparing the last quarter to the current quarter performance; how has the child performed?',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Better', name: 'Better'),
                  InputFieldOption(code: 'Same', name: 'Same'),
                  InputFieldOption(code: 'Worse', name: 'Worse')
                ]),
            InputField(
                id: 'iBanzhFYlRN',
                name:
                    'What are the Caregiver’s comments about child attendance and performance',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF4A9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'uEeaGfuxHyV',
                name: 'End of Quarter/year Result',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Passed', name: 'Passed'),
                  InputFieldOption(code: 'Failed', name: 'Failed'),
                  InputFieldOption(
                      code: 'Did not write exams', name: 'Did not write exams')
                ]),
            InputField(
                id: 'zpykd7zvLsC',
                name: 'End of year result',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Progressing to next grade',
                      name: 'Progressing to next grade'),
                  InputFieldOption(
                      code: 'Repeating same grade',
                      name: 'Repeating same grade'),
                  InputFieldOption(code: 'Dropped-out', name: 'Dropped-out')
                ]),
          ])
    ];
  }
}
