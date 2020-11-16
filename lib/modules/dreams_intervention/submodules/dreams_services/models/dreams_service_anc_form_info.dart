import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamsANCInfo{
  static List<FormSection> getFormSections() {
    return [    
      FormSection(
          name: 'ANC',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'irtbsom4W8P',
                name: 'ANC',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),  ),
                  InputField(
                id: 'm4cRnpwgOlY',
                name: 'ANC Visit',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: "ANC 1st Visit", name: "ANC 1st Visit"),
                  InputFieldOption(code: "ANC 2nd Visit", name: "ANC 2nd Visit"),
                  InputFieldOption(code: "ANC 3rd Visit", name: "ANC 3rd Visit"),
                  InputFieldOption(code: "ANC 4th Visit", name: "ANC 4th Visit"),
                ]
                ),
                   InputField(
                id: 'lvT9gfpHIlT',
                name: 'Date service was provided',
                valueType: 'DATE',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),)
          ])
    ];
  }
}
