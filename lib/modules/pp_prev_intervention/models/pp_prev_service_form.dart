import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class PpPrevServiceForm {
  static List<String> getMandatoryField() {
    return [];
  }

  static List<FormSection> getFormSections({
    required String firstDate,
  }) {
    return [
      FormSection(
        name: "Service provision",
        color: const Color(0xFF9B2BAE),
        inputFields: [
          InputField(
            id: 'vHAWEdM8mfw',
            name: 'HIV Prevention Messaging',
            valueType: 'TRUE_ONLY',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'XBekI82ixNm',
            name: 'Condom Promotion and Provision',
            valueType: 'TRUE_ONLY',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'Eg2WRoWLNA3',
            name: 'GBV Messaging',
            valueType: 'TRUE_ONLY',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
        ],
      ),
      FormSection(
          name: "Condom Distribution",
          color: const Color(0xFF9B2BAE),
          inputFields: [
            InputField(
              id: 'JjX25d72ume',
              name: 'Number of Male condoms distributed',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: const Color(0xFF9B2BAE),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'FoLeDcnocv4',
              name: 'Number of Female condoms distributed',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: const Color(0xFF9B2BAE),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'qxO13pu8vAk',
              name: 'Number of lubricants distributed',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: const Color(0xFF9B2BAE),
              labelColor: const Color(0xFF737373),
            ),
          ]),
      FormSection(
        name: "Post GBV Screening",
        color: const Color(0xFF9B2BAE),
        inputFields: [
          InputField(
            id: 'Nr7UJVA1CZE',
            name: 'Have you ever experienced any form of violence or abuse?',
            valueType: 'BOOLEAN',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'mFxyT39XSE4',
            name: 'When did the violence or abuse happen?',
            valueType: 'TEXT',
            options: [
              InputFieldOption(
                code: '0-3 months ago',
                name: '0-3 months ago',
              ),
              InputFieldOption(
                code: '4-6 months ago',
                name: '4-6 months ago',
              ),
              InputFieldOption(
                code: '7-12 months ago',
                name: '7-12 months ago',
              ),
              InputFieldOption(
                code: 'Above 12 months ago',
                name: 'Above 12 months ago',
              ),
            ],
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'type_of_violence',
            name: 'What type of violence/abuse did you experience?',
            valueType: 'CHECK_BOX',
            options: [
              InputFieldOption(
                code: 'mTejEL5fS6X',
                name: 'Sexual',
              ),
              InputFieldOption(
                code: 'Ib0BqMrYPkV',
                name: 'Economic/Neglect',
              ),
              InputFieldOption(
                code: 'xuoKLKbNVj9',
                name: 'Physical',
              ),
              InputFieldOption(
                code: 'bYGq2fsmsao',
                name: 'Emotional',
              ),
            ],
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'pY4J9Z90qhb',
            name: 'Action taken',
            valueType: 'BOOLEAN',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'action_taken',
            name: 'What types of action was taken?',
            valueType: 'CHECK_BOX',
            options: [
              InputFieldOption(
                code: 'VHQc0WdwTSY',
                name: 'Health Facility',
              ),
              InputFieldOption(
                code: 'PfT6tJ25Po2',
                name: 'Police-CGPU',
              ),
              InputFieldOption(
                code: 'v7PSGUHZoVT',
                name: 'Chief',
              ),
              InputFieldOption(
                code: 'SioekRoBWYR',
                name: 'Councilor',
              ),
              InputFieldOption(
                code: 'jGMTVVtFgTW',
                name: 'Social Worker',
              ),
              InputFieldOption(
                code: 'Ma0avVN9N2C',
                name: 'Other',
              ),
            ],
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'HwGBP9iNl1g',
            name: 'Specify other type of action taken',
            valueType: 'TEXT',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
        ],
      )
    ];
  }
}
