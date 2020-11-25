import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcEnrollmentNoneParticipation {
  static List<String> getMandatoryField() {
    return [
      'JhOvli80Qbx',
      'jjZWuJfVStp',
      'jVSwC6Ln95H',
      'an7w8LYPZ7y',
      'FHn0nJPumhO'
    ];
  }

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
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'UUsPnBtuItN',
              name: 'Middle Name',
              valueType: 'TEXT',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'jjZWuJfVStp',
              name: 'Surname',
              valueType: 'TEXT',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'ox6mydZjgC3',
              name: 'Phone Number',
              valueType: 'PHONE_NUMBER',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'jVSwC6Ln95H',
              name: 'Date of Birth',
              valueType: 'DATE',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
              minAgeInYear: 18,
              hint: "Beneficiary's age should be from 18 years and above",
            ),
            InputField(
              id: 'mZs1YsN56cR',
              name: 'Age',
              isReadOnly: true,
              valueType: 'NUMBER',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
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
                    'Reason why the participant can not be part of the programme',
                valueType: 'LONG_TEXT')
          ])
    ];
  }
}
