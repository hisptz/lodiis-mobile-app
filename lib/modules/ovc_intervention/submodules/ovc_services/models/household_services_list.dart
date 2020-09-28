import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import '../../../../../models/input_field_option.dart';

class HouseholdServicesList {
  static List<FormSection> getFormSections() {
    return [
            FormSection(
                name: 'DOMAIN HEALTH',
                color: Color(0xFF4D9E49),
                borderColor: Color(0xFF4D9E49),
                inputFields: [
                InputField(
                      id: '',
                      name: 'Select Services to be given',
                      valueType: 'CHECK_BOX',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'XoSPWmpWXCy', name: 'HTS'),
                        InputFieldOption(code: 'ylSjcj6cv42', name: 'HIVTREAT'),
                        InputFieldOption(code: 'cx4xBY4jZXM', name: 'HIVS&D'),
                        InputFieldOption(code: 'AxtahhoHcXV', name: 'HEALTH'),
                        InputFieldOption(code: 'd2vXxEPeCq7', name: 'PRG&L'),
                        InputFieldOption(code: 'dTFLFtUUeEK', name: 'SAIDS'),
                        InputFieldOption(code: 'Hvq9oisH7Gt', name: 'WASHMES'),
                        InputFieldOption(code: 'qTf8VSoojJ2', name: 'SOACKAGE'),
                        InputFieldOption(code: 'DQxqyncQtwm', name: 'TIPPY')
                      ]),
                ]),
             FormSection(
                name: 'STABLE Services',
                color: Color(0xFF0000FF),
                borderColor: Color(0xFF0000FF),
                inputFields: [
                InputField(
                      id: '',
                      name: 'Select Services to be given',
                      valueType: 'CHECK_BOX',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'e6NV2ZAzFEh', name: 'SILC'),
                        InputFieldOption(code: 'kvF996ugmMl', name: 'FE'),
                        InputFieldOption(code: 'iiJpQsEE4qx', name: 'EST COOPRTVS'),
                        InputFieldOption(code: 'ithLHgsAoxs', name: 'FUNCT COOPRTVS'),
                        InputFieldOption(code: 'JqGGsDlZh8T', name: 'MARKT COOPRTVS'),
                        InputFieldOption(code: 'WrjNxZBVHCL', name: 'K/TPLOTS')
                      ]),
                ]),
             FormSection(
                name: 'SAFE Services',
                color: Color(0xFF0F9587),
                borderColor: Color(0xFF0F9587),
                inputFields: [
                  InputField(
                      id: '',
                      name: 'Select Services to be given',
                      valueType: 'CHECK_BOX',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'PoxYSqq8Hgz', name: 'P&FC'),
                        InputFieldOption(code: 'aPmPhwm8Zln', name: 'VAC'),
                        InputFieldOption(code: 'Vd8dV7OweWB', name: 'SURVIVORS'),
                        InputFieldOption(code: 'Ccp4Odlh3BE', name: 'COUNSEL'),
                        InputFieldOption(code: 'yf6KmY3Rm5I', name: 'ABUSE'),
                        InputFieldOption(code: 'WdZ3PnW5yV6', name: 'LEGALPROT'),
                        InputFieldOption(code: 'hS7aONLz2cq', name: 'BIRTHCERT')
                      ])
                ]),
              FormSection(
                name: 'SCHOOLED Services',
                color: Color(0xFF9B2BAE),
                borderColor: Color(0xFF9B2BAE),
                inputFields: [
                InputField(
                      id: '',
                      name: 'Select Services to be given',
                      valueType: 'CHECK_BOX',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'TQSMaZgfZPO', name: 'PTS4G'),
                        InputFieldOption(code: 'SN2kJN3jAG9', name: 'PTS4NG'),
                        InputFieldOption(code: 'X47zxNAqMv0', name: 'HWCLUB')
                      ])
                ]),
             FormSection(
                name: '',
                color: Color(0xFF4D9E49),
                borderColor: Color(0xFF4D9E49),
                inputFields: [
                InputField(
                      id: '',
                      name: 'Other Activities',
                      valueType: 'CHECK_BOX',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'ksc7ov3MihX', name: 'OTHER ACTIVITIES')
                      ])
                ]),
    ];
  }
}
