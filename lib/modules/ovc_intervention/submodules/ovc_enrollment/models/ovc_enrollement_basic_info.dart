import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class OvcEnrollmentBasicInfo {
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
                      labelColor: Color(0xFF4B9F46))
                ])
          ])
    ];
  }
}
