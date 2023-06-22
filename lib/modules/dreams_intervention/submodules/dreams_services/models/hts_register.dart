import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/constants/app_hierarchy_reference.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class HTSRegister {
  static List<String> getMandatoryFields() {
    return ['N8tlZl91pBY'];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'HTS Register',
          color: const Color(0xFF737373),
          inputFields: [
            InputField(
              id: 'TzQgZh4Emjc',
              name: 'PITC',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'c9QZUeAy0wW',
              name: 'CITC',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'r9qhjMX4Hx6',
              name: 'History of previous testing',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'pIHdbKd5FPu',
              name: 'Previous Results given?',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'lbQibppfmcY',
              name: 'Time since last test',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'KmQPPZ7O30R',
              name: 'Pre-test counselled?',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'Y5PxXxigrdQ',
              name: '1st HIV test Determine',
              valueType: 'TEXT',
              options: [
                InputFieldOption(
                    code: 'Positive',
                    name: 'Positive',
                    translatedName: 'T’soaetso e teng'),
                InputFieldOption(
                    code: 'Negative',
                    name: 'Negative',
                    translatedName: 'T’soaetso haeo'),
                InputFieldOption(code: 'Indeterminate', name: 'Indeterminate'),
              ],
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'b0eR4kaNZQF',
              name: '1st HIV test Determine Lot No',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'Mz3Nl9sdokn',
              name: '1st HIV test Determine Expiry',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'wLgXXyf7NJ9',
              name: '2nd HIV test Unigold',
              valueType: 'TEXT',
              options: [
                InputFieldOption(
                    code: 'Positive',
                    name: 'Positive',
                    translatedName: 'T’soaetso e teng'),
                InputFieldOption(
                    code: 'Negative',
                    name: 'Negative',
                    translatedName: 'T’soaetso haeo'),
                InputFieldOption(code: 'Indeterminate', name: 'Indeterminate'),
              ],
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'R9cQnQsG45r',
              name: '2nd HIV test Unigold Lot No',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'qeHyqz86Fl8',
              name: '2nd HIV test Unigold Expiry',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'AAspMgNuM2c',
              name: '1st HIV test Repeat Determine',
              valueType: 'TEXT',
              options: [
                InputFieldOption(
                    code: 'Positive',
                    name: 'Positive',
                    translatedName: 'T’soaetso e teng'),
                InputFieldOption(
                    code: 'Negative',
                    name: 'Negative',
                    translatedName: 'T’soaetso haeo'),
                InputFieldOption(code: 'Indeterminate', name: 'Indeterminate'),
              ],
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'ZGYjobLBZFU',
              name: '1st HIV test Repeat Determine Lot No',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'G1qmzkIMtWx',
              name: '1st HIV test Repeat Determine Expiry',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'N78w4YWM5SY',
              name: '2nd HIV test Repeat Unigold',
              valueType: 'TEXT',
              options: [
                InputFieldOption(
                    code: 'Positive',
                    name: 'Positive',
                    translatedName: 'T’soaetso e teng'),
                InputFieldOption(
                    code: 'Negative',
                    name: 'Negative',
                    translatedName: 'T’soaetso haeo'),
                InputFieldOption(code: 'Indeterminate', name: 'Indeterminate'),
              ],
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'k12w1gU3NNN',
              name: '2nd HIV test Repeat Unigold Lot No',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'geLLet99Av2',
              name: '2nd HIV test Repeat Unigold Expiry',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'GMn3daZLeN7',
              name: '3rd HIV test Repeated SD Bioline',
              valueType: 'TEXT',
              options: [
                InputFieldOption(code: 'Positive', name: 'Positive'),
                InputFieldOption(code: 'Negative', name: 'Negative'),
                InputFieldOption(code: 'Indeterminate', name: 'Indeterminate'),
              ],
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'ufJ70Sbu45y',
              name: '3rd HIV test Repeated SD Bioline Lot No',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'cVkNfJ2kOar',
              name: '3rd HIV test Repeated SD Bioline Expiry',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'idNHfBDFRwv',
              name: 'DNA PCR Results',
              options: [
                InputFieldOption(code: 'Positive', name: 'Positive'),
                InputFieldOption(code: 'Negative', name: 'Negative'),
                InputFieldOption(code: 'Indeterminate', name: 'Indeterminate'),
              ],
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'N8tlZl91pBY',
              name: 'Final HIV Status',
              options: [
                InputFieldOption(code: 'Positive', name: 'Positive'),
                InputFieldOption(code: 'Negative', name: 'Negative'),
                InputFieldOption(code: 'Indeterminate', name: 'Indeterminate'),
              ],
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'Hwv0NQjuyaK',
              name: 'Final Result Given',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'FKz6EltIScb',
              name: 'EQC/PPT',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'B9WDdd3feaQ',
              name: 'Tested as Couple?',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'cGnoMSGCGBG',
              name: 'Couple Discordant?',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
                id: 'Dzr6d0hPXjR',
                name: 'Mode of Entry Point',
                valueType: 'TEXT',
                inputColor: const Color(0xFF258DCC),
                labelColor: const Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'ART', name: 'ART'),
                  InputFieldOption(code: 'ANC', name: 'ANC'),
                  InputFieldOption(code: 'OPD', name: 'OPD'),
                  InputFieldOption(code: 'TB', name: 'TB'),
                  InputFieldOption(code: 'VMMC', name: 'VMMC'),
                  InputFieldOption(code: 'Adolescent', name: 'Adolescent'),
                  InputFieldOption(code: 'Self Testing', name: 'Self Testing'),
                  InputFieldOption(code: 'In-Patient', name: 'In-Patient'),
                  InputFieldOption(code: 'PEP', name: 'PEP'),
                  InputFieldOption(
                      code: 'Other(Specify)', name: 'Other(Specify)'),
                ]),
            InputField(
              id: 'IHuXwqwWl9i',
              name: 'Other Mode of Entry Point',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'nAJSNqFjoPj',
              name: 'Male condom',
              valueType: 'NUMBER',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'Uger7u9MK2k',
              name: 'Female condom',
              valueType: 'NUMBER',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'Io9EHy6EzgM',
              name: 'TB screening',
              valueType: 'BOOLEAN',
              isReadOnly: true,
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'jO14p2Unvqm',
              name: 'Linked to Care?',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'UXXn9kAqASd',
              name: 'ART Unique No',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'beizqNyYP9a',
              name: 'Patient Clinic #',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'CCgL6RQ9BkR',
              name: 'Date Linked to care',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'RJIRJBkyuaj',
              name: 'Referred Facility',
              valueType: 'ORGANISATION_UNIT',
              showCountryLevelTree: true,
              allowedSelectedLevels: [AppHierarchyReference.facilityLevel],
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
          ]),
    ];
  }
}
