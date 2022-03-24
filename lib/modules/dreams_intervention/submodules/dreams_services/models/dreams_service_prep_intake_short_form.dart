import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class DreamsPrepIntakeShortForm {
  static List<String> getMandatoryField() {
    const excludedFields = ['XhMaVycZx8l', 'lvT9gfpHIlT'];
    List<String> inputFields = FormUtil.getFormFieldIds(getFormSections());
    inputFields =
        inputFields.where((field) => !excludedFields.contains(field)).toList();
    return inputFields;
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'PrEP Intake',
          color: const Color(0xFF737373),
          inputFields: [
            InputField(
              id: 'VtmkYCQkBQw',
              inputColor: const Color(0xFF1F8ECE),
              labelColor: const Color(0xFF737373),
              name: 'PrEP Provided',
              valueType: 'TRUE_ONLY',
            ),
            InputField(
              id: 'lvT9gfpHIlT',
              inputColor: const Color(0xFF1F8ECE),
              labelColor: const Color(0xFF737373),
              allowFuturePeriod: false,
              name: 'Date PrEP was Provided',
              valueType: 'DATE',
            ),
            InputField(
              id: 'XhMaVycZx8l',
              inputColor: const Color(0xFF1F8ECE),
              labelColor: const Color(0xFF737373),
              disablePastPeriod: true,
              allowFuturePeriod: true,
              name: 'Date for the next appointment',
              valueType: 'DATE',
            ),
          ])
    ];
  }
}
