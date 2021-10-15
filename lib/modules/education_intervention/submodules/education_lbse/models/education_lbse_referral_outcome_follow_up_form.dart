import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class EducationLbseReferralOutcomeFollowUpForm {
  static List<String> getMandatoryField() {
    return ['DPf5mUDoZMy'];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: 'LBSE Referral Follow-up',
        color: Color(0xFF009688),
        inputFields: [
          InputField(
            id: 'DPf5mUDoZMy',
            name: 'Follow-up date',
            valueType: 'DATE',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'VHe4ctA0bqU',
            name: 'Follow-up Status',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                code: 'Complete',
                name: 'Complete',
              ),
              InputFieldOption(
                code: 'Not complete',
                name: 'Not complete',
              ),
            ],
          ),
          InputField(
            id: 'BzkeBAxdEVT',
            name: 'Additional follow up required',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'Yp3zlQ779fk',
            name: 'Additional Follow-up date',
            allowFuturePeriod: true,
            disablePastPeriod: true,
            valueType: 'DATE',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'LcG4J82PM4Z',
            name: 'Comments or next steps',
            valueType: 'LONG_TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
        ],
      ),
    ];
  }
}
