import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamsANCInfo {
  static List<FormSection> getFormSections({
    required String firstDate,
  }) {
    return [
      FormSection(name: 'ANC', color: const Color(0xFF737373), inputFields: [
        InputField(
          id: 'lvT9gfpHIlT',
          name: 'Date service was provided',
          valueType: 'DATE',
          firstDate: firstDate,
          inputColor: const Color(0xFF258DCC),
          labelColor: const Color(0xFF737373),
        ),
        InputField(
          id: 'irtbsom4W8P',
          name: 'ANC',
          valueType: 'BOOLEAN',
          inputColor: const Color(0xFF258DCC),
          labelColor: const Color(0xFF737373),
        ),
        InputField(
            id: 'm4cRnpwgOlY',
            name: 'ANC Visit',
            valueType: 'TEXT',
            inputColor: const Color(0xFF258DCC),
            labelColor: const Color(0xFF737373),
            options: [
              InputFieldOption(code: "ANC 1st Visit", name: "ANC 1st Visit"),
              InputFieldOption(code: "ANC 2nd Visit", name: "ANC 2nd Visit"),
              InputFieldOption(code: "ANC 3rd Visit", name: "ANC 3rd Visit"),
              InputFieldOption(code: "ANC 4th Visit", name: "ANC 4th Visit"),
            ]),
      ])
    ];
  }
}
