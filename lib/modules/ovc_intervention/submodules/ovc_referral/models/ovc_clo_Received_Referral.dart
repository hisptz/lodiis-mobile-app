import 'dart:ui';

import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcCLOReceivedReferral {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'CLO Outgoing Referrals',
          color: Color(0xFF1B3519),
          inputFields: [
            InputField(
              id: 'OIUDljKyNgy',
              name: 'Date of referral',
              valueType: 'DATE',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'BelCZxo1ge9',
              name: 'Date of Service',
              valueType: 'DATE',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373)),
            InputField(
                id: 'NbQGlx6QZpK',
                name: 'Referred by',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'CMW', name: 'CMW'),
                  InputFieldOption(code: 'YM', name: 'YM'),
                  InputFieldOption(code: 'PE', name: 'PE'),
                  InputFieldOption(code: 'SCMW', name: 'SCMW'),
                  InputFieldOption(code: 'Paralegals', name: 'Paralegals'),
                  InputFieldOption(code: 'CLO', name: 'CLO'),
                ]),
            InputField(
                id: 'RiNop7mvTRW',
                name: 'Community Partner',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'LENEPHWA', name: 'LENEPHWA'),
                  InputFieldOption(code: 'WLSA', name: 'WLSA'),
                  InputFieldOption(code: 'CBA', name: 'CBA'),
                  InputFieldOption(code: 'CIL', name: 'CIL'),
                  InputFieldOption(code: 'LIRAC', name: 'LIRAC'),
                  InputFieldOption(code: 'SENTEBALE', name: 'SENTEBALE'),
                  InputFieldOption(code: 'SWAALES', name: 'SWAALES'),
                ]),
            InputField(
                id: 'rWIw1JHPiTo',
                name: 'Referred for',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'HTS', name: 'HTS'),
                  InputFieldOption(code: 'ART', name: 'ART'),
                  InputFieldOption(code: 'SAB', name: 'SAB'),
                  InputFieldOption(code: 'Parenting', name: 'Parenting'),
                  InputFieldOption(code: 'Stepping Stone', name: 'Stepping Stone'),
                  InputFieldOption(code: 'VAC', name: 'VAC'),
                  InputFieldOption(code: 'Singing to the Lion', name: 'Singing to the Lion'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ]),
            InputField(
              id: 'pdUklLmaauR',
              name: 'Outcome Status',
              valueType: 'TEXT',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373))
          ])
    ];
  }
}
