import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class PpPrevGenderNormsForm {
  static List<String> getMandatoryField() {
    return [
      "W79837fEI3C",
      "fkYHRd1KrWO",
      "O7sjTjxUmEa",
      "vL6NpUA0rIU",
      "FoLeDcnocv4",
      "JjX25d72ume",
      "qxO13pu8vAk",
      "JGgGQZPZH4n"
    ];
  }

  static List<FormSection> getFormSections({
    required String firstDate,
  }) {
    return [
      FormSection(
        name: 'Gender Norms',
        color: const Color(0xFF9B2BAE),
        inputFields: [
          InputField(
            id: 'W79837fEI3C',
            name: 'Name of Youth Mentor/Paralegal',
            valueType: 'TEXT',
            isReadOnly: true,
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'fkYHRd1KrWO',
            name: 'Stepping Stones',
            valueType: 'TRUE_ONLY',
            isReadOnly: true,
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'O7sjTjxUmEa',
            name: 'Session Date',
            valueType: 'DATE',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'vL6NpUA0rIU',
            name: 'Number of session',
            valueType: 'TEXT',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'FoLeDcnocv4',
            name: 'Number of Female condoms distributed',
            valueType: 'INTEGER_ZERO_OR_POSITIVE',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'JjX25d72ume',
            name: 'Number of Male condoms distributed',
            valueType: 'INTEGER_ZERO_OR_POSITIVE',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'qxO13pu8vAk',
            name: 'Number of lubricants distributed"',
            valueType: 'INTEGER_ZERO_OR_POSITIVE',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'JGgGQZPZH4n',
            name: 'IEC Material Distributed',
            valueType: 'INTEGER_ZERO_OR_POSITIVE',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
        ],
      )
    ];
  }
}
