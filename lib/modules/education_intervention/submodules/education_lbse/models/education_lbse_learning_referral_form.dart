import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class EducationLbseReferralForm {
  static List<String> getMandatoryField() {
    return ['CoUEvTpNjvO'];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        id: 'lbse_referral',
        name: 'LBSE Referral',
        color: Color(0xFF009688),
        inputFields: [
          InputField(
            id: 'CoUEvTpNjvO',
            name: 'Case type',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                code: 'Economic',
                name: 'Economic',
              ),
              InputFieldOption(
                code: 'Sexual',
                name: 'Sexual',
              ),
              InputFieldOption(
                code: 'Physical',
                name: 'Physical',
              ),
              InputFieldOption(
                code: 'Emotional',
                name: 'Emotional',
              ),
            ],
          ),
          InputField(
            id: 'hpuu3TCZkKx',
            name: 'Referred to',
            valueType: 'TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                code: 'Health faccility',
                name: 'Health faccility',
              ),
              InputFieldOption(
                code: 'WLSA',
                name: 'WLSA',
              ),
              InputFieldOption(
                code: 'Police',
                name: 'Police',
              ),
              InputFieldOption(
                code: 'MGYSR',
                name: 'MGYSR',
              ),
              InputFieldOption(
                code: 'MOSD',
                name: 'MOSD',
              ),
              InputFieldOption(
                code: 'KB',
                name: 'KB',
              ),
              InputFieldOption(
                code: 'EGPAF',
                name: 'EGPAF',
              ),
            ],
          ),
          InputField(
            id: 'OT97N8oZhpF',
            name: 'Description',
            valueType: 'LONG_TEXT',
            inputColor: Color(0xFF009688),
            labelColor: Color(0xFF737373),
          ),
        ],
      ),
    ];
  }
}
