import 'dart:ui';

import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcReferralFollowUp {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Referral Follow Up',
          color: Color(0xFF1B3519),
          inputFields: [
            InputField(
              id: 'DPf5mUDoZMy',
              name: 'Follow-up date',
              valueType: 'DATE',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF1A3518),
            ),
            InputField(
                id: 'VHe4ctA0bqU',
                name: 'Follow-up Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Complete', name: 'Complete'),
                  InputFieldOption(code: 'Not complete', name: 'Not complete'),
                ]),
            InputField(
              id: 'BzkeBAxdEVT',
              name: 'Additional follow up required',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF1A3518),
            ),
            InputField(
              id: 'LcG4J82PM4Z',
              name: 'Comments or next steps',
              valueType: 'LONG_TEXT',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF1A3518),
            ),
          ])
    ];
  }
}
