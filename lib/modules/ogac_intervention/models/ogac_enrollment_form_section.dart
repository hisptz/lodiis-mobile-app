import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/constants/ogac_intervention_constant.dart';

class OgacInterventionFormSection {
  static List<String> getMandatoryField() {
    return [
      'location',
      'WTZ7GLTrE8Q',
      'rSP9c21JsfC',
      'qZP982qpSPS',
      'vIX4GTSCX4P'
    ];
  }

  static List<FormSection> getStageFormSections() {
    return [
      FormSection(
        name: 'OGAC Module',
        color: Color(0xFFF05A2A),
        inputFields: [
          InputField(
            id: 'TtZ7lDtc40r',
            name: 'OGAC Module Provided?',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFFF05A2A),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'BelCZxo1ge9',
            name: 'Date of Service',
            valueType: 'DATE',
            inputColor: Color(0xFFF05A2A),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'E5SBpSCOV7p',
            name: 'Referral to Comprehensive Services',
            valueType: 'TEXT',
            inputColor: Color(0xFFF05A2A),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'OVC Comprehensive', name: 'OVC Comprehensive'),
              InputFieldOption(
                  code: 'DREAMS Comprehensive', name: 'DREAMS Comprehensive'),
            ],
          )
        ],
      )
    ];
  }

  static List<FormSection> getEnrollmentFormSections() {
    return [
      FormSection(
        name: 'Location details',
        color: Color(0xFFF05A2A),
        inputFields: [
          InputField(
            id: 'location',
            name: 'Location',
            translatedName: 'Sebaka',
            valueType: 'ORGANISATION_UNIT',
            allowedSelectedLevels: [3, 4],
            filteredPrograms: [OgacInterventionConstant.program],
            inputColor: Color(0xFFF05A2A),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'RB8Wx75hGa4',
            name: 'Village',
            valueType: 'TEXT',
            inputColor: Color(0xFFF05A2A),
            labelColor: Color(0xFF737373),
          ),
        ],
      ),
      FormSection(
        name: 'Profile Details',
        color: Color(0xFFF05A2A),
        inputFields: [
          InputField(
            id: 'WTZ7GLTrE8Q',
            name: 'First Name',
            valueType: 'TEXT',
            inputColor: Color(0xFFF05A2A),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 's1HaiT6OllL',
            name: 'Middle Name',
            valueType: 'TEXT',
            inputColor: Color(0xFFF05A2A),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'rSP9c21JsfC',
            name: 'Surname',
            valueType: 'TEXT',
            inputColor: Color(0xFFF05A2A),
            labelColor: Color(0xFF737373),
          ),
          InputField(
              id: 'qZP982qpSPS',
              name: 'Date of Birth',
              valueType: 'DATE',
              inputColor: Color(0xFFF05A2A),
              labelColor: Color(0xFF737373),
              maxAgeInYear: 14,
              numberOfMonth: 11,
              minAgeInYear: 9,
              hint: "Beneficiary's age should be from 9 - 14 years",
              translatedHint: "Lilemo tsa setho li be pakeng tsa 9 le 14"),
          InputField(
            id: 'ls9hlz2tyol',
            name: 'Age',
            translatedName: 'Lilemo',
            isReadOnly: true,
            valueType: 'NUMBER',
            inputColor: Color(0xFFF05A2A),
            labelColor: Color(0xFF737373),
          ),
          InputField(
              id: 'vIX4GTSCX4P',
              name: 'Sex',
              translatedName: 'Boleng',
              valueType: 'TEXT',
              renderAsRadio: true,
              inputColor: Color(0xFFF05A2A),
              labelColor: Color(0xFF737373),
              options: [
                InputFieldOption(code: 'Male', name: 'Male'),
                InputFieldOption(code: 'Female', name: 'Female'),
              ]),
          InputField(
            id: 'tNdoR0jYr7R',
            name: 'Phone number',
            valueType: 'PHONE_NUMBER',
            inputColor: Color(0xFFF05A2A),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'EwZil0AnlYo',
            name: 'School name',
            valueType: 'TEXT',
            inputColor: Color(0xFFF05A2A),
            labelColor: Color(0xFF737373),
          ),
        ],
      ),
    ];
  }
}
