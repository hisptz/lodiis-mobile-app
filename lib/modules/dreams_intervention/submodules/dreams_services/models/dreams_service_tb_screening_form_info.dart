import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamsServiceTBScreeningInfo {
  static List<FormSection> getFormSections() {
    return [
      FormSection(name: '', color: Colors.transparent, inputFields: [
        InputField(
            id: 'YlP3TG4JYKR',
            inputColor: Color(0xFF1F8ECE),
            labelColor: Color(0xFF737373),
            name: 'Pregnant',
            valueType: 'BOOLEAN'),
        InputField(
            id: 'yIZY0baE8JP',
            name: 'Gestational age',
            inputColor: Color(0xFF1F8ECE),
            labelColor: Color(0xFF737373),
            valueType: 'NUMBER'),
        InputField(
          id: 'uRsImCXXDXe',
          name: 'HIV Status',
          valueType: 'TEXT',
          inputColor: Color(0xFF1F8ECE),
          labelColor: Color(0xFF737373),
          isReadOnly: true,
          options: [
            InputFieldOption(code: 'Positive', name: 'Positive'),
            InputFieldOption(code: 'Negative', name: 'Negative'),
            InputFieldOption(code: 'Indeterminate', name: 'Indeterminate')
          ],
        ),
        InputField(
            id: 'tMvluCbiiUm',
            inputColor: Color(0xFF1F8ECE),
            labelColor: Color(0xFF737373),
            name: 'Are you coughing',
            valueType: 'BOOLEAN'),
        InputField(
            id: 'P9hiqrTjAdg',
            inputColor: Color(0xFF1F8ECE),
            labelColor: Color(0xFF737373),
            name: 'Have you lost weight (without trying)',
            valueType: 'BOOLEAN'),
        InputField(
            id: 'Y8Xzy7bEWsi',
            inputColor: Color(0xFF1F8ECE),
            labelColor: Color(0xFF737373),
            name: 'Do you have drenching or soaking sweats at night',
            valueType: 'BOOLEAN'),
        InputField(
            id: 'VETgonq6tFr',
            inputColor: Color(0xFF1F8ECE),
            labelColor: Color(0xFF737373),
            name: 'Do you have fever',
            valueType: 'BOOLEAN'),
      ])
    ];
  }
}
