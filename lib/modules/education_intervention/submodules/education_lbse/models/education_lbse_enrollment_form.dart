import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';

class EducationLbseEnrollmentForm {
  static List<String> getMandatoryField() {
    return ["location"];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: "Enrollment Form",
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
        ],
      )
    ];
  }
}