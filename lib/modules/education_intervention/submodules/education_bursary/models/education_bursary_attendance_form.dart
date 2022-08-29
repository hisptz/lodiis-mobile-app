import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class EducationBursaryAttendanceForm {
  static List<String> getMandatoryField() {
    return ['eventDate', 'WvYI4dliZyk'];
  }

  static List<FormSection> getFormSections({
    required String firstDate,
  }) {
    return [
      FormSection(
          name: 'Attendance',
          color: const Color(0xFF009688),
          inputFields: [
            InputField(
              id: 'eventDate',
              name: 'Date',
              valueType: 'DATE',
              inputColor: const Color(0xFF009688),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'WvYI4dliZyk',
              name: 'Attended',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF009688),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
                id: 'GKBZYfIj2s1',
                name: 'Mode of monitoring',
                valueType: 'TEXT',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Face to face', name: 'Face to face'),
                  InputFieldOption(code: 'Virtual', name: 'Virtual'),
                ]),
            InputField(
                id: 'EokvDGvXkOk',
                name: 'Reasons for non attendance',
                valueType: 'TEXT',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'self health ', name: 'self health '),
                  InputFieldOption(
                      code: 'Caregiver health', name: 'Caregiver health'),
                  InputFieldOption(
                      code: 'sibling health', name: 'sibling health'),
                  InputFieldOption(code: 'cultural', name: 'cultural'),
                  InputFieldOption(
                      code: 'sexual violence', name: 'Sexual violence'),
                  InputFieldOption(
                      code: 'Physical violence', name: 'Physical violence'),
                  InputFieldOption(
                      code: 'emotional violence', name: 'Emotional violence'),
                  InputFieldOption(
                      code: 'economic vilence', name: 'Economic violence'),
                  InputFieldOption(code: 'neglect', name: 'Neglect'),
                  InputFieldOption(
                      code: 'school sexual harrassment',
                      name: 'School sexual harassment'),
                  InputFieldOption(
                      code: 'lost interest', name: 'Lost interest'),
                  InputFieldOption(
                      code: 'weather conditions', name: 'Weather conditions'),
                  InputFieldOption(code: 'CB', name: 'Cyber bullying'),
                  InputFieldOption(code: 'PB', name: 'Physical bullying'),
                  InputFieldOption(code: 'VB', name: 'Verbal bullying'),
                  InputFieldOption(code: 'SC', name: 'School clothing'),
                  InputFieldOption(code: 'Stationary', name: 'Stationary'),
                  InputFieldOption(code: 'Levy', name: 'Levy'),
                ]),
            InputField(
                id: 'KzIw7RMGZ9c',
                name: 'Referral',
                valueType: 'TEXT',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'health services', name: 'Health services'),
                  InputFieldOption(
                      code: 'Legal service', name: 'Legal services'),
                  InputFieldOption(
                      code: 'Safety and sercurity (police)',
                      name: 'Safety and sercurity (police)'),
                  InputFieldOption(
                      code: 'Psycho social', name: 'Psycho social'),
                  InputFieldOption(
                      code: 'Social Assistance services',
                      name: 'Social Assistance services'),
                  InputFieldOption(
                      code: 'LICPEH',
                      name:
                          'Legal if the cultural practice is exploitative or harmful'),
                  InputFieldOption(
                      code: 'Social clubs in the community',
                      name: 'Social clubs in the community'),
                  InputFieldOption(
                      code: 'MGYSR Youth centres', name: 'MGYSR Youth centres'),
                ]),
            InputField(
                id: 'hpuu3TCZkKx',
                name: 'Referred to',
                valueType: 'TEXT',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Health faccility', name: 'Health facility'),
                  InputFieldOption(code: 'WLSA', name: 'WLSA'),
                  InputFieldOption(code: 'Police', name: 'Police'),
                  InputFieldOption(code: 'MGYSR', name: 'MGYSR'),
                  InputFieldOption(code: 'MOSD', name: 'MOSD'),
                  InputFieldOption(code: 'KB', name: 'KB'),
                  InputFieldOption(code: 'EGPAF', name: 'EGPAF'),
                ]),
            InputField(
              id: 'OIUDljKyNgy',
              name: 'Date of referral',
              valueType: 'DATE',
              inputColor: const Color(0xFF009688),
              labelColor: const Color(0xFF737373),
            ),
          ])
    ];
  }
}
