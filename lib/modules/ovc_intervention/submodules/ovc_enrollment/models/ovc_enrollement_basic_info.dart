import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcEnrollmentBasicInfo {
  static List<String> getMandatoryField() {
    return ['WTZ7GLTrE8Q', 'rSP9c21JsfC', 'qZP982qpSPS', 'vIX4GTSCX4P'];
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
                  translatedName: 'Sebaka',
                  isReadOnly: true,
                  allowedSelectedLevels: [3, 4],
                  valueType: 'ORGANISATION_UNIT',
                  inputColor: Color(0xFF4B9F46),
                  labelColor: Color(0xFF737373))
            ]),
            FormSection(
                name: 'Caregiver',
                translatedName: "Mohlokomeli",
                color: Color(0xFF737373),
                inputFields: [
                  InputField(
                    id: 'WTZ7GLTrE8Q',
                    name: 'First Name',
                    translatedName: 'Lebitso la pele',
                    valueType: 'TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 's1HaiT6OllL',
                    name: 'Middle Name',
                    translatedName: 'Lebitso le mahareng',
                    valueType: 'TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'rSP9c21JsfC',
                    name: 'Surname',
                    translatedName: 'Le Fane',
                    valueType: 'TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'tNdoR0jYr7R_confirm',
                    name: 'Does caregiver have a phone number',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'tNdoR0jYr7R',
                    name: 'Phone Number',
                    valueType: 'PHONE_NUMBER',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'cvrdI9t4rtN_confirm',
                    name: 'Does caregiver have another phone number',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'cvrdI9t4rtN',
                    name: 'Other Phone Number',
                    valueType: 'PHONE_NUMBER',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'W7QUtemHnvI',
                    name: 'Other Phone Number Relationship',
                    valueType: 'TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'qZP982qpSPS',
                    name: 'Date of Birth',
                    translatedName: 'Letsatsi la tsoalo ',
                    valueType: 'DATE',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                    minAgeInYear: 18,
                    hint: "Beneficiary's age should be 18 years and above",
                    translatedHint: "Lilemo tsa setho li be 18+",
                  ),
                  InputField(
                    id: 'ls9hlz2tyol',
                    name: 'Age',
                    translatedName: 'Lilemo',
                    isReadOnly: true,
                    valueType: 'NUMBER',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                      id: 'vIX4GTSCX4P',
                      name: 'Sex',
                      translatedName: 'Boleng',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      renderAsRadio: true,
                      options: [
                        InputFieldOption(
                            code: 'Male',
                            name: 'Male',
                            translatedName: 'Botona'),
                        InputFieldOption(
                            code: 'Female',
                            name: 'Female',
                            translatedName: 'Botsehali'),
                      ])
                ])
          ])
    ];
  }
}
