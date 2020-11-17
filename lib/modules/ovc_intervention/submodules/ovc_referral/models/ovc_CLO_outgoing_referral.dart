import 'dart:ui';

import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcCLOutgoingOReferral {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'CLO Outgoing Referrals',
          color: Color(0xFF1B3519),
          inputFields: [
            InputField(
              id: 'g6J1vZ2kDXB',
              name: 'Viral Load Results (for CLHIV)',
              valueType: 'TEXT',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'Cwg16RorxzK',
              name: 'Multi-Month Despensing (MMD)',
              valueType: 'TEXT',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373)),
            InputField(
              id: 'vEeBBzeQrQU',
              name: 'Referred to (Name and Surname of Community Cadre)',
              valueType: 'TEXT',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373)),
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
              id: 'OIUDljKyNgy',
              name: 'Date of referral',
              valueType: 'DATE',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373)),
           InputField(
                id: 'VHe4ctA0bqU',
                name: 'Follow-up Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Complete', name: 'Complete'),
                  InputFieldOption(code: 'Not complete', name: 'Not complete')
                ]),
          ])
    ];
  }
}
