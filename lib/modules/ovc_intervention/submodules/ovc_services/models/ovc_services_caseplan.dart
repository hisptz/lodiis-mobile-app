import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcServicesCasePlan {
  static List<FormSection> getFormSections() {
    return [
            FormSection(
                name: '',
                color: Color(0xFF4A9F46),
                borderColor: Color(0xFF4A9F46),
                inputFields: [
                InputField(
                      id: 'vexrPNgPBYg',
                      name: 'Domain',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Health', name: 'Health'),
                        InputFieldOption(code: 'Safe', name: 'Safe'),
                        InputFieldOption(code: 'Stable', name: 'Stable'),
                        InputFieldOption(code: 'Schooled', name: 'Schooled')
                      ]),
                InputField(
                      id: 'ADc3clrQRl4',
                      name: 'Goal 1',
                      valueType: 'LONG_TEXT',
                      inputColor: Color(0xFF4A9F46),
                      labelColor: Color(0xFF737373)),
                 InputField(
                      id: 'efNgDIqhlNs',
                      name: 'Goal 2',
                      valueType: 'LONG_TEXT',
                      inputColor: Color(0xFF4A9F46),
                      labelColor: Color(0xFF737373)),
                ])
    ];
  }
}
