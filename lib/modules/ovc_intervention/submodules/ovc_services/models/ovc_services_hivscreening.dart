import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcServicesHivscreening {
  static List<FormSection> getFormSections() {
    return [
            FormSection(
                name: 'HIV Risk Assessment',
                color: Color(0xFF1B3519),
                inputFields: [
                    InputField(
                      id: 'kL4IhnhdKZv',
                      name: 'Assessment enrollment criteria',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Unknown status', name: 'Unknown status'),
                        InputFieldOption(code: 'Undisclosed', name: 'Undisclosed'),
                        InputFieldOption(code: 'Negative > 6mths', name: 'Negative > 6mths'),
                        InputFieldOption(code: 'At risk older OVC/adolescent', name: 'At risk older OVC/adolescent'),
                      ]),
                  InputField(
                      id: 'Fz89mIraWIl',
                      name: 'Is the biological father or mother of this child living or lived with HIV?',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Yes', name: 'Yes'),
                        InputFieldOption(code: 'No', name: 'No'),
                        InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
                      ]),
                  InputField(
                      id: 'mIcseDgrIlJ',
                      name: 'Is at least one sibling of the child living or has lived with HIV?',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Yes', name: 'Yes'),
                        InputFieldOption(code: 'No', name: 'No'),
                        InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
                      ]),
                  InputField(
                      id: 'Hi9fp222l2D',
                      name: 'Has this child lost one or both biological parents due to a chronic or undiagnosed illness?',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Yes', name: 'Yes'),
                        InputFieldOption(code: 'No', name: 'No'),
                        InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
                      ]),
                  InputField(
                      id: 'r13f1emAyvw',
                      name: 'Has this child lost a sibling due to a chronic or undiagnosed illness?',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Yes', name: 'Yes'),
                        InputFieldOption(code: 'No', name: 'No'),
                        InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
                      ]),
                  InputField(
                      id: 'YAugNMbMe2c',
                      name: 'Has the child ever been hospitalized or has been malnourished in the past 12 months?',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Yes', name: 'Yes'),
                        InputFieldOption(code: 'No', name: 'No'),
                        InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
                      ]),
                    InputField(
                      id: 'niqNMJrfFDs',
                      name: 'Does the child have recurring skin problems, and oral fungus or persistent cough and fever?',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Yes', name: 'Yes'),
                        InputFieldOption(code: 'No', name: 'No'),
                        InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
                      ]),
                  InputField(
                      id: 'NhjnHO0IyqY',
                      name: 'Has this child been frequently sick in the last three months?',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Yes', name: 'Yes'),
                        InputFieldOption(code: 'No', name: 'No'),
                        InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
                      ]),
                  InputField(
                      id: 'LA4G0A6fkNF',
                      name: 'Is there anyone in the family who had TB in last 6 months',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Yes', name: 'Yes'),
                        InputFieldOption(code: 'No', name: 'No'),
                        InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
                      ]),
                  InputField(
                      id: 'dL8ts5GQcMI',
                      name: 'Is the child/ adolescent exposed to sexual violence?',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Yes', name: 'Yes'),
                        InputFieldOption(code: 'No', name: 'No'),
                        InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
                      ]),
                  InputField(
                      id: 'W64q5maeL6o',
                      name: 'Is the adolescent sexually active?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373)),
                   InputField(
                      id: 'VJh6KDlBkfb',
                      name: 'Is this child/adolescent eligible for an HIV test?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'SDPCwdDB9yX',
                      name: 'Has the caregiver/OVC >12 years accepted to have the child tested?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'v0ArPi4Rk4o',
                      name: 'Refer to Social Worker?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373))
                ])
    ];
  }
}
