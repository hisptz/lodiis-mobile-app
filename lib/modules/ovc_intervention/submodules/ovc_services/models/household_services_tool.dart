import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class HouseholdServicesTool {
  static List<FormSection> getFormSections() {
    return [
       FormSection(
                name: 'DOMAIN HEALTH',
                color: Color(0xFF4D9E49),
                borderColor: Color(0xFF4D9E49),
                inputFields: [
                  InputField(
                      id: 'uuGlvpzfXpo',
                      name: 'HTS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'YTNc2P4AA74',
                      name: 'HTS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'tyvSiTnLVdp',
                      name: 'HTS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'HxYKbRiVRwN',
                      name: 'HIVTREAT Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'JRlzvdw0Y0X',
                      name: 'HIVTREAT Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'eBFTHIIL9Aw',
                      name: 'HIVTREAT Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                   InputField(
                      id: 'u2RTURRHRMF',
                      name: 'HIVS&D Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'krbRH7bKxFx',
                      name: 'HIVS&D Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'y8vYCiBYZSW',
                      name: 'HIVS&D Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'A6dREpWUu9I',
                      name: 'HEALTH Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'NygevpOd6Py',
                      name: 'HEALTH Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'dzjYK7GmiUp',
                      name: 'HEALTH Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'WyrDJmWuXB8',
                      name: 'PRG&L Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'aIpulqsrDu0',
                      name: 'PRG&L Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'aKsQ9EqGrBm',
                      name: 'PRG&L Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'ynBMBAjvHBm',
                      name: 'SAIDS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'SmXzTMmDUEC',
                      name: 'SAIDS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'fgoWXl6DRhZ',
                      name: 'SAIDS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                 InputField(
                      id: 'rYME7Dkj8tn',
                      name: 'WASHMES Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'NhkvJ9eE41G',
                      name: 'WASHMES Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'WKWjOnnmvMm',
                      name: 'WASHMES Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),  
                 InputField(
                      id: 'WPHaO4qg1Ho',
                      name: 'SOACKAGE Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'gGu2jz2qK2U',
                      name: 'SOACKAGE Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'aa4d43DQBJs',
                      name: 'SOACKAGE Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)), 
                   InputField(
                      id: 'IiIVDSKX8yk',
                      name: 'TIPPY Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'eVCJCdoEIgj',
                      name: 'TIPPY Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'IkygrfOG0I3',
                      name: 'TIPPY Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),    
               
                ]),
             FormSection(
                name: 'DOMAIN STABLE',
                color: Color(0xFF0000FF),
                borderColor: Color(0xFF0000FF),
                inputFields: [
                 InputField(
                      id: 'fzmrHd1LvZz',
                      name: 'SILC Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'lRdUpIqLUym',
                      name: 'SILC Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'z28rqh7c0x8',
                      name: 'SILC Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'HGpA4kx5jLQ',
                      name: 'FE Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'Ss5xgyGosOT',
                      name: 'FE Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'CAtKjiGom8Z',
                      name: 'FE Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                InputField(
                      id: 'k0d7yAySRfV',
                      name: 'EST COOPRTVS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'qJDGs3Nz7jp',
                      name: 'EST COOPRTVS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'bBvDlCRZbCz',
                      name: 'EST COOPRTVS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'FVGvLBu62ZA',
                      name: 'FUNCT COOPRTVS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'LenilPuwXYm',
                      name: 'FUNCT COOPRTVS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'a056JmbckLk',
                      name: 'FUNCT COOPRTVS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'zGSfW5f1hbD',
                      name: 'MARKT COOPRTVS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'EzjuSbaZmsJ',
                      name: 'MARKT COOPRTVS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'Bd06XcvCmG9',
                      name: 'MARKT COOPRTVS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'CMyoClHySib',
                      name: 'K/TPLOTS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'e8Pouh9vbx3',
                      name: 'K/TPLOTS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'sOjATdWIqJW',
                      name: 'K/TPLOTS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                ]),
             FormSection(
                name: 'DOMAIN SAFE',
                color: Color(0xFF0F9587),
                borderColor: Color(0xFF0F9587),
                inputFields: [
                    InputField(
                      id: 'uzwR8yM0sMM',
                      name: 'P&FC Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'SKyxqNbulie',
                      name: 'P&FC Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'smubuLPxTgm',
                      name: 'P&FC Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'MqN9J5AFFqr',
                      name: 'VAC Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'cX8CCVSGYk6',
                      name: 'VAC Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'WvlTSmbWw4a',
                      name: 'VAC Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'BRT7TsR9o84',
                      name: 'SURVIVORS Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'NJimP9SRdeW',
                      name: 'SURVIVORS Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'AzPFnFU7Z2a',
                      name: 'SURVIVORS Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'EqfX6YKOIpd',
                      name: 'COUNSEL Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'htOshFwGfzL',
                      name: 'COUNSEL Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'LCx6It7vKzZ',
                      name: 'COUNSEL Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                   InputField(
                      id: 'KItM1GZlnH7',
                      name: 'ABUSE Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'LJtjUn0PTUa',
                      name: 'ABUSE Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'YrTI8znQe2B',
                      name: 'ABUSE Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                   InputField(
                      id: 'WHc2UUx17eC',
                      name: 'LEGALPROT Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'kxDFzZ3D6qR',
                      name: 'LEGALPROT Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'TOjZiXwiVd9',
                      name: 'LEGALPROT Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                   InputField(
                      id: 'Pi0lDTkLveS',
                      name: 'BIRTHCERT Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'VVJOZzWlsAx',
                      name: 'BIRTHCERT Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'p9LXpwDbVhl',
                      name: 'BIRTHCERT Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373)),
                ]),
              FormSection(
                name: 'DOMAIN SCHOOLED',
                color: Color(0xFF9B2BAE),
                borderColor: Color(0xFF9B2BAE),
                inputFields: [
                InputField(
                      id: 'SyA0WUw5YOM',
                      name: 'PTS4G Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'PJfYo1TasrO',
                      name: 'PTS4G Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'ixMEJ5ebqqR',
                      name: 'PTS4G Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                InputField(
                      id: 'kVovIYDJwrr',
                      name: 'PTS4NG Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'EVmHxwg2UVK',
                      name: 'PTS4NG Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'dTV4TFa5HQf',
                      name: 'PTS4NG Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'WzfG0CyHbFK',
                      name: 'HWCLUB Service description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'yFna6aEZooC',
                      name: 'HWCLUB Service type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'fv95bVM533k',
                      name: 'HWCLUB Service completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                ]),
            FormSection(
                name: 'Other activities',
                color: Color(0xFF4D9E49),
                borderColor: Color(0xFF4D9E49),
                inputFields: [
                  InputField(
                      id: 'Jus8IdpGuKE',
                      name: 'OTHER ACTIVITIES description',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'Nhea8TOrwpf',
                      name: 'OTHER ACTIVITIES type',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Referral', name: 'Referral'),
                        InputFieldOption(code: 'Direct service', name: 'Direct service')
                      ]),
                  InputField(
                      id: 'KFu68pPBBOy',
                      name: 'OTHER ACTIVITIES completed?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373))
                      ])
        ];
  }
}
