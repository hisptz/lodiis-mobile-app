import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';

class EducationLbseEnrollmentForm {
  static List<String> getMandatoryField() {
    return ["location"];
  }

//@TODO complete assiggment on empty ids
  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: "Location",
        color: Color(0xFF2D9688),
        inputFields: [
          InputField(
            id: 'location',
            name: 'Location',
            translatedName: 'Sebaka',
            valueType: 'ORGANISATION_UNIT',
            allowedSelectedLevels: [3],
            filteredPrograms: [LbseInterventionConstant.program],
            inputColor: Color(0xFF2D9688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'RB8Wx75hGa4',
            name: 'Village of Residence',
            valueType: 'TEXT',
            inputColor: Color(0xFF2D9688),
            labelColor: Color(0xFF737373),
          ),
        ],
      ),
      FormSection(
        name: "School information",
        color: Color(0xFF2D9688),
        inputFields: [
          InputField(
            id: 'EwZil0AnlYo',
            name: 'School Name',
            valueType: 'TEXT',
            inputColor: Color(0xFF2D9688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: '',
            name: 'School Level',
            valueType: 'TEXT',
            inputColor: Color(0xFF2D9688),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                code: "PRIMARY",
                name: "PRIMARY",
              ),
              InputFieldOption(
                code: "POST PRIMARY",
                name: "POST PRIMARY",
              ),
            ],
          ),
          InputField(
            id: 'BUPSEpJySPR',
            name: 'Grade',
            valueType: 'TEXT',
            inputColor: Color(0xFF2D9688),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                code: "4",
                name: "4",
              ),
              InputFieldOption(
                code: "5",
                name: "5",
              ),
              InputFieldOption(
                code: "6",
                name: "6",
              ),
              InputFieldOption(
                code: "7",
                name: "7",
              ),
              InputFieldOption(
                code: "8",
                name: "8",
              ),
              InputFieldOption(
                code: "9",
                name: "9",
              ),
              InputFieldOption(
                code: "10",
                name: "10",
              ),
              InputFieldOption(
                code: "11",
                name: "11",
              ),
            ],
          ),
          InputField(
            id: '',
            name: 'Strean',
            valueType: 'TEXT',
            inputColor: Color(0xFF2D9688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'WTZ7GLTrE8Q',
            name: 'Centre Name',
            valueType: 'TEXT',
            inputColor: Color(0xFF2D9688),
            labelColor: Color(0xFF737373),
          ),
        ],
      ),
      FormSection(
        name: "Client Bio",
        color: Color(0xFF2D9688),
        inputFields: [
          InputField(
            id: 'WTZ7GLTrE8Q',
            name: 'First Name',
            translatedName: 'Lebitso la pele',
            valueType: 'TEXT',
            inputColor: Color(0xFF2D9688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'rSP9c21JsfC',
            name: 'Surname',
            translatedName: 'Le Fane',
            valueType: 'TEXT',
            inputColor: Color(0xFF2D9688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'qZP982qpSPS',
            name: 'Date of Birth',
            translatedName: 'Letsatsi la tsoalo',
            valueType: 'DATE',
            inputColor: Color(0xFF2D9688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'ls9hlz2tyol',
            name: 'Age',
            translatedName: 'Lilemo',
            isReadOnly: true,
            valueType: 'NUMBER',
            inputColor: Color(0xFF2D9688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'vIX4GTSCX4P',
            name: 'Sex',
            translatedName: 'Boleng',
            valueType: 'TEXT',
            inputColor: Color(0xFF2D9688),
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
            id: '',
            name: 'National ID/Passport number',
            valueType: 'TEXT',
            inputColor: Color(0xFF2D9688),
            labelColor: Color(0xFF737373),
          ),
        ],
      )
    ];
  }
}
