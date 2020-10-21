import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcHouseHoldServiceAdultWellbeing {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'DOMAIN STABLE',
          color: Color(0xFF4B9F46),
          description:
              'Case Management Worker reads: “Assets are things that are useful and valuable to you. For example, they can be people because each person has knowledge, skills, and talents.”',
          borderColor: Color(0xFF4B9F46),
          inputFields: [
            InputField(
                id: '',
                name: 'How do you help your family?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'CjAlp228JXu', name: 'Providing money'),
                  InputFieldOption(
                      code: 'O4i1IMcrjNP', name: 'Looking after the children'),
                  InputFieldOption(code: 'dGQN8qr47k5', name: 'House chores'),
                  InputFieldOption(
                      code: 'rSOF0xwHBfp',
                      name: 'Collecting water and/ or wood'),
                  InputFieldOption(
                      code: 'UZVG6KG5Rtm', name: 'Taking care of animals'),
                  InputFieldOption(
                      code: 'eD5eOF5nYGS',
                      name: 'Providing food & other household items'),
                  InputFieldOption(code: 'PiXi6AtLqiQ', name: 'Other')
                ]),
            InputField(
                id: 'zUU33n41Soa',
                name: 'Other: Please specify',
                valueType: 'TEXT',
                inputColor: Color(0xFF1A3518),
                labelColor: Color(0xFF4A9F46)),
            InputField(
                id: '',
                name:
                    'How do other adults in your household and those not living with you help you?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'cIvR9TgW8Bx',
                      name: 'Not applicable (no other adults)'),
                  InputFieldOption(code: 'd5Z8bqGYGha', name: 'Provide money'),
                  InputFieldOption(
                      code: 'OPZgRaCoCix',
                      name: 'Help you look after the children'),
                  InputFieldOption(
                      code: 'HIhJEBccb4s', name: 'Help you with house Chores'),
                  InputFieldOption(
                      code: 'rBoJRVqlWpD', name: 'Work on the farms'),
                  InputFieldOption(
                      code: 'z2Pq08hpx51',
                      name: 'Collecting water and/ or wood'),
                  InputFieldOption(
                      code: 'zk0W0bDbTls', name: 'Taking care of animals'),
                  InputFieldOption(
                      code: 'iSE037kVfFJ',
                      name: 'Provide food & other household items'),
                  InputFieldOption(
                      code: 'oD8mSMj2cjD', name: 'Earn extra money'),
                  InputFieldOption(code: 'yqwX3XCGAUN', name: 'Other')
                ]),
            InputField(
                id: 'BKDRNiyoMgV',
                name: 'Other, Specify (Other adults)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: '',
                name: 'What is your source of income?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'ClMA0dgfvIh', name: 'Employed'),
                  InputFieldOption(code: 'WzSkHuD5iRt', name: 'Casual Laborer'),
                  InputFieldOption(code: 'JGDnvDvmHGT', name: 'Small business'),
                  InputFieldOption(code: 'LGrG9fGZfXP', name: 'Unemployed'),
                ]),
            InputField(
                id: 'ZuaV20IvVV2',
                name: 'Is your work regular or irregular?',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Regular', name: 'Regular'),
                  InputFieldOption(code: 'Irregular', name: 'Irregular'),
                ]),
            InputField(
                id: 'p8htbyJHydl',
                name:
                    'Are you able to regularly meet the needs of your children (school fees, medication, clothes, housing)?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'p8htbyJHydl_checkbox',
                name: 'If yes, indicate how',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'kFRCZNQIF51', name: 'Savings'),
                  InputFieldOption(code: 'Pe3CHmZicqT', name: 'Grants'),
                  InputFieldOption(code: 'DgzwMbXo0ZK', name: 'Salary/Wages'),
                  InputFieldOption(code: 'GC6eZ5TOt9z', name: 'Pension'),
                  InputFieldOption(
                      code: 'bKkHP4C1WzO', name: 'Selling of assests'),
                  InputFieldOption(code: 'gmVjuNTq31c', name: 'Borrowing'),
                  InputFieldOption(
                      code: 'roCpGtUYOhp',
                      name: 'Self-employed (business/farming/fishing)'),
                  InputFieldOption(
                      code: 'mXBvp9ahws3', name: 'Support of well-wishers'),
                  InputFieldOption(
                      code: 'jtCijspeacL', name: 'Other programs/bursaries')
                ]),
            InputField(
                id: 'Vur0hsmfhQ5',
                name: 'Others',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: '',
                name:
                    'If today you had an unplanned expense for the family, how would you respond in meeting this need?',
                description:
                    'Unplanned expenses include: food, schooling, healthcare, natural calamities such as funeral, fire, floods, drought.',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'sg0Xb00g4Cm', name: 'My salary'),
                  InputFieldOption(code: 'WsmCWZnrldc', name: 'My savings'),
                  InputFieldOption(
                      code: 'VYyrkhWsf3e',
                      name: 'A loan from family or friend'),
                  InputFieldOption(
                      code: 'EK531jw3C8s',
                      name: 'A loan from Micro-finance group'),
                  InputFieldOption(
                      code: 'lUtqQEPBJsc', name: 'A loan from a money lender'),
                  InputFieldOption(
                      code: 'Inkzrxg621l', name: 'Hawking/market vending'),
                  InputFieldOption(
                      code: 'MvM4Kl6bvLd', name: 'Sell off family assests'),
                  InputFieldOption(
                      code: 'yfE4U124drd', name: 'Sell/exchange food'),
                  InputFieldOption(
                      code: 'VLlIBeTWT2r',
                      name: 'Unable to meet unplanned needs/expenses')
                ]),
            InputField(
                id: '',
                name:
                    'If today you had an unplanned expense for the family, how would you respond in meeting this need?',
                description:
                    'Unplanned expenses include: food, schooling, healthcare, natural calamities such as funeral, fire, floods, drought.',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'sg0Xb00g4Cm', name: 'My salary'),
                  InputFieldOption(code: 'WsmCWZnrldc', name: 'My savings'),
                  InputFieldOption(
                      code: 'VYyrkhWsf3e',
                      name: 'A loan from family or friend'),
                  InputFieldOption(
                      code: 'EK531jw3C8s',
                      name: 'A loan from Micro-finance group'),
                  InputFieldOption(
                      code: 'lUtqQEPBJsc', name: 'A loan from a money lender'),
                  InputFieldOption(
                      code: 'Inkzrxg621l', name: 'Hawking/market vending'),
                  InputFieldOption(
                      code: 'MvM4Kl6bvLd', name: 'Sell off family assests'),
                  InputFieldOption(
                      code: 'yfE4U124drd', name: 'Sell/exchange food'),
                  InputFieldOption(
                      code: 'VLlIBeTWT2r',
                      name: 'Unable to meet unplanned needs/expenses')
                ]),
            InputField(
                id: 'kuRUBMvgjZy',
                name: 'Are you a member of a savings group?',
                description:
                    'If no, connect/refer them to SILC, VSL or microcredit.',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: '',
                name: 'Do you know of any of the following programs?',
                description:
                    'If necessary, link the household to the services they are not accessing.',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'DcDA1A6YdYZ', name: 'Child grant'),
                  InputFieldOption(
                      code: 'TpNCQQeaPtF', name: 'Public assistance in cash'),
                  InputFieldOption(
                      code: 'j5dpw68MH8L', name: 'Old age pension'),
                  InputFieldOption(code: 'wtyPIIc4I4q', name: 'Food'),
                  InputFieldOption(
                      code: 'aPgHmhjvpOq', name: 'School bursaries'),
                  InputFieldOption(code: 'igsx50T6JZ8', name: 'Farm Supplies'),
                  InputFieldOption(code: 'doJJzw4NX8m', name: 'No')
                ]),
            InputField(
                id: '',
                name:
                    'If yes, do you participate in any of the following programs? ',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'lBQzVBwO3q0', name: 'Child grant'),
                  InputFieldOption(
                      code: 'hLl7wKXZMBc', name: 'Public assistance in cash'),
                  InputFieldOption(
                      code: 'f0gSCFVtGiy', name: 'Old age pension'),
                  InputFieldOption(code: 'vfah83KH19V', name: 'Food'),
                  InputFieldOption(
                      code: 'i6JeeDn3pXR', name: 'School bursaries'),
                  InputFieldOption(code: 'j4OVpjDF1Sp', name: 'Farm Supplies'),
                  InputFieldOption(code: 'JojbPlav7NK', name: 'No')
                ]),
            InputField(
                id: 'iqBsSAfCyJb',
                name:
                    'Which food groups do you regularly serve to your family?',
                description:
                    '1. Energy foods: Papa, potatoes, bananas, oil, sorghum, rice, Bread\n 2. Body building foods: beans, meat, peas, milk, eggs, fish\n3. Protective foods: peaches, pineapples, mangos, pawpaw, oranges, tomatoes, avocado, guavas, bananas, vegetables.',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'One type of food group',
                      name: 'One type of food group'),
                  InputFieldOption(
                      code: 'Two types of food groups',
                      name: 'Two types of food groups'),
                  InputFieldOption(
                      code: 'All types of food groups',
                      name: 'All types of food groups')
                ]),
            InputField(
                id: '',
                name:
                    'Over the past one month, where did you get the food that your family ate?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'wmLRH6610AU', name: 'Bought from the market'),
                  InputFieldOption(code: 'jKDvieE2uqt', name: 'Home grown'),
                  InputFieldOption(
                      code: 'U1CMdc0LPcC', name: 'Given as payment'),
                  InputFieldOption(code: 'NxZ4e9lRTQN', name: 'Donation')
                ]),
            InputField(
                id: '',
                name: 'What type of disability does s/he have?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'iXf2St64o0a', name: 'No disability'),
                  InputFieldOption(code: 'tCWY79n1TVX', name: 'Hearing'),
                  InputFieldOption(code: 'MKjurF1bdM5', name: 'Physical'),
                  InputFieldOption(code: 'vVDAi6u92Vg', name: 'Intellectual'),
                  InputFieldOption(code: 'q1EdZ0EjKTQ', name: 'Speech'),
                  InputFieldOption(code: 'e2RII5ZewNg', name: 'Visual'),
                  InputFieldOption(code: 'W3N2e2SaBCp', name: 'Other')
                ]),
            InputField(
                id: 'jvbE4vFHjA6',
                name: 'Other Specify',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'JcaEaDrtOFj',
                name:
                    'Is the person with disability receiving services for the disability?',
                description: 'If no, refer to health or disability services.',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'ut8LqpHyZnR',
                name:
                    'Do you or anyone have a long-term illness that you would like to share with me',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'TeVmOZEH9ww',
                name: 'If Yes, Who?',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'ut8LqpHyZnR_checkbox',
                name: 'What is the long-term illness that you have?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'WYUkGeSWaZY', name: 'Cancer'),
                  InputFieldOption(code: 'KA3l4V5NDWu', name: 'Epilepsy'),
                  InputFieldOption(code: 'NpxDYjUFlKS', name: 'Mental'),
                  InputFieldOption(code: 'sftyaTdwBKz', name: 'Diabetes'),
                  InputFieldOption(code: 'bEXtDfYHP4B', name: 'Hypertension'),
                  InputFieldOption(code: 'KexFaUmJpt5', name: 'N/A'),
                  InputFieldOption(code: 'gcW6652C8Bt', name: 'Other')
                ]),
            InputField(
                id: 'bmJjZctbkhX',
                name: 'Specify Other',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'AccHyrWqhI0',
                name: 'Are you receiving treatment for this illness?',
                description: 'If no, Refer to appropriate health service',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'w6xeZ47TwwI',
                name: 'If yes, how',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'DoctorOrClinics', name: 'Doctor or Clinics'),
                  InputFieldOption(
                      code: 'Traditional healer', name: 'Traditional healer'),
                  InputFieldOption(
                      code: 'Spiritual healer', name: 'Spiritual healer'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ]),
            InputField(
                id: 'BvNaiaoxc6w',
                name: 'Have you been tested for HIV?',
                description: 'If no refer for testing ',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'Uv26fX0HQvO',
                name: 'If Yes when?',
                description:
                    'If over six months (or their window period) refer for testing ',
                valueType: 'DATE',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'T4grVrCVDkk',
                name:
                    'Would you be willing to share your HIV test result with me?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'vNeOE9abQBB',
                name: 'What is your HIV Status?',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Positive', name: 'Positive'),
                  InputFieldOption(code: 'Negative', name: 'Negative'),
                  InputFieldOption(code: 'Unknown', name: 'Unknown'),
                  InputFieldOption(code: 'No REsponse', name: 'No Response')
                ]),
            InputField(
                id: 'blod3xZ2dPP',
                name: 'Are you currently taking ART to treat HIV?',
                description: 'If no, refer to HIV care and treatment services.',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'ubin7MjQ5OI',
                name: 'If Yes, How long have you been on ART?',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'less than six months',
                      name: 'less than six months'),
                  InputFieldOption(
                      code: 'more than six months',
                      name: 'more than six months'),
                  InputFieldOption(
                      code: 'more than one year', name: 'more than one year'),
                  InputFieldOption(code: 'NA', name: 'NA')
                ]),
            InputField(
                id: 'Icb6vUJXVDX',
                name: 'Do you take your treatments daily and on time?',
                description:
                    'If no or not regularly, refer to HIV care and treatment.',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'Too many side effects',
                      name: 'No, too many side effects'),
                  InputFieldOption(
                      code: 'Treatment not regularly available',
                      name: 'No, treatment is not regularly available'),
                  InputFieldOption(
                      code: 'Someone will find out',
                      name:
                          'No, scared that someone will find out that I? living with HIV'),
                  InputFieldOption(
                      code: 'No, it? hard to remember',
                      name: 'No, it? hard to remember'),
                  InputFieldOption(
                      code: 'I take it on time and regularly',
                      name: 'Yes, I take it on time and regularly'),
                  InputFieldOption(
                      code: 'Yes, but not regularly',
                      name: 'Yes, but not regularly'),
                  InputFieldOption(code: 'Other', name: 'Other'),
                  InputFieldOption(code: 'NA', name: 'NA')
                ]),
            InputField(
                id: 'IiKxc53TdqL',
                name: 'Other, Specify (treatment taking)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'sLyfb45aLkl',
                name: 'Have you ever had a blood test called viral load?',
                description:
                    'If taking ART for over six months and not tested refer to viral load test.',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'aRNGDZcwWmS',
                name: 'What was the result of your viral load test?',
                description:
                    'Note to Case Management Workers, they do not have to know exact numbers just whether it was high, low or undetectable.',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'High (above 1,000 copies/ml)',
                      name: 'High (above 1,000 copies/ml)'),
                  InputFieldOption(
                      code: 'Low (less than 1,000 copies/ml)',
                      name: 'Low (less than 1,000 copies/ml)'),
                  InputFieldOption(code: 'Undetectable', name: 'Undetectable'),
                  InputFieldOption(code: 'Don? know', name: 'Don? know'),
                  InputFieldOption(code: 'NA', name: 'NA')
                ]),
            InputField(
                id: 'KgLtXquRot3',
                name: 'What is the name of the health facility you visit?',
                valueType: 'ORGANISATION_UNIT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: '',
                name: 'Why did you choose this health facility?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'WKT65kLT9AT',
                      name: 'It’s the only place I can get treatment'),
                  InputFieldOption(
                      code: 'QgWzwLkRjul', name: ' It’s easy to access'),
                  InputFieldOption(
                      code: 'I4M6NLNMbG3',
                      name: 'I’m afraid my family will learn my status'),
                  InputFieldOption(
                      code: 'FqLADURlSw6',
                      name:
                          'I’m afraid that my neighbors will discover my status'),
                  InputFieldOption(
                      code: 'NlWEhu1onQW',
                      name:
                          'The doctor at the health facility closest to me doesn’t treat me well'),
                  InputFieldOption(
                      code: 'aUZ2HTFvI4A',
                      name: 'The facility I go to is a good health center'),
                  InputFieldOption(code: 'WUwcEkmhaan', name: 'NA')
                ]),
            InputField(
                id: 'beztnfLGhxi',
                name: 'Other reasons for choosing this facility',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'BYZu8p33lzP',
                name: 'Have you disclosed your status to anyone?',
                description: 'Refer to HIV support services if no',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: 'No Response', name: 'No Response'),
                  InputFieldOption(code: 'NA', name: 'NA')
                ]),
            InputField(
                id: '',
                name: 'To whom have you disclosed your status?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Dl3tIlQxsrd', name: 'My child'),
                  InputFieldOption(code: 'CHuwbETwj8o', name: 'My spouse'),
                  InputFieldOption(
                      code: 'pCHKaQptcwn', name: 'A friend/neighbor'),
                  InputFieldOption(
                      code: 'FqLADURlSw6', name: 'Boyfriend/ girlfriend'),
                  InputFieldOption(
                      code: 'Wfu966TC3M5', name: 'Member of the family'),
                  InputFieldOption(
                      code: 'J5hjKDmiE6a', name: 'Pastor or priest'),
                  InputFieldOption(code: 'HLPSkYfLYlS', name: 'Other'),
                  InputFieldOption(code: 'mSc4D4Ij3KN', name: 'NA')
                ]),
            InputField(
                id: 'I3hI2UTkKyx',
                name: 'Other, Specify (disclosed HIV status to)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'jzmOXiyGGgw',
                name:
                    'Do you feel like people treat you differently because you are HIV positive?',
                description:
                    'Refer to Village Health Workers or Social Workers or psychosocial support.',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: 'No Response', name: 'No Response'),
                  InputFieldOption(code: 'NA', name: 'NA')
                ]),
            InputField(
                id: '',
                name: 'How have you coped with HIV-related stigma?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'QPcCByPcMpz',
                      name: 'I am part of a support group'),
                  InputFieldOption(
                      code: 'klE3cj35whZ',
                      name:
                          'I speak with people who I am close with or my family'),
                  InputFieldOption(
                      code: 'FitzDd4bmS6', name: 'I speak with my doctor'),
                  InputFieldOption(
                      code: 'PXZm9X9pG01',
                      name: 'I speak with my pastor or priest'),
                  InputFieldOption(code: 'XPplaRA9hzd', name: 'I face it all'),
                  InputFieldOption(
                      code: 'zNYrqDOIhGO',
                      name:
                          'I avoid thinking about it because it’s too difficult'),
                  InputFieldOption(
                      code: 'LGhJJz12mWP', name: 'I do not face stigma'),
                  InputFieldOption(code: 'loGTnsw9R9G', name: 'Other'),
                  InputFieldOption(code: 'YT79ydtEOZj', name: 'NA')
                ]),
            InputField(
                id: 'dfdeOt1y7me',
                name: 'Please specify',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'JYPmeC1Zbwf',
                name:
                    'If you have a child or children 10 or over, have you talked to them about how to protect themselves from HIV?',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: 'No Response', name: 'No Response'),
                  InputFieldOption(code: 'NA', name: 'NA')
                ]),
          ]),
      FormSection(
          name: 'Other Household details',
          color: Color(0xFF5B94F0),
          description:
              'Case Management Workers reads: “Assets can also be social. This is because people need connections, support, and relationships in order to be well.”',
          borderColor: Color(0xFF5B94F0),
          inputFields: [
            InputField(
                id: 'Eg1fUXWnFU4',
                name: 'How many people in total make up your household?',
                valueType: 'INTEGER_ZERO_OR_POSITIVE',
                inputColor: Color(0xFF5B94F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'X094f7yANdc',
                name:
                    'Are there any adults who live in this household other than you',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF5B94F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'J8gzZEMnQLX',
                name:
                    'If yes, how many male adult (other than you) live in your household?',
                valueType: 'INTEGER_ZERO_OR_POSITIVE',
                inputColor: Color(0xFF5B94F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'uznwDGvHcie',
                name:
                    'If yes, how many female adult (other than you) live in your household?',
                valueType: 'INTEGER_ZERO_OR_POSITIVE',
                inputColor: Color(0xFF5B94F0),
                labelColor: Color(0xFF1A3518)),
          ]),
      FormSection(
          name: 'DOMAIN SAFE',
          color: Color(0xFF549388),
          description:
              'Case Management Workers reads: “Assets can also be social. This is because people need connections, support, and relationships in order to be well.”',
          borderColor: Color(0xFF549388),
          inputFields: [
            InputField(
                id: 'pLbNeD3Ibqo',
                name:
                    'Is there someone or a group of people in your community that you trust and feel that you can talk to about any problems that you may face?',
                valueType: 'TEXT',
                inputColor: Color(0xFF549388),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: 'No Response', name: 'No Response'),
                  InputFieldOption(code: 'NA', name: 'NA')
                ]),
            InputField(
                id: 'RfFxx08F8V0',
                name:
                    'If you had to leave your house for a few hours, is there someone that you could ask to watch your children?',
                valueType: 'TEXT',
                inputColor: Color(0xFF549388),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: 'No Response', name: 'No Response'),
                  InputFieldOption(code: 'NA', name: 'NA')
                ]),
            InputField(
                id: 'JmLdZM3XYfY',
                name:
                    'In the last six months have you received information on parenting/ child care and development through training, counseling, mentoring, or home visits?',
                valueType: 'TEXT',
                inputColor: Color(0xFF549388),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: 'No Response', name: 'No Response'),
                  InputFieldOption(code: 'NA', name: 'NA')
                ]),
            InputField(
                id: '',
                name:
                    'How did you receive information about parenting and child care?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF549388),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'imTAGRReVhB', name: 'Radio'),
                  InputFieldOption(code: 'kbDUIii7RI9', name: 'Counselling'),
                  InputFieldOption(
                      code: 'LsqmrPHSyPb',
                      name: 'Mentoring from Case Management Workers'),
                  InputFieldOption(code: 'qWU0DW6nlz4', name: 'Care group'),
                  InputFieldOption(code: 'ImXVDwLnvlO', name: 'Training'),
                  InputFieldOption(
                      code: 'SLmCmjszo6f', name: 'Community Meeting'),
                  InputFieldOption(
                      code: 'BERmsstjZyQ',
                      name: 'Health care facility/ Under five clinic'),
                  InputFieldOption(code: 'J1rNgYhLoCS', name: 'Schools'),
                  InputFieldOption(code: 'ajrDVp6cI2k', name: 'Other')
                ]),
            InputField(
                id: 'hiRnasaeK9H',
                name: 'Other:',
                valueType: 'TEXT',
                inputColor: Color(0xFF549388),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'SLajij5j1KI',
                name:
                    'Has anyone in the household experienced any form of violence and abuse in the last 6 months?',
                valueType: 'TEXT',
                inputColor: Color(0xFF549388),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: 'No Response', name: 'No Response'),
                  InputFieldOption(code: 'NA', name: 'NA')
                ]),
            InputField(
                id: 'RxvDeJX3b3k',
                name: 'Did you report this violence?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF549388),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'E4UFvIBBEDk',
                name: 'What kind of support did you receive (if any)?',
                valueType: 'TEXT',
                inputColor: Color(0xFF549388),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'Legal Assistance', name: 'Legal Assistance'),
                  InputFieldOption(
                      code: 'Psychosocial Support',
                      name: 'Psychosocial Support'),
                  InputFieldOption(
                      code: 'Medical services', name: 'Medical services'),
                  InputFieldOption(code: 'Others', name: 'Others'),
                  InputFieldOption(code: 'NA', name: 'NA')
                ]),
            InputField(
                id: 'RWcOcPqBnFj',
                name: 'Other, Specify (kind of support received)',
                valueType: 'TEXT',
                inputColor: Color(0xFF549388),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'zWpm4lCpRxbR',
                name: 'Whom did you receive support from',
                valueType: 'TEXT',
                inputColor: Color(0xFF549388),
                labelColor: Color(0xFF1A3518)),
          ]),
      FormSection(
          name: 'Goals and Actions',
          color: Color(0xFF8836AE),
          description:
              'Case Management Workers reads: “Assets can also be social. This is because people need connections, support, and relationships in order to be well.”',
          borderColor: Color(0xFF8836AE),
          inputFields: [
            InputField(
                id: 'LfzukQDbExn',
                name: 'Goal 1 to improve your relationship with your children',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF8836AE),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'IEWXu1tyGnj',
                name: 'Actions for Goal 1',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF8836AE),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'TLXASUqVT6H',
                name: 'Goal 2 to improve your relationship with your children',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF8836AE),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'mj3S8PG5tra',
                name: 'Actions for Goal 2',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF8836AE),
                labelColor: Color(0xFF1A3518)),
          ])
    ];
  }
}
