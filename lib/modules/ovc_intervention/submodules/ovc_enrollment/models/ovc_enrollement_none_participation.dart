import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcEnrollmentNoneParticipation {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Caregiver information',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'JhOvli80Qbx',
                name: 'First Name',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
            InputField(
                id: 'UUsPnBtuItN',
                name: 'Middle Name',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
            InputField(
                id: 'jjZWuJfVStp',
                name: 'Surname',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
            InputField(
                id: '',
                name: 'Phone Number',
                valueType: 'PHONE_NUMBER',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
            InputField(
                id: 'an7w8LYPZ7y',
                name: 'Age',
                valueType: 'NUMBER',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'an7w8LYPZ7y',
                name: 'Sex',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                renderAsRadio: true,
                options: [
                  InputFieldOption(code: 'Male', name: 'Male'),
                  InputFieldOption(code: 'Female', name: 'Female'),
                ]),
            InputField(
                id: 'FHn0nJPumhO',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                name:
                    'Reason why the participant can not be part of the programm',
                valueType: 'LONG_TEXT')
          ])
    ];
  }
}
