import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcEnrollmentBasicInfo {
  static List<String> getMandatoryField() {
    return ['location', 's1eRvsL2Ly4', 'rSP9c21JsfC', 'vIX4GTSCX4P'];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Caregiver information',
          color: Color(0xFF1A3518),
          subSections: [
            FormSection(name: '', color: Color(0xFF737373), inputFields: [
              InputField(
                  id: 'location',
                  name: 'Location',
                  valueType: 'ORGANISATION_UNIT',
                  inputColor: Color(0xFF4B9F46),
                  labelColor: Color(0xFF737373))
            ]),
            FormSection(
                name: 'Caregiver',
                color: Color(0xFF737373),
                inputFields: [
                  InputField(
                      id: 's1eRvsL2Ly4',
                      name: 'First Name',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF4B9F46)),
                  InputField(
                      id: 's1HaiT6OllL',
                      name: 'Middle Name',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF4B9F46)),
                  InputField(
                      id: 'rSP9c21JsfC',
                      name: 'Surname',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF4B9F46)),
                  InputField(
                      id: 'tNdoR0jYr7R',
                      name: 'Phone Number',
                      valueType: 'PHONE_NUMBER',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF4B9F46)),
                  InputField(
                      id: 'qZP982qpSPS',
                      name: 'Date of Birth',
                      valueType: 'DATE',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'ls9hlz2tyol',
                      name: 'Age',
                      valueType: 'NUMBER',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'vIX4GTSCX4P',
                      name: 'Sex',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      renderAsRadio: true,
                      options: [
                        InputFieldOption(code: 'Male', name: 'Male'),
                        InputFieldOption(code: 'Female', name: 'Female'),
                      ])
                ])
          ])
    ];
  }
}
