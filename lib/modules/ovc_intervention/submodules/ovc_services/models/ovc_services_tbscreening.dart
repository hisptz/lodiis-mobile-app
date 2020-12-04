import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcServicesTbscreening {
  static List<FormSection> getFormSections() {
    return [
      FormSection(name: 'TB Screening', color: Color(0xFF4B9F46), inputFields: [
        InputField(
            id: 'XMKMFSdCQ0S',
            name: 'Eligibility Criteria',
            translatedName: 'MOKHOA OA KHETHO EA BA HLAHLOJOANG',
            valueType: 'TEXT',
            inputColor: Color(0xFF4B9F46),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'A current close contact of a person known or suspe',
                  name: 'A current close contact of a person known or suspe',
                  translatedName:
                      'Ho ba haufi le motho ea nang kapa a belaelloang ho ba le TB'),
              InputFieldOption(
                  code: 'Is HIV positive',
                  name: 'Is HIV positive',
                  translatedName: 'Ts’oaetso e teng ho ngoana'),
              InputFieldOption(
                  code: 'Malnourished',
                  name: 'Malnourished',
                  translatedName: 'Ngoana o nale khaello ea phepo'),
              InputFieldOption(
                  code: 'Illicit drugs',
                  name: 'Illicit drugs',
                  translatedName: 'Ngoana o katlase ho lemo tse hlano'),
            ]),
      ], subSections: [
        FormSection(
            name: '',
            color: Color(0xFF4B9F46),
            description:
                'Have the child experienced any of the following in the past 6 months?',
            translatedDescription:
                'Na ngoana o kile a ba le e nngoe eat see likhoeling tse fetileng tse tsheletseng?',
            inputFields: [
              InputField(
                  id: 'aKUSNl3nEHA',
                  name:
                      '1. Prolonged or difficulty in breathing cough of > 2 weeks?',
                  translatedName: '1.  Ho ohlola ho feta nako ea libeke tse 2?',
                  valueType: 'BOOLEAN',
                  inputColor: Color(0xFF4B9F46),
                  labelColor: Color(0xFF737373)),
              InputField(
                  id: 'cAVna5BDOM8',
                  name: '2. Night sweats for no known reason of > 2 weeks?',
                  translatedName:
                      '2. Na ngoana o fufuleloa hore liphahlo libe metsi nako e fetang beke tse 2?',
                  valueType: 'BOOLEAN',
                  inputColor: Color(0xFF4B9F46),
                  labelColor: Color(0xFF737373)),
              InputField(
                  id: 'usdZsovNmsU',
                  name: '3. Persistent fever for > 2 weeks?',
                  translatedName: '3. Mocheso Nakong e fetang beke tse 2?',
                  valueType: 'BOOLEAN',
                  inputColor: Color(0xFF4B9F46),
                  labelColor: Color(0xFF737373)),
              InputField(
                  id: 'Vxhh2rikoQz',
                  name: '4. Failure to thrive and/or poor?',
                  translatedName: '4. Ho se hole hantle?',
                  valueType: 'BOOLEAN',
                  inputColor: Color(0xFF4B9F46),
                  labelColor: Color(0xFF737373)),
              InputField(
                  id: 'ItMRTuAI5EK',
                  name:
                      '5. Swelling in the neck, armpit or groin for more than 2 weeks?',
                  translatedName:
                      '5. Ho ruruha molala, ka mahafing le lithalooane nako e fetang beke tse 2?',
                  valueType: 'BOOLEAN',
                  inputColor: Color(0xFF4B9F46),
                  labelColor: Color(0xFF737373)),
            ])
      ])
    ];
  }
}
