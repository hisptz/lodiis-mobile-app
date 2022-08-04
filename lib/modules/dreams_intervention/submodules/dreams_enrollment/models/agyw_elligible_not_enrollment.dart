import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class AgywElligibleNotEnrollment {
  static List<String> getMandatoryField() {
    return [
       'JhOvli80Qbx',
      'rSP9c21JsfC',
      'qZP982qpSPS',
      'VJiWumvINR6',
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: 'AGYW/DREAMS Eligible Not Enrolled ',
        color: const Color(0xFF258DCC),
        inputFields: [
          InputField(
            id: 'JhOvli80Qbx',
            name: 'First Name',
            translatedName: 'Lebitso la pele',
            valueType: 'TEXT',
            inputColor: const Color(0xFF258DCC),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 's1HaiT6OllL',
            name: 'Middle Name',
            translatedName: 'Lebitso le mahareng',
            valueType: 'TEXT',
            inputColor: const Color(0xFF258DCC),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'rSP9c21JsfC',
            name: 'Surname',
            translatedName: 'Le Fane',
            valueType: 'TEXT',
            inputColor: const Color(0xFF258DCC),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'pvjIijxEJGp',
            name: 'Phone number of parent/caregiver/heads of family',
            translatedName:
                'Nomoro ea fono ea motsoali/mohlokomeli/hloho ea lelapa',
            valueType: 'PHONE_NUMBER',
            inputColor: const Color(0xFF258DCC),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'ox6mydZjgC3',
            name: 'Phone Number',
            translatedName: 'Nomoro ea mohala',
            valueType: 'PHONE_NUMBER',
            inputColor: const Color(0xFF258DCC),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
            id: 'qZP982qpSPS',
            name: 'Date of Birth',
            translatedName: 'Letsatsi la tsoalo ',
            valueType: 'DATE',
            inputColor: const Color(0xFF258DCC),
            labelColor: const Color(0xFF737373),
            maxAgeInYear: 24,
            numberOfMonth: 11,
            minAgeInYear: 9,
          ),
          InputField(
            id: 'ls9hlz2tyol',
            translatedName: 'Lilemo',
            name: 'Age',
            isReadOnly: true,
            valueType: 'NUMBER',
            inputColor: const Color(0xFF258DCC),
            labelColor: const Color(0xFF737373),
          ),
          InputField(
              id: 'VJiWumvINR6',
              name: 'Sex',
              translatedName: 'Boleng',
              valueType: 'TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373),
              renderAsRadio: true,
              options: [
               InputFieldOption(code: 'Male', name: 'Male'),
              InputFieldOption(code: 'Female', name: 'Female'),
              InputFieldOption(
                  code: 'Transgender (male to female)',
                  name: 'Transgender (male to female)'),
              InputFieldOption(
                  code: 'Transgender (female to male)',
                  name: 'Transgender (female to male)'),
              ]),
          InputField(
              id: 'fEHah8SvP35',
              name:
                  'Is she currently residing in a community council/ district you are implementing DREAMS?',
              translatedName:
                  'Na nakong ea joale o lula k’hanseleng/seterekeng seo le kentseng lenane la DREAMS?',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373)),
                  InputField(
              id: 'x6VFmJLsqgx',
              name:
                  'Has parent/guardian provided consent for the girl to be enrolled in DREAMS?',
              translatedName:
                  'Bakeng sa baroetsana ba lilemo tse 9 hoisa ho 12, na motsoali/mohlokomeli o fane ka tumello ea hore moroetsana a kene lenaneng la DREAMS?',
              valueType: 'BOOLEAN',
              description: 'Ensure you have documented consent in AGYW file.',
              translatedDescription:
                  'Netefatsa hore o ngotse tumello ea AGYW faeleng.',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373)),
                InputField(
              id: 'OmOU8n78dg7',
              name: 'Has the AGYW agreed to be enrolled in DREAMS?',
              translatedName:
                  'Na moroetsana/mosali ea mocha lilemong o lumetse ho kena lenaneng la DREAMS?',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373)),
                InputField(
              id: 'L1Z7gkuKtbs',
              name: 'Comments/Notes',
              translatedName: 'Tlhakiso',
              valueType: 'LONG_TEXT',
              inputColor: const Color(0xFF258DCC),
              labelColor: const Color(0xFF737373)),
        ],
      )
    ];
  }
}