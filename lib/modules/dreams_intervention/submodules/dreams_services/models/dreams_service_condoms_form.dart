import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class DreamsCondomsform{
  static List<FormSection> getFormSections() {
    return [    
      FormSection(
          name: 'Condoms',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'lvT9gfpHIlT',
                name: 'Date service was provided',
                valueType: 'DATE',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'uciT2F6ByYO',
                name: 'Contraceptives (Condoms)',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'sdgj99xGuv3',
                name: 'Number of condoms provided',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
          ])
    ];
  }
}
