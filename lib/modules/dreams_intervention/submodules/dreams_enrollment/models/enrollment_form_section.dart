import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class EnrollmentFormSection {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'House Hold information',
          color: Color(0xFF1A3518),
          subSections: [
            FormSection(
                name: 'Caregiver',
                color: Color(0xFFB9B9B9),
                inputFields: [
                  InputField(
                      id: 's1eRvsL2Ly4', name: 'First Name', valueType: 'TEXT'),
                  InputField(
                      id: 's1HaiT6OllL',
                      name: 'Middle Name',
                      valueType: 'TEXT'),
                  InputField(
                      id: 'rSP9c21JsfC', name: 'Surname', valueType: 'TEXT'),
                  InputField(
                      id: 'qZP982qpSPS',
                      name: 'Date of Birth',
                      valueType: 'DATE'),
                  InputField(
                      id: 'vIX4GTSCX4P',
                      name: 'Sex',
                      valueType: 'TEXT',
                      renderAsRadio: true,
                      options: [
                        InputFieldOption(code: 'Male', name: 'Male'),
                        InputFieldOption(code: 'Female', name: 'Female')
                      ]),
                ])
          ]),
      FormSection(
          name: 'THEMATIC AREA',
          color: Color(0xFF1A3518),
          subSections: [
            FormSection(
                name: 'ECONOMIC STRENGTHENING',
                color: Color(0xFF4B9F46),
                borderColor: Color(0xFF4B9F46),
                inputFields: [
                  InputField(
                      id: 'tIl7nKaeO0K',
                      name:
                          'Has the household eaten at least 2 healthy (balanced) meals a day, every day, for the last month',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4B9F46),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                  InputField(
                      id: 'rGHJIwsGFhM',
                      name:
                          'In the last month, did any child in the household go a whole day without eating anything because there wasn’t enough to eat? [In case of visibly malnourished child, Circle yes and refer]',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4B9F46),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                  InputField(
                      id: 'TpjxuuSY2Do',
                      name:
                          'Did the household produce any crops and vegetables in the last 6 months',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4B9F46),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                  InputField(
                      id: 'Txd5uH337SN',
                      name:
                          'Did the household preserve any food in the last 6 months',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4B9F46),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                ]),
            FormSection(
                name: 'SURVIVAL AND HEALTH',
                color: Color(0xFF9C27B0),
                borderColor: Color(0xFF9C27B0),
                inputFields: [
                  InputField(
                      id: 'ZPlqhoOZ8YD',
                      name:
                          'Does the household have a source of safe water (from taps, protected wells) for domestic use where they can fetch it to/from within half an hour',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9C27B0),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                  InputField(
                      id: 'UDbgJl7AEse',
                      name:
                          'Does the household have a stable shelter that is adequate, safe, and dry',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9C27B0),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                  InputField(
                      id: 'R0U52RV4Cxe',
                      name:
                          'Does the caregiver know the HIV status of ALL children in the household',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9C27B0),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                ]),
            FormSection(
                name: 'HEALTH, WATER, SANITATION & SHELTER',
                color: Color(0xFF2196F3),
                borderColor: Color(0xFF2196F3),
                inputFields: [
                  InputField(
                      id: 'UCMMhdQ3OrB',
                      name:
                          'Are there any children aged 6 to 21 years in this household who are not enrolled in school',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2196F3),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                  InputField(
                      id: 'NAMKqy2KVKk',
                      name:
                          'Are there any children aged < 5 years in this household who are not enrolled in ECCD',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2196F3),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                  InputField(
                      id: 'zpnWLMc2oYc',
                      name:
                          'Are there any children aged 6 to 21 years in this household who are enrolled in school and have missed school for more than 15 days in the last school term',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2196F3),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                  InputField(
                      id: 'NqoQ5BNNoob',
                      name:
                          'Are there any children in this household who are not growing appropriately compared to their age',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2196F3),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                ]),
            FormSection(
                name: 'EDUCATION AND DEVELOPMENT',
                color: Color(0xFF009688),
                borderColor: Color(0xFF009688),
                inputFields: [
                  InputField(
                      id: 'ae9oO3q6zJx',
                      name:
                          'Are there any children in this household who are withdrawn or consistently sad, unhappy or depressed, not able to participate in daily activities including playing with friends and family',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF009688),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                ]),
            FormSection(
                name: 'PSYCHOSOCIAL SUPPORT AND BASIC CARE',
                color: Color(0xFF9E9D24),
                borderColor: Color(0xFF9E9D24),
                inputFields: [
                  InputField(
                      id: 'SAlR1x703Ly',
                      name:
                          'Has any child in the household experienced repeated physical/emotional abuse',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9E9D24),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                ]),
            FormSection(
                name: 'CHILD CARE & PROTECTION',
                color: Color(0xFFEF6C00),
                borderColor: Color(0xFFEF6C00),
                inputFields: [
                  InputField(
                      id: 'rbplnN6qdKz',
                      name:
                          'Has any child in the household experienced child marriage',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFFEF6C00),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                  InputField(
                      id: 'zFpq6eXlVFX',
                      name:
                          'Has any child in the household experienced teenage pregnancy or teenage mother/ father',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFFEF6C00),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY')),
                  InputField(
                      id: 'WpzsqW5qNs4',
                      name:
                          'Has any child in the household experienced neglect',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFFEF6C00),
                      hasSubInputField: true,
                      subInputField: InputField(
                          id: null, name: 'Referral', valueType: 'TRUE_ONLY'))
                ]),
          ])
    ];
  }
}
