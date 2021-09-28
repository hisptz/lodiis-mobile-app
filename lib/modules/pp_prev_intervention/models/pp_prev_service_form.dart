import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class PpPrevServiceForm {
  static List<String> getMandatoryField() {
    return [];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: "Service provision",
        color: Color(0xFF9B2BAE),
        inputFields: [
          InputField(
            id: 'vHAWEdM8mfw',
            name: 'HIV Prevention Messaging',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF9B2BAE),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'Eg2WRoWLNA3',
            name: 'Condom Promotion and Provision',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF9B2BAE),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'iHExrhttHRG',
            name: 'HTS Referral',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF9B2BAE),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'FrrHVBvLfq5',
            name: 'PrEP Referral',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF9B2BAE),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'mXUZFx1p6VG',
            name: 'FP Referral',
            valueType: 'TRUE_ONLY',
            inputColor: Color(0xFF9B2BAE),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'OIUDljKyNgy',
            name: 'Date of referral',
            valueType: 'DATE',
            inputColor: Color(0xFF9B2BAE),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'h4PRnqfEOCL',
            name: 'Referral Point',
            valueType: 'TEXT',
            inputColor: Color(0xFF9B2BAE),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: "EGPAF", name: "EGPAF"),
              InputFieldOption(code: "JHPIEGO", name: "JHPIEGO"),
              InputFieldOption(code: "PSI", name: "PSI"),
              InputFieldOption(code: "KBPrEP", name: "KBPrEP"),
            ],
          ),
          InputField(
            id: 'LIDzWRHXgIt',
            name: 'Referral Completed',
            valueType: 'TEXT',
            inputColor: Color(0xFF9B2BAE),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: "EGPAF", name: "EGPAF"),
              InputFieldOption(code: "JHPIEGO", name: "JHPIEGO"),
              InputFieldOption(code: "PSI", name: "PSI"),
              InputFieldOption(code: "KBPrEP", name: "KBPrEP"),
            ],
          ),
          InputField(
            id: 'Z4D3jEwXO1I',
            name: 'Referral Completion Date',
            valueType: 'DATE',
            inputColor: Color(0xFF9B2BAE),
            labelColor: Color(0xFF737373),
          ),
        ],
      ),
      FormSection(
        name: "Condom Distribution",
        color: Color(0xFF9B2BAE),
        inputFields: [
          InputField(
            id: 'JjX25d72ume',
            name: 'Number of Male condoms distributed',
            valueType: 'INTEGER_ZERO_OR_POSITIVE',
            inputColor: Color(0xFF9B2BAE),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'FoLeDcnocv4',
            name: 'Number of Female condoms distributed',
            valueType: 'INTEGER_ZERO_OR_POSITIVE',
            inputColor: Color(0xFF9B2BAE),
            labelColor: Color(0xFF737373),
          ),
          InputField(
            id: 'qxO13pu8vAk',
            name: 'Number of lubricants distributed',
            valueType: 'INTEGER_ZERO_OR_POSITIVE',
            inputColor: Color(0xFF9B2BAE),
            labelColor: Color(0xFF737373),
          ),
        ],
      )
    ];
  }
}
