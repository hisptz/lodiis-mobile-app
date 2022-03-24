import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class DreamsPEPInfo {
  static List<FormSection> getFormSections() {
    return [
      FormSection(name: 'PEP', color: const Color(0xFF737373), inputFields: [
        InputField(
          id: 'lvT9gfpHIlT',
          name: 'Date service was provided',
          valueType: 'DATE',
          inputColor: const Color(0xFF258DCC),
          labelColor: const Color(0xFF737373),
        ),
        InputField(
          id: 'mcgHO4djXTu',
          name: 'PEP',
          valueType: 'TRUE_ONLY',
          inputColor: const Color(0xFF258DCC),
          labelColor: const Color(0xFF737373),
        ),
      ])
    ];
  }
}
