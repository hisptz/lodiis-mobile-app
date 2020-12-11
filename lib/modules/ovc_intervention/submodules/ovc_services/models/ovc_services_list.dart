import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import '../../../../../models/input_field_option.dart';

class OvcServicesList {
  static List<FormSection> getFormSections() {
    return [
            FormSection(
                name: 'DOMAIN HEALTH',
                translatedName: 'BOPHELO BO BOTLE',
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
                        InputFieldOption(code: 'yJQi4cbzeBF', name: 'HIVSCREEN'),
                        InputFieldOption(code: 'XoSPWmpWXCy', name: 'HTS'),
                        InputFieldOption(code: 'ylSjcj6cv42', name: 'HIVTREAT'),
                        InputFieldOption(code: 'cx4xBY4jZXM', name: 'HIVS&D'),
                        InputFieldOption(code: 'AxtahhoHcXV', name: 'HEALTH'),
                        InputFieldOption(code: 'd2vXxEPeCq7', name: 'PRG&L'),
                        InputFieldOption(code: 'dTFLFtUUeEK', name: 'SAIDS'),
                        InputFieldOption(code: 'x4yAqv4z2Xv', name: 'IMMUNIZE'),
                        InputFieldOption(code: 'AM9oJCOHM7f', name: 'MALNU'),
                        InputFieldOption(code: 'hJUuQ648wVF', name: 'CCFLS'),
                        InputFieldOption(code: 'BJrrrqQqwQO', name: 'STIMULATE'),
                        InputFieldOption(code: 'LswSBpMoG5C', name: 'TBSCREEN'),
                        InputFieldOption(code: 'gCKoJgBFdob', name: 'TBREFER'),
                        InputFieldOption(code: 'JSQ3xP1NhuN', name: 'FOODPREP'),
                        InputFieldOption(code: 'AwWKp6KmqgY', name: 'FOODPREV'),
                        InputFieldOption(code: 'EaJTFrklMo5', name: 'FOODSUPP'),
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
                        InputFieldOption(code: 'HsxFZOuV4oZ', name: 'OVCFUND'),
                        InputFieldOption(code: 'yPP7lkomNfK', name: 'SGROUP'),
                        InputFieldOption(code: 'iiJpQsEE4qx', name: 'EST COOPRTVS'),
                        InputFieldOption(code: 'ithLHgsAoxs', name: 'FUNCT COOPRTVS'),
                        InputFieldOption(code: 'JqGGsDlZh8T', name: 'MARKT COOPRTVS')
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
                        InputFieldOption(code: 'uQiyym8SEvd', name: 'SLION'),
                        InputFieldOption(code: 'WiPTQhWLVU1', name: 'RTEEN'),
                        InputFieldOption(code: 'neF08iYV9Os', name: 'RKIDS'),
                        InputFieldOption(code: 'aPmPhwm8Zln', name: 'VAC'),
                        InputFieldOption(code: 'Vd8dV7OweWB', name: 'SURVIVORS'),
                        InputFieldOption(code: 'Ccp4Odlh3BE', name: 'COUNSEL'),
                        InputFieldOption(code: 'GO3Ojp1UEX7', name: 'FCARE'),
                        InputFieldOption(code: 'exHDkX1gPiC', name: 'SHELTER'),
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
                        InputFieldOption(code: 'Cb8qzfdrg7d', name: 'AFLAS'),
                        InputFieldOption(code: 'TQSMaZgfZPO', name: 'PTS4G'),
                        InputFieldOption(code: 'SN2kJN3jAG9', name: 'PTS4NG'),
                        InputFieldOption(code: 'X47zxNAqMv0', name: 'HWCLUB'),
                        InputFieldOption(code: 'qraZh4n14S4', name: 'BURSARY'),
                        InputFieldOption(code: 'TdReJf2LTXA', name: 'SFEES'),
                        InputFieldOption(code: 'q2N7p3UbvSF', name: 'SMATERIAL'),
                        InputFieldOption(code: 'NcMANzhhphO', name: 'REENROL')
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
