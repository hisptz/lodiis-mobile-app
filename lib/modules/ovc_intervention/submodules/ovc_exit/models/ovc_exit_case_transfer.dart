import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class OvcExitCaseTransfer {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Case Transfer Plan',
          color: Color(0xFF1B3519),
          inputFields: [
            InputField(
                id: 'WDIkYamF6kL',
                allowFuturePeriod: true,
                name: 'Planned date of transfer',
                valueType: 'DATE',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
            InputField(
                id: 'sdGKgJDFT4Z',
                name: 'Reason for transfer',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
            InputField(
                id: 'crjoWZ2IV7q',
                name: 'Organization transferring case',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
            InputField(
                id: 'DwAAgBlK1GX',
                name:
                    'Contact information for transferring Case Manager/Case Management worker',
                valueType: 'PHONE_NUMBER',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
            InputField(
                id: 'Ef9R8Wk6soU',
                name: 'Organization receiving the transfer',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
            InputField(
                id: 'vfmEe7lWUu6',
                name: 'Household strengths and assets',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
            InputField(
                id: 'pJdppBm5qkO',
                name: 'Ongoing household needs',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
            InputField(
                id: 'jSn5YKYPGG0',
                name: 'Services that will be provided by the new organization',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
            InputField(
                id: 'jEQkVul9Gnv',
                name: 'Final assistance to be provided by transferring program',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
            InputField(
                id: 'XEJYZzJJ5b6',
                allowFuturePeriod: true,
                name: 'Date of next follow up',
                valueType: 'DATE',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF4B9F46)),
          ])
    ];
  }
}
