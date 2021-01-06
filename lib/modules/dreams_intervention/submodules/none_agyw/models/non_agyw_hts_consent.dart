import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class NonAgywHTSConsent {
  static List<FormSection> getFormSections() {
    return [
      FormSection(name: 'HTS Consent', color: Color(0xFF737373), inputFields: [
        InputField(
          id: 'lDBdxPHndqZ',
          name:
              'Do you confirm that you have been informed about the nature, conduct, benefits, risks and implications involved in undertaking an HIV test?',
          valueType: 'BOOLEAN',
          inputColor: Color(0xFF258DCC),
          labelColor: Color(0xFF737373),
        ),
        InputField(
            id: 'ue9kOx3UeTa',
            name:
                'Have you also received and understood all the relevant information concerning the proposed test?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'lYPlsVaINE2',
            name:
                'Have you had sufficient opportunity to ask questions and to consider whether I want to proceed with the test?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'mv3oo5ZwG6E',
            name:
                'Do you freely and voluntarily agree to the HIV test being performed, which includes taking a blood sample and testing that sample?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 't8qcja4SqOG',
            name:
                'Do you agree counselor will inform you of the test results in person?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'nL0ybbExLV5',
            name:
                'Do you agree that the results of the test may be anonymously used for purposes of research and data collection purposes, provided that such information is de-identified with sufficient safeguards as to confidentiality?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'm8AsVhFfJe2',
            name:
                'Do you know that at any stage prior to the performance of the test, free to withdraw my consent to undergo the test?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
      ]),
    ];
  }
}
