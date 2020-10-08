import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class HTSConsent {
  static List<FormSection> getFormSections() {
    return [
      FormSection(name: 'HTS Consent', color: Color(0xFF05131B), inputFields: [
        InputField(
          id: 'rguXA70zATn',
          name:
              'Do you confirm that you have been informed about the nature, conduct, benefits, risks and implications involved in undertaking an HIV test?',
          valueType: 'BOOLEAN',
          inputColor: Color(0xFF258DCC),
          labelColor: Color(0xFF05131B),
        ),
        InputField(
            id: 'TcN49hQNZiG',
            name:
                'Have you also received and understood all the relevant information concerning the proposed test?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF05131B)),
        InputField(
            id: 'HZ4BrWoGNIO',
            name:
                'Have you had sufficient opportunity to ask questions and to consider whether I want to proceed with the test?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF05131B)),
        InputField(
            id: 'Gl7NGINbUAV',
            name:
                'Do you freely and voluntarily agree to the HIV test being performed, which includes taking a blood sample and testing that sample?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF05131B)),
        InputField(
            id: 'yVYVJe26S4u',
            name:
                'Do you agree counselor will inform you of the test results in person?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF05131B)),
        InputField(
            id: 'B4xx1IVaAnI',
            name:
                'Do you agree that the results of the test may be anonymously used for purposes of research and data collection purposes, provided that such information is de-identified with sufficient safeguards as to confidentiality?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF05131B)),
        InputField(
            id: 'rY4ei8RNw6c',
            name:
                'Do you know that at any stage prior to the performance of the test, free to withdraw my consent to undergo the test?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF05131B)),
      ]),
    ];
  }
}
