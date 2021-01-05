import 'dart:ui';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class OvcReferralOutCome {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Referral Outcome',
          color: Color(0xFF1B3519),
          inputFields: [
            InputField(
              id: 'p7saxV2libq',
              name: 'Date client reached the referral station',
              translatedName:
                  'Letsatsi, khoeli le selemo se mosebeletsuoa a fumanang ts’ebeletso',
              valueType: 'DATE',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'lvT9gfpHIlT',
              name: 'Date service was provided',
              valueType: 'DATE',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'Ep3atnNQGTY',
              name: 'Follow up required',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'DPf5mUDoZMy',
              allowFuturePeriod: true,
              disablePastPeriod: true,
              name: 'Follow-up date',
              valueType: 'DATE',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'JyEhKJXJiTp',
              name: 'Referring Organisation/Officer contacted for Feedback',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'yGf4w48y1Jt',
              name: 'Date Contacted for Feedback',
              valueType: 'DATE',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'LcG4J82PM4Z',
              name: 'Comments or next steps',
              valueType: 'LONG_TEXT',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
          ])
    ];
  }
}
