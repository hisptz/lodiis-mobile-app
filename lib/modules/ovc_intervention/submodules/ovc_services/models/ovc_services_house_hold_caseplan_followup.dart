import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcServicesHouseHoldCasePlanFollowup {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          id: 'Health',
          name: 'DOMAIN HEALTH',
          color: Color(0xFF4D9E49),
          borderColor: Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'qoT16RqF0AW',
                name: 'HTS Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'jBlJhUFzHDN',
                name: 'Reasons HTS not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AxGWsUhzPdO',
                name: 'HIVTREAT Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'whIcXFKztLy',
                name: 'Reasons HIVTREAT not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ZrX6iFwSFdI',
                name: 'HIVS&D Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'mNKqSsW5FyE',
                name: 'Reasons HIVS&D not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'FLxulMZBB8P',
                name: 'HEALTH Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'gEiKTWFdTDR',
                name: 'Reasons HEALTH not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GXiyFeuJAEO',
                name: 'PRG&L Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'QSGJF5uy3s1',
                name: 'Reasons PRG&L not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'i37SPKK7tv2',
                name: 'SAIDS Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'IZyIR4gdGHH',
                name: 'Reasons SAIDS  not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AHpXZXFUeVp',
                name: 'WASHMES Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'OTQ2AmiJTsd',
                name: 'Reasons WASHMES not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HhlAKX5erk4',
                name: 'SOACKAGE Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'NaQd6h96kQu',
                name: 'Reasons SOACKAGE not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'As5nDUZA4bB',
                name: 'TIPPY Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'R1CLwUrULl4',
                name: 'Reasons TIPPY not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          id: 'Stable',
          name: 'DOMAIN STABLE',
          color: Color(0xFF0000FF),
          borderColor: Color(0xFF0000FF),
          inputFields: [
            InputField(
                id: 'XAdRNtFaJrW',
                name: 'SILC Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'uUVW07YYELA',
                name: 'Reasons SILC not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'dYXGYJAkMjm',
                name: 'FE  Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'BsYbWvITaTO',
                name: 'Reasons FE not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ofKPDgInoED',
                name: 'EST COOPRTVS Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'rqoRLKfOz1X',
                name: 'Reasons EST COOPRTVS not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rCoESQBRoWQ',
                name: 'FUNCT COOPRTVS Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'U3OirYxhmZ3',
                name: 'Reasons FUNCT COOPRTVS not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Jyr5fwQFmin',
                name: 'MARKT COOPRTVS Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'RCG0ohFiNym',
                name: 'Reasons MARKT COOPRTVS  not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kg8HJ6qihcV',
                name: 'K/TPLOTS Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'N6cgKEcBkT4',
                name: 'Reasons K/TPLOTS not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          id: 'Safe',
          name: 'DOMAIN SAFE',
          color: Color(0xFF0F9587),
          borderColor: Color(0xFF0F9587),
          inputFields: [
            InputField(
                id: 'bmFT0AV8ZXv',
                name: 'P&FC Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'NkQ3F4cqYMQ',
                name: 'Reasons P&FC not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'i4bl7zHws9D',
                name: 'VAC Results ',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'ST3KYyn9AUb',
                name: 'Reasons for VAC not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ssHdcYq1IMO',
                name: 'SURVIVORS Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'lEr87UA4ecO',
                name: 'Reasons for SURVIVORS not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GUtvvHnjdxo',
                name: 'COUNSEL Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'sSFwyRvfzCN',
                name: 'Reasons COUNSEL not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'glwwR6j93BC',
                name: 'ABUSE Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'x4V6Yh6LvJs',
                name: 'Reasons ABUSE not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ujRjcCXrDIQ',
                name: 'LEGALPROT Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'DTHXODoARku',
                name: 'Reasons LEGALPROT not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'N3EJnMcHYhd',
                name: 'BIRTHCERT Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'uhwmhQuRbUy',
                name: 'Reasons BIRTHCERT not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(
          id: 'Schooled',
          name: 'DOMAIN SCHOOLED',
          color: Color(0xFF9B2BAE),
          borderColor: Color(0xFF9B2BAE),
          inputFields: [
            InputField(
                id: 'VhxUu6aLkMA',
                name: 'PTS4G  Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'vV9iBTXHtCv',
                name: 'Reasons PTS4G  not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fEmt4VhSOvd',
                name: 'PTS4NG Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'FfhMRIKszu3',
                name: 'Reasons PTS4NG not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LW6zZlSlP9P',
                name: 'HWCLUB  Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'pKgBXzMDJgd',
                name: 'Reasons HWCLUB not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          name: 'DOMAIN HEALTH',
          color: Color(0xFF4D9E49),
          borderColor: Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'rGtX9VyOOAb',
                name: 'OTHER ACTIVITIES Results',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Achieved', name: 'Achieved'),
                  InputFieldOption(code: 'In progress', name: 'In progress'),
                  InputFieldOption(code: 'Not achieved', name: 'Not achieved')
                ]),
            InputField(
                id: 'kKR2XpajAzo',
                name: 'Reasons OTHER ACTIVITIES not completed',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
          ])
    ];
  }
}
