import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class DreamsServiceTBScreeningInfo {
  static List<FormSection> getFormSections() {
    return [
      FormSection(name: '', color: Colors.transparent, inputFields: [
        InputField(
            id: 'YlP3TG4JYKR',
            inputColor: Color(0xFF1F8ECE),
            labelColor: Color(0xFF05131B),
            name: 'Pregnant',
            valueType: 'BOOLEAN'),
        InputField(
            id: 'yIZY0baE8JP',
            name: 'Gestational age',
            inputColor: Color(0xFF1F8ECE),
            labelColor: Color(0xFF05131B),
            valueType: 'NUMBER'),
        InputField(
          id: 'uRsImCXXDXe',
          name: 'HIV Status',
          valueType: 'TEXT',
          inputColor: Color(0xFF1F8ECE),
          labelColor: Color(0xFF05131B),
        ),
        InputField(
            id: 'tMvluCbiiUm',
            inputColor: Color(0xFF1F8ECE),
            labelColor: Color(0xFF05131B),
            name: 'Are you coughing',
            valueType: 'BOOLEAN'),
        InputField(
            id: 'P9hiqrTjAdg',
            inputColor: Color(0xFF1F8ECE),
            labelColor: Color(0xFF05131B),
            name: 'Have you lost weight (without trying)',
            valueType: 'BOOLEAN'),
        InputField(
            id: 'Y8Xzy7bEWsi',
            inputColor: Color(0xFF1F8ECE),
            labelColor: Color(0xFF05131B),
            name: 'Do you have drenching or soaking sweats at night',
            valueType: 'BOOLEAN'),
        InputField(
            id: 'VETgonq6tFr',
            inputColor: Color(0xFF1F8ECE),
            labelColor: Color(0xFF05131B),
            name: 'Do you have fever',
            valueType: 'BOOLEAN'),
      ])
    ];
  }
}
