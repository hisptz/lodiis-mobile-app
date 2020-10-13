import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class ConsentForReleaseOfStatus {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Consent for release of status',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
              id: 'sZLY3ras0i8',
              name:
                  'Do you freely, soundly and voluntarily approached newstart Voluntary Counselling and Testing Centre (VCT) to have an HIV test and you have requested and authorise the Centre to draw your blood and to test it accordingly?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373),
            ),
            InputField(
                id: 'c5QfccoidCp',
                name:
                    'Do you verify that the number on the blood samples matches that on the client card and that you are the person you claim to be?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'm7rC8D25H1J',
                name:
                    'Do you authorize the nurse counsellor or referral coordinator or site manager to release your HIV status in writing to your medical provider for the purpose of obtaining a referral for medical care?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LY4qEioqML6',
                name:
                    'Do you understand that your HIV results will be kept in a confidential manner in the VCT site, but that your name is now associated with your HIV status, your client file will be released by your medical provider in a signed and s?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Va1G0vX0DID',
                name:
                    'I accept that I will not have any claims against the testing centre, its employees or agents, and all other persons involved in the Voluntary and Counselling Testing (VCT) results or my HIV status to my medical provider, including',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
          ]),
    ];
  }
}
