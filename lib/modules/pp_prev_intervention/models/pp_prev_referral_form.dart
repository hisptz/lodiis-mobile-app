import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class PpPrevReferralForm {
  static List<String> getMandatoryField() {
    return [
      'k3nt1Qkxat0',
      'IEdBgx4vn1J',
      'h4PRnqfEOCL',
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: "Referral form",
        color: const Color(0xFF9B2BAE),
        inputFields: [
          InputField(
            id: 'IEdBgx4vn1J',
            name: 'Referral Services',
            valueType: 'TEXT',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
            options: [
              InputFieldOption(
                code: 'HTS',
                name: 'HTS',
              ),
              InputFieldOption(
                code: 'PrEP',
                name: 'PrEP',
              ),
              InputFieldOption(
                code: 'FP_SRH',
                name: 'FP/SRH',
              ),
              InputFieldOption(
                code: 'PostViolenceCare',
                name: 'Post Violence Care',
              ),
              InputFieldOption(
                code: 'STIScreening',
                name: 'STI Screening',
              ),
              InputFieldOption(
                code: 'VMMC',
                name: 'VMMC',
              ),
            ],
          ),
          InputField(
            id: 'OIUDljKyNgy',
            name: 'Date of referral',
            valueType: 'DATE',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'h4PRnqfEOCL',
            name: 'Referral Point',
            valueType: 'TEXT',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
            options: [
              InputFieldOption(
                code: 'EGPAF',
                name: 'EGPAF',
              ),
              InputFieldOption(
                code: 'JHPIEGO',
                name: 'JHPIEGO',
              ),
              InputFieldOption(
                code: 'KBPrEP',
                name: 'KBPrEP',
              ),
              InputFieldOption(
                code: 'CoHIPSEC',
                name: 'CoHIP SEC',
              ),
              InputFieldOption(
                code: 'Other',
                name: 'Other',
              ),
            ],
          ),
          InputField(
            id: 'k3nt1Qkxat0',
            name: 'Location',
            inputColor: const Color(0xFF9B2BAE),
            labelColor: const Color(0xFF737373),
            valueType: 'ORGANISATION_UNIT',
          ),
        ],
      ),
    ];
  }
}
