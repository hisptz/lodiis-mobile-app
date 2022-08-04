import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcEnrollmentChild {
  static List<String> getMandatoryField() {
    return [
      'WTZ7GLTrE8Q',
      'rSP9c21JsfC',
      'qZP982qpSPS',
      'vIX4GTSCX4P',
      'iS9mAp3jDaU',
      'wmKqYZML8GA',
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Child Information',
          description:
              'This tool should be applied to all children aged 0-17 years and 11 months old.',
          color: const Color(0xFF1A3518),
          inputFields: [
            InputField(
              id: 'WTZ7GLTrE8Q',
              name: 'First Name',
              translatedName: 'Lebitso la pele',
              valueType: 'TEXT',
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 's1HaiT6OllL',
              name: 'Middle Name',
              translatedName: 'Lebitso le mahareng',
              valueType: 'TEXT',
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'rSP9c21JsfC',
              name: 'Surname',
              translatedName: 'Le Fane',
              valueType: 'TEXT',
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'tNdoR0jYr7R',
              name: 'Phone Number',
              translatedName: 'Nomoro ea mohala',
              valueType: 'PHONE_NUMBER',
              isReadOnly: true,
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
              id: 'qZP982qpSPS',
              name: 'Date of Birth',
              translatedName: 'Letsatsi la tsoalo ',
              valueType: 'DATE',
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF737373),
              maxAgeInYear: 17,
              numberOfMonth: 11,
              minAgeInYear: 0,
              hint: "Beneficiary's age should be from 0 - 17 years",
              translatedHint: "Lilemo tsa setho li be pakeng tsa 0 le 17",
            ),
            InputField(
              id: 'ls9hlz2tyol',
              translatedName: 'Lilemo',
              name: 'Age',
              isReadOnly: true,
              valueType: 'NUMBER',
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF737373),
            ),
            InputField(
                id: 'vIX4GTSCX4P',
                name: 'Sex',
                translatedName: 'Boleng',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                renderAsRadio: true,
                options: [
                  InputFieldOption(
                      code: 'Male', name: 'Male', translatedName: 'Botona'),
                  InputFieldOption(
                      code: 'Female',
                      name: 'Female',
                      translatedName: 'Botsehali'),
                ]),
            InputField(
                id: 'RDobagXItZ6',
                name: 'Type of beneficiary',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                renderAsRadio: true,
                options: [
                  InputFieldOption(code: 'New', name: 'New'),
                  InputFieldOption(code: 'Re-enrolled', name: 'Re-enrolled')
                ]),
            InputField(
                id: 'iS9mAp3jDaU',
                name: 'Relationship to Caregiver',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'TEXT',
                options: [
                  InputFieldOption(
                      code: 'Biological mother', name: 'Biological mother'),
                  InputFieldOption(
                      code: 'Biological father', name: 'Biological father'),
                  InputFieldOption(code: 'Aunt/Uncle', name: 'Aunt/Uncle'),
                  InputFieldOption(code: 'Sibling', name: 'Sibling'),
                  InputFieldOption(code: 'Grandparent', name: 'Grandparent'),
                ]),
            InputField(
                id: 'KO5NC4pfBmv',
                name: 'Is this a primary child?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN'),
          ]),
      FormSection(
          name: 'Child Vulnerability',
          color: const Color(0xFF1A3518),
          inputFields: [
            InputField(
                id: 'wmKqYZML8GA',
                name: '1. Child living with HIV ?',
                translatedName: '1. Ke ngoana ea phelang le ts’oaetso ea HIV?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'GMcljM7jbNG',
                name: '2. HIV exposed infants (HEI)?',
                translatedName:
                    '2. O tlokotsing ea ts’oaetso ea HIV (mohlala, ngoana ea hlahileng ho ‘m’e ea phelang le ts’oaetso)?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'br1xvwAQ6el',
                name: '3. Child of a sex worker(FSW)?',
                translatedName:
                    '3. Ke ngoana oa motsoali ea hoebang ka mmele (FSW)?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'ZKMhrjWoXnD',
                name: '4. Child of people living with HIV (PLHIV)?',
                translatedName:
                    '4. Ke ngoana ea phelang lapeng le nang le motho ea phelang le t’soaetso ea HIV (PLHIV)?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'Gkjp5XZD70V',
                name:
                    '5. Child exposed/experiencing violence and abuse (Survivors of Vac)?',
                translatedName:
                    '5. Ke ngoana ea kileng a hlekefetsoa/tlokotsing ea tlhekefetso?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN'),
            InputField(
              id: 'Sa0KVprHUr7',
              name: '5.1. When did the violence or abuse happen?',
              translatedName: '5.1. Tlhekefetso e etsahetse neng?',
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF737373),
              valueType: 'TEXT',
              options: [
                InputFieldOption(
                    code: '0-3 months ago',
                    name: '0-3 months ago',
                    translatedName: '0-3 likhoeli tse fetileng'),
                InputFieldOption(
                    code: '4-6 months ago',
                    name: '4-6 months ago',
                    translatedName: '4-6 likhoeli tse fetileng'),
                InputFieldOption(
                    code: '7-12 months ago',
                    name: '7-12 months ago',
                    translatedName: '7-12 likhoeli tse fetileng'),
              ],
            ),
            InputField(
                id: 'wtrZQadTkOL',
                name: '5.2. What type of violence /abuse did you experience?',
                translatedName: '5.2. Ene ele Tlhekefetso ea mofuta ofe?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'CHECK_BOX',
                options: [
                  InputFieldOption(
                      code: 'm26lCJGANwu',
                      name: 'Sexual',
                      translatedName: 'Tlhekefetso ka Motabo'),
                  InputFieldOption(
                      code: 'BGJgzqszT0H',
                      name: 'Economic/Neglect',
                      translatedName: 'Tlhekefetso moruong'),
                  InputFieldOption(
                      code: 'WAjYVtFWI2n',
                      name: 'Physical',
                      translatedName: 'Tlhekefetso Mmeleng'),
                  InputFieldOption(
                      code: 'lm4BA6iOdlI',
                      name: 'Emotional',
                      translatedName: 'Tlhekefetso maikutlong'),
                ]),
            InputField(
                id: 'Mc3k3bSwXNe',
                name: '5.3. Action taken?',
                translatedName: '5.3. O nkile Bohato mabapi le tlhekefetso ee?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'CePNVGSnj00',
                name: '5.4. What type of action was taken?',
                translatedName: '5.4. Ke methati efe ea Molao e latetsoeng?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'CHECK_BOX',
                options: [
                  InputFieldOption(
                      code: 'yI8xKOrRN9a',
                      name: 'Health Facility',
                      translatedName: 'Setsi sa bophelo'),
                  InputFieldOption(
                      code: 'ftRPTznAqUn',
                      name: 'Police -CGPU',
                      translatedName: 'Mapoleseng'),
                  InputFieldOption(
                      code: 'FVBsqRoLGYW',
                      name: 'Chief',
                      translatedName: 'Morena'),
                  InputFieldOption(
                      code: 'PoQuVkWjI4K',
                      name: 'Councilor',
                      translatedName: 'Mocouncilor'),
                  InputFieldOption(
                      code: 'mM0mGp695z4',
                      name: 'Social Worker',
                      translatedName: 'Mohlabolli'),
                  InputFieldOption(
                      code: 'Yu4SpTnnAqb',
                      name: 'Other',
                      translatedName: 'Tse ling'),
                ]),
            InputField(
                id: 'GM2mJDlGZin',
                name: 'Specify other type of action taken',
                translatedName: 'Tse ling  (hlalosa)',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'TEXT'),
            InputField(
                id: 'UeF4OvjIIEK',
                name: '6. Is the child an orphan?',
                translatedName: '6. Na Ngoana ke khutsana?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'nOgf8LKXS4k',
                name: 'Orphan status',
                translatedName: 'Boemo ba likhutsana',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Single Orphan(Mother)',
                      name: 'Single Orphan(Mother Died)',
                      translatedName: 'Khutsana ka Motsoali a le mong(mme)'),
                  InputFieldOption(
                      code: 'Single Orphan(Father)',
                      name: 'Single Orphan(Father Died)',
                      translatedName: 'Khutsana ka Motsoali a le mong (ntate)'),
                  InputFieldOption(
                      code: 'Double Orphan',
                      name: 'Double Orphan (Father & Mother Died)',
                      translatedName: 'Khutsana Khulu (ntate le mme)')
                ]),
            InputField(
                id: 'YR7Xxk14qoP',
                name: '7. Is the child living with disabilities?',
                translatedName: '7. Ngoana o phela le bokooa?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'YR7Xxk14qoP_checkbox',
                name: 'What type of disabilities?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'CHECK_BOX',
                options: [
                  InputFieldOption(
                      code: 'dufGxx0KVg0',
                      name: 'acquired brain injury',
                      translatedName: 'lemetseng bokong'),
                  InputFieldOption(
                      code: 'nfp9NHLf25K',
                      name: 'autism spectrum disorder',
                      translatedName: 'bothata ba autism spectrum'),
                  InputFieldOption(
                      code: 'tbLVGG4zDrJ',
                      name: 'deaf or hard hearing',
                      translatedName: 'setholo kapa kutlo e thata'),
                  InputFieldOption(
                      code: 'ULr0tYkjTTB',
                      name: 'intellectual disability',
                      translatedName: 'bokooa ba kelello'),
                  InputFieldOption(
                      code: 'BfbiOanp9Pi',
                      name: 'mental health conditions',
                      translatedName: 'maemo a bophelo bo botle ba kelello'),
                  InputFieldOption(
                      code: 'X3MQhmVA1Jt',
                      name: 'physical disability',
                      translatedName: 'ho holofala mmeleng'),
                  InputFieldOption(
                      code: 'TPRVr4ua9f9',
                      name: 'vision impairment',
                      translatedName: 'ho senyeha ha pono'),
                ]),
            InputField(
                id: 'mTv9eZZq0Nz',
                name: '8. Which is the primary vulnerability?',
                isReadOnly: true,
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'TEXT',
                options: [
                  InputFieldOption(
                      code: 'Orphan',
                      name: 'Orphan',
                      translatedName: 'Khutsana'),
                  InputFieldOption(
                      code: 'Child living with disability',
                      name: 'Child living with disability',
                      translatedName: 'Ngoana ea phelang ka bokooa'),
                  InputFieldOption(
                      code: 'Child living with HIV',
                      name: 'Child living with HIV',
                      translatedName: 'Ngoana ea phelang le HIV'),
                  InputFieldOption(
                      code: 'Child of PLHIV',
                      name: 'Child of PLHIV',
                      translatedName:
                          'Ngoana ea phelang lapeng le nang le motho ea phelang le t’soaetso ea HIV'),
                  InputFieldOption(
                      code: 'HIV exposed infants',
                      name: 'HIV exposed infants',
                      translatedName: 'HIV e pepesa masea'),
                  InputFieldOption(
                      code: 'Child of a sex worker (FSW)',
                      name: 'Child of a sex worker (FSW)',
                      translatedName:
                          'Ke ngoana oa motsoali ea hoebang ka mmele (FSW)'),
                  InputFieldOption(
                      code:
                          'Child exposed/experiencing violence and abuse (Survivors of Vac)',
                      name:
                          'Child exposed/experiencing violence and abuse (Survivors of Vac)',
                      translatedName:
                          'Ngoana ea kileng a hlekefetsoa/tlokotsing ea tlhekefetso'),
                ]),
            InputField(
                id: 'omUPOnb4JVp',
                name:
                    '9. Are there other vulnerabilities? (Beyond the identified seven)',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'WsmWkkFBiT6',
                name: 'Other vulnerability (Beyond the identified seven)',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'TEXT'),
          ])
    ];
  }
}
