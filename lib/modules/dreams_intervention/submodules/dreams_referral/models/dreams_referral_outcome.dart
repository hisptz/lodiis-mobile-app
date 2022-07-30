import 'dart:ui';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/agyw_dreams_common_constant.dart';

class DreamsReferralOutCome {
  static List<String> getMandatoryFields() {
    return ['p7saxV2libq'];
  }

  static List<FormSection> getFormSections({
    required String firstDate,
  }) {
    return [
      FormSection(
          name: 'Referral Outcome',
          color: const Color(0xFF737373),
          inputFields: [
            InputField(
              id: 'p7saxV2libq',
              name: 'Date client reached the referral station',
              valueType: 'DATE',
              firstDate: firstDate,
              inputColor: AgywDreamsCommonConstant.defaultColor,
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'lvT9gfpHIlT',
              name: 'Date service was provided',
              valueType: 'DATE',
              firstDate: firstDate,
              inputColor: AgywDreamsCommonConstant.defaultColor,
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'Ep3atnNQGTY',
              name: 'Follow up required',
              valueType: 'BOOLEAN',
              inputColor: AgywDreamsCommonConstant.defaultColor,
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'DPf5mUDoZMy',
              name: 'Follow-up date',
              allowFuturePeriod: true,
              disablePastPeriod: true,
              valueType: 'DATE',
              firstDate: firstDate,
              inputColor: AgywDreamsCommonConstant.defaultColor,
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'JyEhKJXJiTp',
              name: 'Referring Organisation/Officer contacted for Feedback',
              valueType: 'BOOLEAN',
              inputColor: AgywDreamsCommonConstant.defaultColor,
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'yGf4w48y1Jt',
              name: 'Date Contacted for Feedback',
              valueType: 'DATE',
              firstDate: firstDate,
              inputColor: AgywDreamsCommonConstant.defaultColor,
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'LcG4J82PM4Z',
              name: 'Comments or next steps',
              valueType: 'LONG_TEXT',
              inputColor: AgywDreamsCommonConstant.defaultColor,
              labelColor: const Color(0xFF737373),
            ),
          ])
    ];
  }
}
