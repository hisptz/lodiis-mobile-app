import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';

class EducationLbseEnrollmentForm {
  static List<String> getMandatoryField() {
    return [
      "location",
      "EwZil0AnlYo",
      "UhZhN6s0SNg",
      "BUPSEpJySPR",
      "WTZ7GLTrE8Q",
      "rSP9c21JsfC",
      "qZP982qpSPS",
      "vIX4GTSCX4P"
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: "Location",
        color: Color(0xFF009688),
        inputFields: [
          InputField(
            id: 'location',
            name: 'Location',
            translatedName: 'Sebaka',
            valueType: 'ORGANISATION_UNIT',
            allowedSelectedLevels: [3],
            filteredPrograms: [LbseInterventionConstant.program],
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'RB8Wx75hGa4',
            name: 'Village of Residence',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
        ],
      ),
      FormSection(
        name: "School information",
        color: Color(0xFF009688),
        inputFields: [
          InputField(
            id: 'EwZil0AnlYo',
            name: 'School Name',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'UhZhN6s0SNg',
            name: 'School Level',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                code: "Primary",
                name: "Primary",
              ),
              InputFieldOption(
                code: "Post primary",
                name: "Post primary",
              ),
            ],
          ),
          InputField(
            id: 'BUPSEpJySPR',
            name: 'Grade',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                code: "Grade 4",
                name: "Grade 4",
              ),
              InputFieldOption(
                code: "Grade 5",
                name: "Grade 5",
              ),
              InputFieldOption(
                code: "Grade 6",
                name: "Grade 6",
              ),
              InputFieldOption(
                code: "Grade 7",
                name: "Grade 7",
              ),
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
          InputField(
            id: 'ZyNCDMbB2Yx',
            name: 'Strean',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'mmY2WLON5MF',
            name: 'Centre Name',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
        ],
      ),
      FormSection(
        name: "Client Bio",
        color: Color(0xFF009688),
        inputFields: [
          InputField(
            id: 'WTZ7GLTrE8Q',
            name: 'First Name',
            translatedName: 'Lebitso la pele',
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
            id: 'jCtTXW1Ig6P',
            name: 'National ID/Passport number',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
        ],
      )
    ];
  }
}
