import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcEnrollmentHouseHold {
  static List<String> getMandatoryField() {
    return [];
  }

  static List<String> getHiddenField() {
    return ['yk0OH9p09C1', 'PN92g65TkVI'];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Household Information',
          color: Color(0xFF1A3518),
          subSections: [
            FormSection(name: '', color: Color(0xFF737373), inputFields: [
              InputField(
                id: 'location',
                name: 'Location',
                translatedName: 'Sebaka',
                isReadOnly: true,
                allowedSelectedLevels: [3, 4],
                valueType: 'ORGANISATION_UNIT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
              ),
              InputField(
                id: 'RB8Wx75hGa4',
                name: 'Village',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
              ),
              InputField(
                  id: 'xiI8aC8RwjC',
                  name: 'Sub-village',
                  valueType: 'TEXT',
                  inputColor: Color(0xFF4B9F46),
                  labelColor: Color(0xFF737373))
            ]),
            FormSection(
                name: 'Caregiver',
                translatedName: "Mohlokomeli",
                color: Color(0xFF737373),
                inputFields: [
                  InputField(
                    id: 'WTZ7GLTrE8Q',
                    name: 'First Name',
                    valueType: 'TEXT',
                    isReadOnly: true,
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 's1HaiT6OllL',
                    name: 'Middle Name',
                    valueType: 'TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'rSP9c21JsfC',
                    name: 'Surname',
                    valueType: 'TEXT',
                    isReadOnly: true,
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'tNdoR0jYr7R',
                    name: 'Phone Number',
                    valueType: 'PHONE_NUMBER',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'qZP982qpSPS',
                    name: 'Date of Birth',
                    valueType: 'DATE',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                    minAgeInYear: 18,
                    hint: "Beneficiary's age should be 18 years and above",
                    translatedHint: "Lilemo tsa setho li be 18+",
                  ),
                  InputField(
                    id: 'ls9hlz2tyol',
                    name: 'Age',
                    translatedName: 'Lilemo',
                    isReadOnly: true,
                    valueType: 'NUMBER',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                      id: 'vIX4GTSCX4P',
                      name: 'Sex',
                      isReadOnly: true,
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      renderAsRadio: true,
                      options: [
                        InputFieldOption(code: 'Male', name: 'Male'),
                        InputFieldOption(code: 'Female', name: 'Female'),
                      ]),
                  InputField(
                      id: 's1eRvsL2Ly4',
                      name: 'Marital Status',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Married', name: 'Married'),
                        InputFieldOption(code: 'Single', name: 'Single'),
                        InputFieldOption(code: 'Widowed', name: 'Widowed'),
                        InputFieldOption(
                            code: 'Divorced/separated',
                            name: 'Divorced/separated'),
                      ]),
                  InputField(
                    id: 'l9tcZ2TNgx6',
                    name:
                        'Male aged above 18 years and above currently living in household',
                    valueType: 'INTEGER_ZERO_OR_POSITIVE',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'rGAQnszNGVN',
                    name:
                        'Female aged 18 years and above currently living in household',
                    valueType: 'INTEGER_ZERO_OR_POSITIVE',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'kQehaqmaygZ',
                    isReadOnly: true,
                    name: 'Male aged below 18 years living in household',
                    valueType: 'INTEGER_ZERO_OR_POSITIVE',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'BXUNH6LXeGA',
                    isReadOnly: true,
                    name:
                        'Female aged below 18 years currently living in household',
                    valueType: 'INTEGER_ZERO_OR_POSITIVE',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                ]),
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
                    id: 'oF2lwagPkQA',
                    name: 'Is this a child-headed household',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF4B9F46),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'a0XHRG2DuNs',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF4B9F46)),
                  ),
                  InputField(
                    id: 'j0S43gUicDQ',
                    name:
                        'In the last 6 months, has there been at least one member of the household who has consistently had formal or informal employment or is self-employed or has a business or is engaged in an economically productive activity',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF4B9F46),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'a1GCj5jDaQo',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF4B9F46)),
                  ),
                  InputField(
                    id: 'E35x1FwfeW7',
                    name:
                        'The last time there was an unexpected urgent household expense (e.g. emergency medical expense, natural disaster – flooding, hail, drought, fire, funeral or house repair), someone in the household was able to pay for that expense',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF4B9F46),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'DoiVyCUvNwh',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF4B9F46)),
                  ),
                  InputField(
                    id: 'DDpCbfzDCIn',
                    name:
                        'Does the primary caregiver have any form of severe disability that prevents him/her from engaging in economically productive activities? (e.g., physical, speech, visual, hearing, or intellectual disability)',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF4B9F46),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'p1FAnyICtQ7',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF4B9F46)),
                  ),
                  InputField(
                    id: 'ItSpu4jJ4IM',
                    name: 'ECONOMIC STRENGTHENING - Vulnerability',
                    valueType: 'BOOLEAN',
                    isReadOnly: true,
                    background: Color(0xFFECF5EC),
                    inputColor: Color(0xFF4B9F46),
                  )
                ]),
            FormSection(
                name: 'SURVIVAL AND HEALTH',
                color: Color(0xFF9C27B0),
                borderColor: Color(0xFF9C27B0),
                inputFields: [
                  InputField(
                    id: 'tIl7nKaeO0K',
                    name:
                        'Has the household eaten at least 2 healthy (balanced) meals a day, every day, for the last month',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF9C27B0),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'NYhFMrN0Fl2',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF9C27B0)),
                  ),
                  InputField(
                    id: 'rGHJIwsGFhM',
                    name:
                        'In the last month, did any child in the household go a whole day without eating anything because there wasn’t enough to eat? [In case of visibly malnourished child, Circle yes and refer]',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF9C27B0),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'q8qSTyjhTmz',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF9C27B0)),
                  ),
                  InputField(
                    id: 'TpjxuuSY2Do',
                    name:
                        'Did the household produce any crops and vegetables in the last 6 months',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF9C27B0),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'SI5Rgq5PBNy',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF9C27B0)),
                  ),
                  InputField(
                    id: 'Txd5uH337SN',
                    name:
                        'Did the household preserve any food in the last 6 months',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF9C27B0),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'XPgmF5o8PrH',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF9C27B0)),
                  ),
                  InputField(
                    id: 'jCbVjOXRozX',
                    name: 'Food Security - Vulnerability',
                    valueType: 'BOOLEAN',
                    isReadOnly: true,
                    background: Color(0xFFF5E9F7),
                    inputColor: Color(0xFF9C27B0),
                  )
                ]),
            FormSection(
                name: 'HEALTH, WATER, SANITATION & SHELTER',
                color: Color(0xFF2196F3),
                borderColor: Color(0xFF2196F3),
                inputFields: [
                  InputField(
                    id: 'ZPlqhoOZ8YD',
                    name:
                        'Does the household have a source of safe water (from taps, protected wells) for domestic use where they can fetch it to/from within half an hour',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF2196F3),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'WoqSoxZu02l',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF2196F3)),
                  ),
                  InputField(
                    id: 'UDbgJl7AEse',
                    name:
                        'Does the household have a stable shelter that is adequate, safe, and dry',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF2196F3),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'KAUFdysMR57',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF2196F3)),
                  ),
                  InputField(
                    id: 'M9uM11xcHG3',
                    name:
                        'Is there anyone in this household who is HIV positive',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF2196F3),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'FPgGtzXg9DA',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF2196F3)),
                  ),
                  InputField(
                    id: 'gybZY8lq4Ky',
                    name: 'Number of members who are HIV positive',
                    valueType: 'NUMBER',
                    inputColor: Color(0xFF2196F3),
                  ),
                  InputField(
                    id: 'R0U52RV4Cxe',
                    name:
                        'Does the caregiver know the HIV status of ALL children in the household',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF2196F3),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'FGKsQQsRxoY',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF2196F3)),
                  ),
                  InputField(
                    id: 'aRRUFQvF8Xs',
                    name: 'Health, Water, Sanitation & Shelter - Vulnerability',
                    valueType: 'BOOLEAN',
                    isReadOnly: true,
                    background: Color(0xFFE9F4FE),
                    inputColor: Color(0xFF2196F3),
                  )
                ]),
            FormSection(
                name: 'EDUCATION AND DEVELOPMENT',
                color: Color(0xFF009688),
                borderColor: Color(0xFF009688),
                inputFields: [
                  InputField(
                    id: 'UCMMhdQ3OrB',
                    name:
                        'Are there any children aged 6 to 21 years in this household who are not enrolled in school',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF009688),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'KP1jF4igaNo',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF009688)),
                  ),
                  InputField(
                    id: 'NAMKqy2KVKk',
                    name:
                        'Are there any children aged < 5 years in this household who are not enrolled in ECCD',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF009688),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'Vqf14OQmR6o',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF009688)),
                  ),
                  InputField(
                    id: 'zpnWLMc2oYc',
                    name:
                        'Are there any children aged 6 to 21 years in this household who are enrolled in school and have missed school for more than 15 days in the last school term',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF009688),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'wzpYuu4WPkE',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF009688)),
                  ),
                  InputField(
                    id: 'NqoQ5BNNoob',
                    name:
                        'Are there any children in this household who are not growing appropriately compared to their age',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF009688),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'j254uH8eLrj',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF009688)),
                  ),
                  InputField(
                    id: 'fX6Amzn0Bpo',
                    name: 'EDUCATION AND DEVELOPMENT - Vulnerability',
                    valueType: 'BOOLEAN',
                    isReadOnly: true,
                    inputColor: Color(0xFF009688),
                    background: Color(0xFFE6F3F3),
                  ),
                ]),
            FormSection(
                name: 'PSYCHOSOCIAL SUPPORT AND BASIC CARE',
                color: Color(0xFF9E9D24),
                borderColor: Color(0xFF9E9D24),
                inputFields: [
                  InputField(
                    id: 'ae9oO3q6zJx',
                    name:
                        'Are there any children in this household who are withdrawn or consistently sad, unhappy or depressed, not able to participate in daily activities including playing with friends and family',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF9E9D24),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'MVjb8ODAmtV',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFF9E9D24)),
                  ),
                  InputField(
                      id: 'qGcHUqHsIL3',
                      name:
                          'Psychosocial support and basic care - Vulnerability',
                      valueType: 'BOOLEAN',
                      isReadOnly: true,
                      background: Color(0xFFF5F5E9),
                      inputColor: Color(0xFF9E9D24))
                ]),
            FormSection(
                name: 'CHILD CARE & PROTECTION',
                color: Color(0xFFEF6C00),
                borderColor: Color(0xFFEF6C00),
                inputFields: [
                  InputField(
                    id: 'SAlR1x703Ly',
                    name:
                        'Has any child in the household experienced repeated physical/emotional abuse',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFFEF6C00),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'doZOa8hYrly',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFFEF6C00)),
                  ),
                  InputField(
                    id: 'rbplnN6qdKz',
                    name:
                        'Has any child in the household experienced child marriage',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFFEF6C00),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'doZOa8hYrly',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFFEF6C00)),
                  ),
                  InputField(
                    id: 'zFpq6eXlVFX',
                    name:
                        'Has any child in the household experienced teenage pregnancy or teenage mother/ father',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFFEF6C00),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'doZOa8hYrly',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFFEF6C00)),
                  ),
                  InputField(
                    id: 'WpzsqW5qNs4',
                    name: 'Has any child in the household experienced neglect',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFFEF6C00),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'doZOa8hYrly',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFFEF6C00)),
                  ),
                  InputField(
                    id: 'nKzcIaTPLbi',
                    name:
                        'Has any child in the household experienced child Labor',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFFEF6C00),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'doZOa8hYrly',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFFEF6C00)),
                  ),
                  InputField(
                    id: 'thdtCERG6s5',
                    name:
                        'Has any child in the household experienced sexually abuse',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFFEF6C00),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'doZOa8hYrly',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFFEF6C00)),
                  ),
                  InputField(
                    id: 'xNIIkXQdxcO',
                    name: 'Has any child in the household experienced bullying',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFFEF6C00),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'doZOa8hYrly',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFFEF6C00)),
                  ),
                  InputField(
                    id: 'mZsmHPVyXV1',
                    name: 'Is there any child with a disability this household',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFFEF6C00),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'HntYAvr9rHc',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFFEF6C00)),
                  ),
                  InputField(
                    id: 'GjAeG3Mj2da',
                    name:
                        'Is there any child in this household who does not have a birth certificate',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFFEF6C00),
                    hasSubInputField: true,
                    subInputField: InputField(
                        id: 'aKEuLJsRTCp',
                        name: 'Referral',
                        valueType: 'TRUE_ONLY',
                        inputColor: Color(0xFFEF6C00)),
                  ),
                  InputField(
                    id: 'Caul8vihx2O',
                    name: 'CHILD CARE & PROTECTION - Vulnerability',
                    valueType: 'BOOLEAN',
                    isReadOnly: true,
                    inputColor: Color(0xFFEF6C00),
                    background: Color(0xFFFDF0E5),
                  ),
                ]),
          ])
    ];
  }
}
