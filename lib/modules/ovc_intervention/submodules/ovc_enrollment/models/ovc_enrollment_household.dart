import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcEnrollmentHousehold {
  static List<String> getMandatoryField() {
    return [
      'RB8Wx75hGa4',
      'xiI8aC8RwjC',
      'WTZ7GLTrE8Q',
      'rSP9c21JsfC',
      'vIX4GTSCX4P',
      'qZP982qpSPS',
      'oSKX8fFQdWc',
    ];
  }

  static List<String> getHiddenField() {
    return ['location', 'yk0OH9p09C1', 'PN92g65TkVI'];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: '',
        color: const Color(0xFF737373),
        inputFields: [
          InputField(
            id: 'location',
            name: 'Location',
            translatedName: 'Sebaka',
            isReadOnly: true,
            allowedSelectedLevels: [3, 4],
            valueType: 'ORGANISATION_UNIT',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'RB8Wx75hGa4',
            name: 'Village',
            translatedName: 'Motse',
            valueType: 'TEXT',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
              id: 'xiI8aC8RwjC',
              name: 'Sub-village/Landmark',
              translatedName: 'Motsana',
              valueType: 'TEXT',
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF737373)),
        ],
      ),
      FormSection(
        name: 'Caregiver/Guardian details',
        translatedName: "Lintlha tsa mohlokomeli",
        color: const Color(0xFF737373),
        inputFields: [
          InputField(
            id: 'WTZ7GLTrE8Q',
            name: 'First Name',
            translatedName: 'Lebitso la pele',
            regExpValidation: RegExp('^[A-Za-z]{0,}'),
            valueType: 'TEXT',
            isReadOnly: true,
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 's1HaiT6OllL',
            name: 'Middle Name',
            translatedName: 'Lebitso le mahareng',
            regExpValidation: RegExp('^[A-Za-z]{0,}'),
            valueType: 'TEXT',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'rSP9c21JsfC',
            name: 'Surname',
            translatedName: 'Le Fane',
            regExpValidation: RegExp('^[A-Za-z]{0,}'),
            valueType: 'TEXT',
            isReadOnly: true,
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
              id: 'vIX4GTSCX4P',
              name: 'Sex',
              translatedName: 'Boleng',
              isReadOnly: true,
              valueType: 'TEXT',
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF737373),
              renderAsRadio: true,
              options: [
                InputFieldOption(
                    code: 'Male', name: 'Male', translatedName: 'Botona'),
                InputFieldOption(
                    code: 'Female',
                    name: 'Female',
                    translatedName: 'Botsehali'),
              ]),
          InputField(
            id: 'qZP982qpSPS',
            name: 'Date of Birth',
            translatedName: 'Letsatsi la tsoalo ',
            valueType: 'DATE',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
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
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'tNdoR0jYr7R',
            name: 'Phone Number',
            translatedName: 'Nomoro ea mohala',
            valueType: 'PHONE_NUMBER',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
              id: 's1eRvsL2Ly4',
              name: 'Marital Status',
              translatedName: 'Maemo a lenyalo',
              valueType: 'TEXT',
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF737373),
              options: [
                InputFieldOption(code: 'Married', name: 'Married'),
                InputFieldOption(code: 'Single', name: 'Single'),
                InputFieldOption(code: 'Widowed', name: 'Widowed'),
                InputFieldOption(
                    code: 'Divorced/separated', name: 'Divorced/separated'),
              ]),
          InputField(
              id: 'oSKX8fFQdWc',
              name: 'Caregiver HIV status',
              translatedName:
                  'Sephetho sa mohlokomeli sa tlhatlhobo ea ho qetela sa HIV se reng?',
              valueType: 'TEXT',
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF737373),
              options: [
                InputFieldOption(code: 'Positive', name: 'Positive'),
                InputFieldOption(code: 'Negative', name: 'Negative'),
                InputFieldOption(code: 'Unknown', name: 'Unknown'),
                InputFieldOption(code: 'No Response', name: 'No Response'),
              ]),
          InputField(
            id: 'l7op0btSqSc',
            name: 'Is caregiver on ART?',
            translatedName:
                "Haeba ts'oaetso e le teng, Na mohlokomeli o noa litlhare tsa ART?",
            valueType: 'BOOLEAN',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'iBws3HMjiUT',
            name: 'Facility obtaining ART',
            translatedName:
                "Haeba a noa litlhare, Setsi sa bophelo moo mohlokomeli a fumanang litlhare tsa ART ke se fe?",
            allowedSelectedLevels: [4],
            valueType: 'ORGANISATION_UNIT',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
              id: 'qAivZumsnJ2',
              name: 'Caregiver education level',
              translatedName: '',
              valueType: 'TEXT',
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF737373),
              options: [
                InputFieldOption(code: 'Primary level', name: 'Primary level'),
                InputFieldOption(
                    code: 'Secondary level', name: 'Secondary level'),
                InputFieldOption(code: 'Tertiary level', name: 'Tertiary'),
                InputFieldOption(code: 'Vocational level', name: 'Vocational'),
                InputFieldOption(code: 'None', name: 'Never been to School'),
              ]),
          InputField(
            id: 'l9tcZ2TNgx6',
            name:
                'Male aged above 18 years and above currently living in household',
            translatedName:
                'Palo ea banna ba fetang lilemo tse 18 ba phelang kahare ho lelapa',
            valueType: 'INTEGER_ZERO_OR_POSITIVE',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'rGAQnszNGVN',
            name:
                'Female aged 18 years and above currently living in household',
            translatedName:
                'Palo ea basali ba ka holimo ho lilemo tse 18 ba phelang kahare ho lelapa',
            valueType: 'INTEGER_ZERO_OR_POSITIVE',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'kQehaqmaygZ',
            isReadOnly: true,
            name: 'Male aged below 18 years living in household',
            translatedName:
                'Kakaretso ea bashanyana ba ka tlase ho lilemo tse 18 ba lula kahare ho lelapa',
            valueType: 'INTEGER_ZERO_OR_POSITIVE',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'BXUNH6LXeGA',
            isReadOnly: true,
            name: 'Female aged below 18 years currently living in household',
            translatedName:
                'Kakaretso ea banana ba ka tlase ho lilemo tse 18 ba lula kahare ho lelapa',
            valueType: 'INTEGER_ZERO_OR_POSITIVE',
            inputColor: const Color(0xFF4B9F46),
            labelColor: const Color(0xFF737373),
          ),
        ],
      ),
    ];
  }
}
