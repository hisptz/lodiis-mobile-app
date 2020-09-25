import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcExitInformation {
  static List<String> getMandatoryField() {
    return [
      'iaVO2v6TsWa',
      'zUU33n41Soa',
      'vey0snuAsLj',
      'jOXN2iPhkxj',
      'RtAQJcTqUGF',
      'q3mJ2FfV3oR'
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Exit information',
          color: Color(0xFF0D3A16),
          inputFields: [
            InputField(
                id: 'iaVO2v6TsWa',
                name: 'What is a reason for exit?',
                valueType: 'TEXT',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40),
                options: [
                  InputFieldOption(code: 'Was Referred', name: 'Was Referred'),
                  InputFieldOption(code: 'Was Disengaged', name: 'Was Disengaged'),
                  InputFieldOption(code: 'Exit without graduation', name: 'Exit without graduation'),
                  InputFieldOption(code: 'Left at will', name: 'Left at will'),
                  InputFieldOption(code: 'Dropped Out', name: 'Dropped Out'),
                  InputFieldOption(code: 'Died', name: 'Died'),
                  InputFieldOption(code: 'Other reasons', name: 'Other reasons'),
                      ]
                ),
            InputField(
                id: 'zUU33n41Soa',
                name: 'Specify other reason for exit',
                valueType: 'TEXT',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40)),    
                
            InputField(
                id: 'vey0snuAsLj',
                name: 'Is referral required?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40),
                ),
                
            InputField(
                id: 'jOXN2iPhkxj',
                name: 'What is a service provider/referred organization at facility?',
                valueType: 'ORGANISATION_UNIT',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40)),
            InputField(
                id: 'RtAQJcTqUGF',
                name: 'What is a reason for disengaged?',
                valueType: 'TEXT',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40),
                options: [
                  InputFieldOption(code: 'Family Reintegration/Separation', name: 'Family Reintegration/Separation'),
                  InputFieldOption(code: 'Adoption', name: 'Adoption'),
                  InputFieldOption(code: 'Ineligible', name: 'Ineligible'),
                  InputFieldOption(code: 'Family Reconciliation', name: 'Family Reconciliation'),
                  InputFieldOption(code: 'Self Employed', name: 'Self Employed'),
                  InputFieldOption(code: 'Relocation', name: 'Relocation'),
                  InputFieldOption(code: 'Fostering', name: 'Fostering'),
                  InputFieldOption(code: 'Over 18-20 years and out of school', name: 'Over 18-20 years and out of school'),
                  InputFieldOption(code: 'Duplicated', name: 'Duplicated'),
                  InputFieldOption(code: 'Other', name: 'Other'),
                      ]
                ),
            InputField(
                id: 'q3mJ2FfV3oR',
                name: 'Specify other reason for disengaged',
                valueType: 'TEXT',
                inputColor: Color(0xFF07AD40),
                labelColor: Color(0xFF07AD40)),
          ])
    ];
  }
}
