import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamsServiceForm {
  static List<String> getMandatoryField() {
    return ['Eug4BXDFLym', 'vL6NpUA0rIU'];
  }

  static List<FormSection> getFormSections({
    required String firstDate,
  }) {
    return [
      FormSection(
          name: 'Service Form',
          color: const Color(0xFF737373),
          inputFields: [
            InputField(
              id: 'W79837fEI3C',
              isReadOnly: true,
              name: 'Name of Youth Mentor/Paralegal',
              translatedName: 'Lebitso la Youth Mentor/ Paralegal',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
                id: 'Eug4BXDFLym',
                name: 'Type of Intervention',
                translatedName: 'Mofuta oa Tsebeletso',
                valueType: 'TEXT',
                inputColor: const Color(0xFF258DCC),
                labelColor: const Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'AFLATEEN/TOUN', name: 'AFLATEEN/TOUN'),
                  InputFieldOption(
                      code: 'PTS 4 NON-GRADS', name: 'PTS 4 NON-GRADS'),
                  InputFieldOption(code: 'PTS 4-GRADS', name: 'PTS 4-GRADS'),
                  InputFieldOption(code: 'Go Girls', name: 'Go Girls'),
                  InputFieldOption(code: 'PARENTING', name: 'PARENTING'),
                  InputFieldOption(code: 'SILC', name: 'SILC'),
                  InputFieldOption(code: 'SAVING GROUP', name: 'SAVING GROUP'),
                  InputFieldOption(
                      code: 'FinancialLiteracyEducation',
                      name: 'Financial Literacy (Education)'),
                  InputFieldOption(
                      code: 'ViolencePreventionEducation',
                      name: 'Violence Prevention Education'),
                  InputFieldOption(
                      code: 'STEPPING STONES', name: 'STEPPING STONES'),
                  InputFieldOption(
                      code: 'CondomEducationProvision',
                      name: 'Condom Education/Provision'),
                  InputFieldOption(code: 'LBSE', name: 'LBSE'),
                  InputFieldOption(
                      code: 'GBV Messaging', name: 'GBV Messaging'),
                  InputFieldOption(
                      code: 'VAC Messaging', name: 'VAC Messaging'),
                  InputFieldOption(
                      code: 'VAC Legal Messaging', name: 'VAC Legal Messaging'),
                  InputFieldOption(
                      code: 'GBV Legal Messaging', name: 'GBV Legal Messaging')
                ]),
            InputField(
              id: 'O7sjTjxUmEa',
              name: 'Session date',
              translatedName: 'Letsatsi la Thupelo',
              valueType: 'DATE',
              firstDate: firstDate,
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'vL6NpUA0rIU',
              name: 'Number of session',
              translatedName: 'Palo ea Lithupelo',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'JT7pbPBJkoF',
              name: 'Caregiver first name',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'QATqUC6i5x2',
              name: 'Caregiver surname',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'FoLeDcnocv4',
              name: 'Number of Female condoms distributed',
              translatedName: 'Palo ea  likhohlopo tsa basali tse fanoeng',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'JjX25d72ume',
              name: 'Number of Male condoms distributed',
              translatedName: 'Palo ea likhohlopo tsa banna tse fanoeng',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'qxO13pu8vAk',
              name: 'Number of lubricants distributed',
              translatedName: 'Palo ea lingobetsi tse fanoeng',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'JGgGQZPZH4n',
              name: 'IEC Material Distributed',
              translatedName: 'Palo ea lithusa-thuto (pamphlets) tse fanoeng',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
          ])
    ];
  }
}
