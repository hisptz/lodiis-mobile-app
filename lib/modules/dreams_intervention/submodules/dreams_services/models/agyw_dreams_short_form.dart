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
                id: 'zbHpXUjGv5H',
                name: 'HIV test provided',
                translatedName: '',
                valueType: 'BOOLEAN',
                inputColor: const Color(0xFF258DCC),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'lvT9gfpHIlT',
                name: 'Date service was provided',
                translatedName: '',
                valueType: 'DATE',
                firstDate: firstDate,
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
                InputFieldOption(code: 'Negative', name: 'Negative'),
                InputFieldOption(code: 'Positive', name: 'Positive'),
                InputFieldOption(code: 'Unknown', name: 'Unknown'),
              ],
            ),
            InputField(
              id: 'gEjigBuBTmh',
              name: 'Reasons for rejecting/declining service(s) offered',
              valueType: 'TEXT',
              options: [
                InputFieldOption(
                    code: 'Religion/Culture', name: 'Religion/Culture'),
                InputFieldOption(
                    code: 'Service already provided',
                    name: 'Service already provided (by other provider)'),
                InputFieldOption(code: 'NotReady', name: 'Not Ready'),
                InputFieldOption(
                    code: 'HealthConcerns', name: 'Health Concerns'),
                InputFieldOption(
                    code: 'AccessIssues',
                    name: 'Access Issues (resources, time)'),
                InputFieldOption(code: 'NotInterested', name: 'Not Interested'),
                InputFieldOption(code: 'Other(s)', name: 'Other(s)')
              ],
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'oTTL6vEpKok',
              name: 'Specify other reasons for service declining',
              valueType: 'LONG_TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
          ])
    ];
  }
}
