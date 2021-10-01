import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_intervention_constant.dart';

class EducationBursaryEnrollmentForm {
  static List<String> getMandatoryField() {
    return ["location"];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: "Enrollment Form",
        color: Color(0xFF009688),
        inputFields: [
          InputField(
            id: 'location',
            name: 'Location',
            translatedName: 'Sebaka',
            valueType: 'ORGANISATION_UNIT',
            allowedSelectedLevels: [3],
            filteredPrograms: [BursaryInterventionConstant.program],
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
        ],
      )
    ];
  }
}
