import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class EducationBursaryReferralOutcomeForm {
  static List<String> getMandatoryField() {
    return ['hXyqgOWZ17b'];
  }

  static List<FormSection> getFormSections({
    required String firstDate,
  }) {
    return [
      FormSection(
        name: 'Bursary Referral Outcome',
        color: const Color(0xFF009688),
        inputFields: [
          InputField(
            id: 'hXyqgOWZ17b',
            name: 'Referral service provided?',
            valueType: 'BOOLEAN',
            inputColor: const Color(0xFF009688),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'lvT9gfpHIlT',
            name: 'Date service was provided',
            valueType: 'DATE',
            firstDate: firstDate,
            inputColor: const Color(0xFF009688),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'Ep3atnNQGTY',
            name: 'Follow up required',
            valueType: 'BOOLEAN',
            inputColor: const Color(0xFF009688),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'DPf5mUDoZMy',
            name: 'Follow-up date',
            allowFuturePeriod: true,
            disablePastPeriod: true,
            valueType: 'DATE',
            inputColor: const Color(0xFF009688),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'LcG4J82PM4Z',
            name: 'Comments or next steps',
            valueType: 'LONG_TEXT',
            inputColor: const Color(0xFF009688),
            labelColor: const Color(0xFF737373),
          ),
        ],
      ),
    ];
  }
}
