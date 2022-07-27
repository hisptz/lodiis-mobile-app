import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class DreamsCondomsForm {
  static List<FormSection> getFormSections({
    required String firstDate,
  }) {
    return [
      FormSection(
          name: 'Condom Education/Provision',
          color: const Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'lvT9gfpHIlT',
                name: 'Date service was provided',
                valueType: 'DATE',
                firstDate: firstDate,
                inputColor: const Color(0xFF258DCC),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'uciT2F6ByYO',
                name: 'Condom Education/Provision',
                valueType: 'BOOLEAN',
                inputColor: const Color(0xFF258DCC),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'sdgj99xGuv3',
                name: 'Number of condoms provided',
                valueType: 'NUMBER',
                inputColor: const Color(0xFF258DCC),
                labelColor: const Color(0xFF737373)),
          ])
    ];
  }
}
