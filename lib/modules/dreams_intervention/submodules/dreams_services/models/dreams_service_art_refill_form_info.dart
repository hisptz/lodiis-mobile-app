import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class DreamsARTRefillInfo {
  static List<FormSection> getFormSections({
    required String enrollementDate,
  }) {
    return [
      FormSection(
          name: 'ART Re-fill',
          color: const Color(0xFF737373),
          inputFields: [
            InputField(
              id: 'lvT9gfpHIlT',
              name: 'Date service was provided',
              valueType: 'DATE',
              firstDate: enrollementDate,
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'uWKbFmG9ZWQ',
              name: 'ART Re-fill',
              valueType: 'TRUE_ONLY',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
          ])
    ];
  }
}
