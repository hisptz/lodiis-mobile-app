import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class AgywEnrollmentFormSection {
  static List<String> getMandatoryField() {
    return [
      'location',
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'House Hold information',
          color: Color(0xFF1A3518),
          subSections: [
            FormSection(
                name: 'Caregiver',
                color: Color(0xFFB9B9B9),
                inputFields: [
                  InputField(
                      id: '',
                      name: 'Record why the child is not enrolled in school',
                      valueType: 'CHECK_BOX',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(
                            code: 'fcWZ0cctQlO', name: 'Sick/Fever'),
                        InputFieldOption(
                            code: 'nbLQCi1YrvU', name: 'Exhaustion'),
                        InputFieldOption(
                            code: 'JMGxn39tjoh', name: 'Housework'),
                        InputFieldOption(
                            code: 'qPt9jvB5ACh',
                            name:'Fear of the school or other children at school'),
                        InputFieldOption(
                            code: 'giEyqjovyAp',
                            name: 'Fear of the walk to school'),
                        InputFieldOption(
                            code: 'Q5MH7cmdlhT',
                            name: 'Inability to pay school fees'),
                        InputFieldOption(
                            code: 'WIrF2dIAkqD',
                            name: 'Inability to pay for school materials'),
                        InputFieldOption(
                            code: 'kamr81y5WJs', name: 'Other reason'),
                      ])
                ])
          ]),
    ];
  }
}
