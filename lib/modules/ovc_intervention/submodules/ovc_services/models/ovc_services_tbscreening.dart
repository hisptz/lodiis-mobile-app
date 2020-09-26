import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcServicesTbscreening {
  static List<FormSection> getFormSections() {
    return [
      FormSection(name: 'TB Screening', color: Color(0xFF1B3519), inputFields: [
        InputField(
            id: 'XMKMFSdCQ0S',
            name: 'Eligibility Criteria',
            valueType: 'TEXT',
            inputColor: Color(0xFF4B9F46),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'A current close contact of a person known or suspe',
                  name: 'A current close contact of a person known or suspe'),
              InputFieldOption(
                  code: 'Is HIV positive', name: 'Is HIV positive'),
              InputFieldOption(code: 'Malnourished', name: 'Malnourished'),
              InputFieldOption(code: 'Illicit drugs', name: 'Illicit drugs'),
            ]),
        InputField(
            id: 'aKUSNl3nEHA',
            name: 'Prolonged or difficulty in breathing cough of > 2 weeks?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF4B9F46),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'cAVna5BDOM8',
            name: 'Night sweats for no known reason of > 2 weeks?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF4B9F46),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'usdZsovNmsU',
            name: 'Persistent fever for > 2 weeks?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF4B9F46),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'Vxhh2rikoQz',
            name: 'Failure to thrive and/or poor?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF4B9F46),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'ItMRTuAI5EK',
            name:
                'Swelling in the neck, armpit or groin for more than 2 weeks?',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF4B9F46),
            labelColor: Color(0xFF737373)),
      ])
    ];
  }
}
