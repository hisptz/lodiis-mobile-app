import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_intervention_constant.dart';

class EducationBursaryEnrollmentForm {
  static List<String> getMandatoryField() {
    return [
      "location",
      'WTZ7GLTrE8Q',
      'rSP9c21JsfC',
      'qZP982qpSPS',
      'vIX4GTSCX4P',
      'EwZil0AnlYo'
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: "Student Information",
        color: Color(0xFF009688),
        inputFields: [
          InputField(
            id: 'location',
            name: 'Location',
            translatedName: 'Sebaka',
            valueType: 'ORGANISATION_UNIT',
            allowedSelectedLevels: [3],
            // filteredPrograms: [BursaryInterventionConstant.program],
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'WTZ7GLTrE8Q',
            name: 'First Name',
            translatedName: 'Lebitso la pele',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 's1HaiT6OllL',
            name: 'Middle Name',
            translatedName: 'Lebitso le mahareng',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'rSP9c21JsfC',
            name: 'Surname',
            translatedName: 'Le Fane',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'qZP982qpSPS',
            name: 'Date of Birth',
            translatedName: 'Letsatsi la tsoalo',
            valueType: 'DATE',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'ls9hlz2tyol',
            name: 'Age',
            translatedName: 'Lilemo',
            isReadOnly: true,
            valueType: 'NUMBER',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'vIX4GTSCX4P',
            name: 'Sex',
            translatedName: 'Boleng',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
            renderAsRadio: true,
            options: [
              InputFieldOption(
                code: "Male",
                name: "Male",
                translatedName: 'Botona',
              ),
              InputFieldOption(
                code: "Female",
                name: "Female",
                translatedName: 'Botsehali',
              ),
            ],
          ),
          InputField(
            id: 'RB8Wx75hGa4',
            name: 'Village',
            isReadOnly: true,
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          // Nearby School
          InputField(
            id: 'EwZil0AnlYo',
            name: 'School',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          // TODO Follow up on this field
          InputField(
            id: 'tbzi0t27D8l',
            name: 'Grade to be attended',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                code: "Grade 8",
                name: "Grade 8",
              ),
              InputFieldOption(
                code: "Grade 9",
                name: "Grade 9",
              ),
              InputFieldOption(
                code: "Grade 10",
                name: "Grade 10",
              ),
              InputFieldOption(
                code: "Grade 11",
                name: "Grade 11",
              ),
            ],
          ),
        ],
      )
    ];
  }
}
