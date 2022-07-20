import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class AgywDreamsShortForm {
  static List<String> getMandatoryFields() {
    return ['lvT9gfpHIlT'];
  }

  static List<FormSection> getFormSections({
    required String firstDate,
  }) {
    return [
      FormSection(
          name: 'HTS Form',
          color: const Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'lvT9gfpHIlT',
                name: 'Date service was provided',
                translatedName: '',
                valueType: 'DATE',
                firstDate: firstDate,
                inputColor: const Color(0xFF258DCC),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'zbHpXUjGv5H',
                name: 'HIV test provided',
                translatedName: '',
                valueType: 'BOOLEAN',
                inputColor: const Color(0xFF258DCC),
                labelColor: const Color(0xFF737373)),
            InputField(
              id: 'GHfoqXKlK6o',
              name: 'Type of Test',
              translatedName: '',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
              options: [
                InputFieldOption(
                    code: 'PDHTS', name: 'PDHTS', translatedName: 'PDHTS'),
                InputFieldOption(
                    code: 'HIVST', name: 'HIVST', translatedName: 'HIVST'),
              ],
            ),
            InputField(
              id: 'rJUdBXiukaI',
              name: 'HIV test results',
              translatedName: '',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
              options: [
                InputFieldOption(
                    code: 'Negative', name: 'Negative', translatedName: ''),
                InputFieldOption(
                    code: 'Positive', name: 'Positive', translatedName: ''),
                InputFieldOption(
                    code: 'Unknown', name: 'Unknown', translatedName: ''),
              ],
            ),
          ])
    ];
  }
}
