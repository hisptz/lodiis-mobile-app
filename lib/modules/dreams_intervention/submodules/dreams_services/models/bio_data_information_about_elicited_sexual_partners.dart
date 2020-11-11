import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class BioDataInformationAboutElicitedSexualPartners {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'BIO DATA: Information about elicited Sexual Partners',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
              id: 'vHv97b8e4Km',
              name: 'Date index client contacted',
              valueType: 'DATE',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373),
            ),
            InputField(
                id: 'NkS5U9yUK47',
                name: 'Method of contact',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options:[
                  InputFieldOption(code: 'Phone', name: 'Phone'),
                  InputFieldOption(code: 'Home', name: 'Home'),
                  InputFieldOption(code: 'Both', name: 'Both'),
                  InputFieldOption(code: 'NS Centre', name: 'Other')
                ]),
            InputField(
                id: 'DPjKh4p18vz',
                name: 'Outcome of partner testing',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Tested', name: 'Tested'),
                  InputFieldOption(code: 'Refused', name: 'Refused'),
                  InputFieldOption(
                      code: 'Known Positive', name: 'Known Positive'),
                  InputFieldOption(code: 'Migrated', name: 'Migrated'),
                  InputFieldOption(
                      code: 'HH not located', name: 'HH not located'),
                  InputFieldOption(
                      code: 'Phone not reachable', name: 'Phone not reachable'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ]),
            InputField(
                id: 'dvDWG0RgGU8',
                name:
                    "Partner's address (including any landmarks, e.g. next to the church",
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VO3er79SMLm',
                name: 'Partner Notification Method: Provider',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ONVf3pd5lXV',
                name: 'Partner Notification Method: Dual',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LHEgpgfMKgF',
                name: 'Partner Notification Method: Client Referral',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TDbljOUa9TO',
                name: 'Partner Notification Method: Contract',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'CevEXgcrkXN',
                name: 'IPV screening: Physical hurt',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'FknAlefJvxU',
                name: 'IPV screening: Threatened to hurt',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'dvVICHpT4TT',
                name: 'IPV screening: Forced you sexually',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ZeXr3gvDhCW',
                name: 'Index Contact to elicited sexual partner linkage',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
          ]),
    ];
  }
}
