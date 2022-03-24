import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamsServiceHivPreventionInfo {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'HIV Prevention Services offered and Activities Completed',
          color: const Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'W79837fEI3C',
                inputColor: const Color(0xFF1F8ECE),
                labelColor: const Color(0xFF737373),
                name: 'Name of Youth Mentor/Paralegal',
                valueType: 'TEXT'),
            InputField(
                id: 'Eug4BXDFLym',
                name: 'Type of Intervention',
                inputColor: const Color(0xFF1F8ECE),
                labelColor: const Color(0xFF737373),
                valueType: 'TEXT',
                options: [
                  InputFieldOption(
                      code: 'oSOCIAL ASSETS', name: 'oSOCIAL ASSETS'),
                  InputFieldOption(code: 'oPARENTING', name: 'oPARENTING'),
                  InputFieldOption(code: 'oSILC', name: 'oSILC'),
                  InputFieldOption(
                      code: 'oSAVING GROUP', name: 'oSAVING GROUP'),
                  InputFieldOption(
                      code: 'oFINANCIAL EDUCATION',
                      name: 'oFINANCIAL EDUCATION'),
                  InputFieldOption(
                      code: 'oHIV MESSAGING', name: 'oHIV MESSAGING'),
                  InputFieldOption(
                      code: 'oSTEPPING STONES', name: 'oSTEPPING STONES'),
                  InputFieldOption(code: 'oVAC', name: 'oVAC'),
                  InputFieldOption(code: 'oIPC', name: 'oIPC')
                ]),
            InputField(
              id: 'InvIBsm9DiQ',
              name:
                  'District (where sessions/activities/meetings are completed)',
              valueType: 'ORGANISATION_UNIT',
              showCountryLevelTree: true,
              allowedSelectedLevels: [3, 4],
              inputColor: const Color(0xFF1F8ECE),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
                id: 'ZbIgQobmdDR',
                inputColor: const Color(0xFF1F8ECE),
                labelColor: const Color(0xFF737373),
                name:
                    'Council (where sessions/activities/meetings are completed)',
                showCountryLevelTree: true,
                allowedSelectedLevels: [3, 4],
                valueType: 'ORGANISATION_UNIT'),
            InputField(
                id: 'BJYUYd4JnuB',
                inputColor: const Color(0xFF1F8ECE),
                labelColor: const Color(0xFF737373),
                name:
                    'Village (where sessions/activities/meetings are completed)',
                valueType: 'TEXT'),
            InputField(
                id: 'O7sjTjxUmEa',
                inputColor: const Color(0xFF1F8ECE),
                labelColor: const Color(0xFF737373),
                name: 'Session date',
                valueType: 'DATE'),
            InputField(
                id: 'vL6NpUA0rIU',
                inputColor: const Color(0xFF1F8ECE),
                labelColor: const Color(0xFF737373),
                name: 'Number of hours spent in session',
                valueType: 'INTEGER_ZERO_OR_POSITIVE'),
            InputField(
                id: 'JEHbgzL2hFL',
                inputColor: const Color(0xFF1F8ECE),
                labelColor: const Color(0xFF737373),
                name: 'Meeting date',
                valueType: 'DATE'),
            InputField(
                id: 'IIRUvOXnWcN',
                inputColor: const Color(0xFF1F8ECE),
                labelColor: const Color(0xFF737373),
                name: 'Number of hours spent in meeting',
                valueType: 'INTEGER_ZERO_OR_POSITIVE'),
            InputField(
                id: 'FoLeDcnocv4',
                inputColor: const Color(0xFF1F8ECE),
                labelColor: const Color(0xFF737373),
                name: 'Number of Female condoms distributed',
                valueType: 'INTEGER_ZERO_OR_POSITIVE'),
            InputField(
                id: 'JjX25d72ume',
                inputColor: const Color(0xFF1F8ECE),
                labelColor: const Color(0xFF737373),
                name: 'Number of Male condoms distributed',
                valueType: 'INTEGER_ZERO_OR_POSITIVE'),
            InputField(
                id: 'qxO13pu8vAk',
                inputColor: const Color(0xFF1F8ECE),
                labelColor: const Color(0xFF737373),
                name: 'Number of lubricants distributed',
                valueType: 'INTEGER_ZERO_OR_POSITIVE'),
            InputField(
                id: 'JGgGQZPZH4n',
                inputColor: const Color(0xFF1F8ECE),
                labelColor: const Color(0xFF737373),
                name: 'IEC Material Distributed',
                valueType: 'INTEGER_ZERO_OR_POSITIVE'),
          ])
    ];
  }
}
