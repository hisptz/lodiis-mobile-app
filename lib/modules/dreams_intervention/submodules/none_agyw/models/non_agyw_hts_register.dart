import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/constants/app_hierarchy_reference.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class NonAgywHTSRegister {
  static List<String> getMandatoryFields() {
    return ['Ybc2k1zv7gK'];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'HTS Register',
          color: const Color(0xFF737373),
          inputFields: [
            InputField(
              id: 'VWa6pitIsPr',
              name: 'PITC',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'UTXsJZmGVDe',
              name: 'CITC',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'SxhVm7tN840',
              name: 'History of previous testing',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'mnhN8v0dyiw',
              name: 'Previous Results given?',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'u3vA2D4N9xQ',
              name: 'Time since last test',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'vvhxaEobVbU',
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
              id: 'CUIeUQFMjmC',
              name: '1st HIV test Determine Lot No',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'AD8F0Qqh1CM',
              name: '1st HIV test Determine Expiry',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'GNfLyc9sHW6',
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
              id: 'ggwuUxKAte1',
              name: '2nd HIV test Unigold Lot No',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'sRt0s3OloQd',
              name: '2nd HIV test Unigold Expiry',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'bueyyTJd9M1',
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
              id: 'WsaGLbOhXLT',
              name: '1st HIV test Repeat Determine Lot No',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'sbtlt3XUDMT',
              name: '1st HIV test Repeat Determine Expiry',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'TIIoLk9YGrw',
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
              id: 'CRpS0lgzRgw',
              name: '2nd HIV test Repeat Unigold Lot No',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'qUqQQMVTqCT',
              name: '2nd HIV test Repeat Unigold Expiry',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'mARCEm6ew3Z',
              name: '3rd HIV test Repeated SD Bioline',
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
              id: 'sJIk9ylQsSQ',
              name: '3rd HIV test Repeated SD Bioline Lot No',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'OxHkJGN7qoS',
              name: '3rd HIV test Repeated SD Bioline Expiry',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'uRf1K1yfkwy',
              name: 'DNA PCR Results',
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
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'Ybc2k1zv7gK',
              name: 'Final HIV Status',
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
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'benz4BFQUdz',
              name: 'Final Result Given',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'WvubKvHLaxh',
              name: 'EQC/PPT',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'yvu29Wvtb41',
              name: 'Tested as Couple?',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'CpGjlCaEcJt',
              name: 'Couple Discordant?',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
                id: 'WsyK9VWBYOQ',
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
              id: 'Yk0afIAypzt',
              name: 'Other Mode of Entry Point',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'sMjWZacgjtK',
              name: 'Male condom',
              valueType: 'NUMBER',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'KSn7Dxh4oUU',
              name: 'Female condom',
              valueType: 'NUMBER',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'FI9Wzzys767',
              name: 'TB screening',
              valueType: 'BOOLEAN',
              isReadOnly: true,
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'ses8fLQtfoi',
              name: 'Linked to Care?',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'aX0niP9AH6t',
              name: 'ART Unique No',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'zcMQIn9jMRD',
              name: 'Patient Clinic #',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'GwsIKCCsbSB',
              name: 'Date Linked to care',
              valueType: 'DATE',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'vOl2rgl3KTy',
              name: 'Referred Facility',
              valueType: 'ORGANISATION_UNIT',
              allowedSelectedLevels: [AppHierarchyReference.facilityLevel],
              showCountryLevelTree: true,
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
            ),
          ]),
    ];
  }
}
