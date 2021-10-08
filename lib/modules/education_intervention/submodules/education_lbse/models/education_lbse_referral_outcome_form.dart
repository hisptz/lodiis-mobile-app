import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class EducationLbseReferralOutcomeForm {
  static List<String> getMandatoryField() {
    return ['hXyqgOWZ17b'];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: 'LBSE Referral Outcome',
        color: Color(0xFF009688),
        inputFields: [
          InputField(
            id: 'hXyqgOWZ17b',
            name: 'Referral service provided?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'lvT9gfpHIlT',
            name: 'Date service was provided',
            valueType: 'DATE',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'Ep3atnNQGTY',
            name: 'Follow up required',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'DPf5mUDoZMy',
            name: 'Follow-up date',
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
