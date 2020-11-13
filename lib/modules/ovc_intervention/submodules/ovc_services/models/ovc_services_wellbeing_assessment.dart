import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcServicesWellbeingAssessment {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Role/Impact of a Child to the family',
          color: Color(0xFF4B9F46),
          inputFields: [
            InputField(
                id: 'lt88RMPaBPg',
                name: 'What is the child’s role in the family?',
                description:
                    'For example, do you cook, do housework or make items such as clothes or tools? Do you sell in the market or work outside of the household? Do you take care of other family members?',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: '',
                name: 'What is the child\'s impact to the family?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'm2ghW6ZMUru', name: 'A source of joy'),
                  InputFieldOption(
                      code: 'Ue2Ntq2aGjw', name: 'Household tasks'),
                  InputFieldOption(
                      code: 'DXYwwkKCeWZ',
                      name: 'Take care of the other children'),
                  InputFieldOption(
                      code: 'KiQnuLksmBp', name: 'A source of worry'),
                  InputFieldOption(code: 'vCSvOI0d9M4', name: 'Other')
                ]),
            InputField(
                id: 'NAqMo0LwqZR',
                name: 'Specify other impacts',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: '',
                name: 'How does the child help your family?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'yJKX39H7HBL', name: 'Look after the children'),
                  InputFieldOption(
                      code: 'XqG5ql9rK3T', name: 'Help with house chores'),
                  InputFieldOption(
                      code: 'ccjlPQcsLME', name: 'Work on the farms'),
                  InputFieldOption(
                      code: 'ogY1PpnwIH9', name: 'Collect water and/or wood'),
                  InputFieldOption(
                      code: 'x8QFUzv5ZnD', name: 'Take care of animals'),
                  InputFieldOption(
                      code: 'MUuevTfdTqb',
                      name: 'Provide food & other household items'),
                  InputFieldOption(
                      code: 'hX5lO8etDXx', name: 'Earn extra money'),
                  InputFieldOption(code: 'TH3xvl6NZhi', name: 'Other')
                ]),
            InputField(
                id: 'wOlSzC2ovZN',
                name: 'Specify other activities',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          name: 'DOMAIN SCHOOLED',
          color: Color(0xFF9B2BAE),
          borderColor: Color(0xFF9B2BAE),
          inputFields: [
            InputField(
                id: 'DaVKi2U248S',
                name: 'Is the child currently enrolled in school?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'TWvKsmKyCSc',
                name:
                    'Are you currently enrolled in school or a vocation program?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'DaVKi2U248S_checkbox',
                name: 'Record why the child is not enrolled in school',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227),
                options: [
                  InputFieldOption(code: 'fcWZ0cctQlO', name: 'Sick/Fever'),
                  InputFieldOption(code: 'nbLQCi1YrvU', name: 'Exhaustion'),
                  InputFieldOption(code: 'JMGxn39tjoh', name: 'Housework'),
                  InputFieldOption(
                      code: 'qPt9jvB5ACh',
                      name: 'Fear of the school or other children at school'),
                  InputFieldOption(
                      code: 'giEyqjovyAp', name: 'Fear of the walk to school'),
                  InputFieldOption(
                      code: 'Q5MH7cmdlhT',
                      name: 'Inability to pay school fees'),
                  InputFieldOption(
                      code: 'WIrF2dIAkqD',
                      name: 'Inability to pay for school materials'),
                  InputFieldOption(code: 'kamr81y5WJs', name: 'Other reason')
                ]),
            InputField(
                id: 'wZ6HnbTdfDg',
                name:
                    'Specify other reason why the child is not enrolled in school',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'emR9ocfi1Vm',
                name: 'Has the OVC ever been enrolled in school?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'cv8RKCPOOAo',
                name: 'Which one you are enrolled in?',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227),
                options: [
                  InputFieldOption(code: 'School', name: 'School'),
                  InputFieldOption(
                      code: 'Vocational Training', name: 'Vocational Training'),
                ]),
            InputField(
                id: 'xYdWjIv5eup',
                name: 'What level of education is the child in now?',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227),
                options: [
                  InputFieldOption(code: 'Primary', name: 'Primary'),
                  InputFieldOption(code: 'Secondary', name: 'Secondary')
                ]),
            InputField(
                id: 'BvEsLzWsL3Z',
                name: 'What level of education are you now?',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227),
                options: [
                  InputFieldOption(code: 'Primary', name: 'Primary'),
                  InputFieldOption(
                      code: 'Secondary/High level',
                      name: 'Secondary/High level'),
                  InputFieldOption(code: 'College', name: 'College')
                ]),
            InputField(
                id: 'TRuxsvRahqm',
                name: 'What grade?',
                valueType: 'NUMBER',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'pczeYqyA3Bj',
                name: 'What form?',
                valueType: 'NUMBER',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'IUdOAhmhqj1',
                name: 'What year?',
                valueType: 'NUMBER',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'M3AaNTqC9d6',
                name: 'What level of education was the child last year?',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227),
                options: [
                  InputFieldOption(code: 'Primary', name: 'Primary'),
                  InputFieldOption(
                      code: 'Secondary/High level',
                      name: 'Secondary/High level'),
                  InputFieldOption(code: 'College', name: 'College')
                ]),
            InputField(
                id: 'KlbW2l1L1NC',
                name: 'What level of education where you last year?',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227),
                options: [
                  InputFieldOption(
                    code: 'Primary', 
                    name: 'Primary'),
                  InputFieldOption(
                      code: 'Secondary/High level',
                      name: 'Secondary/High level'),
                  InputFieldOption(
                    code: 'College',
                     name: 'College')
                ]),
            InputField(
                id: 'xbAukRUBixJ',
                name: 'What grade was the child in last year?',
                valueType: 'NUMBER',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'SGCjKsX1Mzl',
                name: 'What form was the child in last year?',
                valueType: 'NUMBER',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'dwJns2uXUcG',
                name: 'What program are you studying?',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'tnaSD0CNrHH',
                name: 'What is your graduation year?',
                valueType: 'NUMBER',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'mozNkqqfYRp',
                name: 'Was the child enrolled during the last month ?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'YKuTfp8LIRr',
                name: 'Should be did the child miss more than three school days?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: '',
                name: 'Did the child miss more than three days for any reason?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227),
                options: [
                  InputFieldOption(
                      code: 'tY54kDbZs3F', name: 'Fear of the teacher'),
                  InputFieldOption(
                      code: 'lelE0w4yZE0', name: 'Fear of the other children'),
                  InputFieldOption(
                      code: 'bzfp3ELtR1x', name: 'Lack of school materials'),
                  InputFieldOption(code: 'zKlVUGOqumX', name: 'Illness'),
                  InputFieldOption(code: 'OyloI2gUb2p', name: 'Other reason')
                ]),
            InputField(
                id: 'Ey6WeeJVCI7',
                name: 'Specify other reason',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'ot2CtK0hAHo',
                name:
                    'During the last month,did you miss more than three school/vocational training days?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'VMP6xJWkWHK',
                name:
                    'Reasons for missing more than 3 days of school/vocational training',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'vmvnozO37i7',
                name: 'Does the child like to go to school?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'mtZfZIAkVjt',
                name: 'Do you like going to school or vocational training?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227)),
            InputField(
                id: 'mtZfZIAkVjt_checkbox',
                name: 'Reasons why a child does not like going to school',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227),
                options: [
                  InputFieldOption(
                      code: 'qK6pCo37tWW', name: 'Fear of the teacher'),
                  InputFieldOption(
                      code: 'Tbga457Gs8B', name: 'Fear of other children'),
                  InputFieldOption(
                      code: 'AYqiBBgPBsR', name: 'Lack of school material'),
                  InputFieldOption(code: 'I42XGV43sC7', name: 'Illness'),
                  InputFieldOption(code: 'F8cC7TI5t9b', name: 'Other reason')
                ]),
            InputField(
                id: 'MNYYB8orI36',
                name: 'Specify other reason',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF284227))
          ]),
      FormSection(
          name: 'DOMAIN STABLE',
          color: Color(0xFF4D9E49),
          borderColor: Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'OBugEkynJG0',
                name: 'Are there any signs of malnutrition?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF455B44)),
            InputField(
                id: 'OBugEkynJG0_checkbox',
                name: 'Signs of malnutrition',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF455B44),
                options: [
                  InputFieldOption(
                      code: 'UHMtTnEP9Yh', name: 'Emaciated and dry skin'),
                  InputFieldOption(code: 'JuHzVswoDKw', name: 'Dry hair'),
                  InputFieldOption(code: 'G5EFtvf5qcF', name: 'Not playing'),
                  InputFieldOption(
                      code: 'g8j8aNxz7lh', name: 'Extremely thirsty'),
                  InputFieldOption(
                      code: 'W9bFXNhcWHN', name: 'Wounds not healing'),
                  InputFieldOption(
                      code: 'B7i1JLk1GIk', name: 'Swollen face and legs'),
                  InputFieldOption(
                      code: 'SSUQsWk0JiA', name: 'Red-orange colored hair'),
                  InputFieldOption(code: 'FmJ0mLOhMSd', name: 'Other signs')
                ]),
            InputField(
                id: 'xQjn7WKtJvm',
                name: 'Specify signs of mulnutrition',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF455B44)),
            InputField(
                id: 'aaERjQ9jSZn',
                name:
                    'In the past month, has the child ever gone to be hungry?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF455B44)),
            InputField(
                id: 'MEmFZrOhvb3',
                name:
                    'In the past month have you ever gone a whole day or night without eating anything at all because there was not enough food?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF455B44)),
            InputField(
                id: 'cGJa4gfVPQ7',
                name: 'How often would you say this happens?',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF455B44),
                options: [
                  InputFieldOption(code: 'Every night', name: 'Every night'),
                  InputFieldOption(
                      code: 'A few nights per week',
                      name: 'A few nights per week'),
                  InputFieldOption(
                      code: 'A few nights per month',
                      name: 'A few nights per month')
                ]),
            InputField(
                id: 'dTiDozleQuO',
                name:
                    'During the past month, did the child receive nutritional supplements?',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF455B44),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(
                      code: 'I don\'t know', name: 'I don\'t know'),
                  InputFieldOption(code: 'No response', name: 'No response'),
                  InputFieldOption(code: 'Refuse', name: 'Refuse')
                ]),
            InputField(
                id: '',
                name: 'Nutritional supplements received',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF455B44),
                options: [
                  InputFieldOption(
                      code: 'sGmUf0A8OG3', name: 'Iron supplement'),
                  InputFieldOption(code: 'DUOFvJnn1R7', name: 'Vitamin A'),
                  InputFieldOption(code: 'gE1zlNMfA1r', name: 'Con Soya'),
                  InputFieldOption(
                      code: 'kqDD44PTEiq',
                      name: 'Therapeutic nutrition (Plumpy Nut)'),
                  InputFieldOption(code: 'Ca0n8YbBSeG', name: 'Food Packages.'),
                  InputFieldOption(code: 'INGfPNUjHxP', name: 'Other')
                ])
          ]),
      FormSection(
          name: 'DOMAIN HEALTH',
          color: Color(0xFF2895F0),
          borderColor: Color(0xFF2895F0),
          inputFields: [
            InputField(
                id: 'H84JX4fQWsK',
                name:
                    'In the last month, has the child been too sick or too tired to participate in daily activities?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
                ]),
            InputField(
                id: 'AcAWUuDae0A',
                name:
                    'In the last month, have you gone more than three days when you were too sick or too tired to participate in daily activities?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'ETI9FukQuNo',
                name:
                    'The last time that you were sick, were you taken to the doctor or the hospital?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'Vc7Q23oTNhu',
                name:
                    'OVC has an illness or disability that you would like to share with me?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'qI9a8II1g54',
                name: 'List illness or disability',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'ToOqcUP9338',
                name: 'What kind of illness?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'TQGFUJ7MTPu',
                name:
                    'Is the OVC currently receiving treatment for the illness or disability?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'lz56QGytZkD',
                name:
                    'What kind of services or treatment does the child receive?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'lxF2SNfIGa0',
                name: 'From whom does the child receive these services?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'YZ9ORZBKzHk',
                name: 'From whom do you receive treatment for your illness?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'RC28ZyOhzUQ',
                name: 'Do you have any disability?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'RC28ZyOhzUQ_checkbox',
                name: 'Which disability do you have?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'rVAImAgvrYe', name: 'Hearing disiability'),
                  InputFieldOption(
                      code: 'br8TVOKf1ZI', name: 'Speech disability'),
                  InputFieldOption(
                      code: 'DExMWJ61fKp', name: 'Physical disability'),
                  InputFieldOption(
                      code: 'LJO2Ar9YytV', name: 'Visual disability'),
                  InputFieldOption(
                      code: 'e1KcALoo1ZJ', name: 'Intellectual disability'),
                  InputFieldOption(code: 'YRWFyAhfhRP', name: 'Other')
                ]),
            InputField(
                id: 'YQVQRnN30O6',
                name: 'Specify other disability',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'puLHlflNeg6',
                name: 'Do you know child’s HIV status?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'uMwExnG6Flk',
                name: 'Have you ever heard talk of HIV?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'wO2o2ZqG65D',
                name: 'Where did you hear about HIV?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'ef1ixon3YBh',
                name: 'OVC ever been tested for HIV?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'J4ozQS4koE8',
                name: 'When were you tested?',
                valueType: 'DATE',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'o2XWRHW5zwb',
                name: 'Do you know the results of your test?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'eSJhbqT1NQb',
                name: 'Latest HIV test result?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Positive', name: 'Positive'),
                  InputFieldOption(code: 'Negative', name: 'Negative'),
                  InputFieldOption(code: 'Unknown', name: 'Unknown'),
                  InputFieldOption(code: 'No Response', name: 'No Response')
                ]),
            InputField(
                id: 'c5TMWtM4VVJ',
                name: 'Could you share the results of the test with me?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Positive', name: 'Positive'),
                  InputFieldOption(code: 'Negative', name: 'Negative'),
                  InputFieldOption(
                      code: 'No disclosure', name: 'No disclosure'),
                ]),
            InputField(
                id: 'c5TMWtM4VVJ',
                name: 'Could you share the results of the test with me?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'bgJkdPrTnbg',
                name: 'How did you find out about your HIV status?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'Service Provider', name: 'Service Provider'),
                  InputFieldOption(
                      code: 'Mother/Father', name: 'Mother/Father'),
                  InputFieldOption(
                      code: 'Other adult in the family',
                      name: 'Other adult in the family'),
                  InputFieldOption(code: 'Sibling', name: 'Sibling'),
                  InputFieldOption(code: 'Friend', name: 'Friend'),
                  InputFieldOption(code: 'Neighbors', name: 'Neighbors'),
                  InputFieldOption(code: 'Teacher', name: 'Teacher'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ]),
            InputField(
                id: 'Z51O61hlZMR',
                name: 'Specify other ways you found out about your HIV status',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'kqQ3MMTTO2t',
                name: 'How old were you the first time you heard this news?',
                valueType: 'NUMBER',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'pU5ywj3cjSA',
                name: 'Do you take medication for HIV?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'HXk5d3kxy37',
                name: 'Do you have problems taking your treatment?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'ndK4JCMORL0',
                name: 'How do you cope with those challenges?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'wv3YAGLZlev',
                name: 'Which health facility do you visit?',
                valueType: 'ORGANISATION_UNIT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'Tr5lrn4ctTN',
                name:
                    'Who in your household or your life knows about your HIV status?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Mother', name: 'Mother'),
                  InputFieldOption(code: 'Father', name: 'Father'),
                  InputFieldOption(
                      code: 'Other caregiver', name: 'Other caregiver'),
                  InputFieldOption(code: 'Sibling', name: 'Sibling'),
                  InputFieldOption(code: 'Teacher', name: 'Teacher'),
                  InputFieldOption(code: 'Friend', name: 'Friend'),
                  InputFieldOption(code: 'Neighbor', name: 'Neighbor'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ]),
            InputField(
                id: 'YTa10rE1vtd',
                name: 'Specify other people know about your HIV status',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'wi6Iq4yVdXV',
                name: 'What is their attitude towards you?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'Discriminates', name: 'Discriminates'),
                  InputFieldOption(code: 'Stigmatizes', name: 'Stigmatizes'),
                  InputFieldOption(code: 'Encouraging', name: 'Encouraging'),
                  InputFieldOption(code: 'Supporting', name: 'Supporting')
                ]),
            InputField(
                id: 'gPSf6k0BcWE',
                name:
                    'Do you know anyone that is living with HIV in your household?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'sHUjPZTqpy2',
                name: 'Is the child currently on ART?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(
                      code: 'I don\'t know', name: 'I don\'t know'),
                  InputFieldOption(code: 'No response', name: 'No response'),
                  InputFieldOption(code: 'Refuse', name: 'Refuse')
                ]),
            InputField(
                id: 'VFLlpMdPCTX',
                name: 'Which health clinic do you take the child?',
                valueType: 'ORGANISATION_UNIT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: '',
                name: 'Why do you take the child in that health facility?',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'FeL9c9Grwlx',
                      name:
                          'It’s the only place where child treatment is offered'),
                  InputFieldOption(
                      code: 'rh90PSJE7fD',
                      name: 'It’s the same place where I go for services'),
                  InputFieldOption(
                      code: 'CkbKlcJCkLE',
                      name: 'There’s a good doctor at this clinic'),
                  InputFieldOption(
                      code: 'zcKvVCd6d0c',
                      name:
                          'I’m afraid that my family will learn the status of my child'),
                  InputFieldOption(
                      code: 'sdQt641yVBS',
                      name:
                          'I’m afraid that my neighbors will learn the status of my child'),
                  InputFieldOption(
                      code: 'sbgsFW299ND',
                      name:
                          'The doctor at the clinic near us doesn’t treat us well')
                ]),
            InputField(
                id: 'iZGQ4iWkWNu',
                name: 'Has the child’s status been shared with the child?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'f2GIuwu1LGh',
                name: 'What was their response?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'Positive/neutral reaction',
                      name: 'Positive/neutral reaction'),
                  InputFieldOption(
                      code: 'Experienced denial,but is ok now',
                      name: 'Experienced denial,but is ok now'),
                  InputFieldOption(
                      code: 'Angry, sad or depressed,but is ok now',
                      name: 'Angry, sad or depressed,but is ok now'),
                  InputFieldOption(
                      code:
                          'Still dealing with denial,anger,sadness/depression',
                      name:
                          'Still dealing with denial,anger,sadness/depression'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ]),
            InputField(
                id: 'DrPdwo3pKfN',
                name: 'Specify other response',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'EYb2XmgHt58',
                name: 'Why was the status not shared with the child?',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'They are too young', name: 'They are too young'),
                  InputFieldOption(
                      code: 'Worried about child experiencing stigma',
                      name: 'Worried about child experiencing stigma'),
                  InputFieldOption(
                      code: 'Worried about child having a -ve response',
                      name: 'Worried about child having a -ve response'),
                  InputFieldOption(
                      code: 'Worried about parent/family experiencing stigma',
                      name: 'Worried about parent/family experiencing stigma'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ]),
            InputField(
                id: 'RAlqa0C6PN7',
                name: 'Specify other response',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'kcG670LJt3J',
                name:
                    'Has the status of the child been disclosed to any family members?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'gAzb8e8cLga',
                name: 'Family response to child HIV status disclosure to them',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'Neutral/ no reaction',
                      name: 'Neutral/ no reaction'),
                  InputFieldOption(
                      code: 'Rejected the child', name: 'Rejected the child'),
                  InputFieldOption(code: 'Other, specify', name: 'other'),
                ]),
            InputField(
                id: 'oJVaLuSykXO',
                name: 'Specify other response',
                valueType: 'TEXT',
                inputColor: Color(0xFF2895F0),
                labelColor: Color(0xFF1A3518)),
          ]),
      FormSection(
          name: 'DOMAIN SAFE',
          color: Color(0xFFEE6E21),
          borderColor: Color(0xFFEE6E21),
          inputFields: [
            InputField(
                id: 'zjjAVMVuvxe',
                name: 'Has the child ever experienced violence?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'wP7nZkrJIlp',
                name:
                    'Did the child receive or is currently receiving services to help with the abuse problem?',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: 'I don\'t know', name: 'I don\t know'),
                  InputFieldOption(code: 'No response', name: 'No response')
                ]),
            InputField(
                id: 'M0lo7wANrwN',
                name:
                    'Does the child feel that the abuse problem has been resolved?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'jxOMACHmXXO',
                name: 'From whom?',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'D1ebTZQurSL',
                name:
                    'How often do you engage with the child by talking, telling stories, singing, playing, assisting with school work?',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'All the time', name: 'All the time'),
                  InputFieldOption(code: 'Often', name: 'Often'),
                  InputFieldOption(code: 'Sometimes', name: 'Sometimes'),
                  InputFieldOption(code: 'Rarely', name: 'Rarely'),
                  InputFieldOption(code: 'Never', name: 'Never')
                ]),
            InputField(
                id: 'hidZMdXFxvR',
                name: 'Who else would you say the child is close to?',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Grandfather', name: 'Grandfather'),
                  InputFieldOption(code: 'Grandmother', name: 'Grandmother'),
                  InputFieldOption(code: 'Uncle', name: 'Uncle'),
                  InputFieldOption(code: 'Aunt', name: 'Aunt'),
                  InputFieldOption(code: 'Sibling', name: 'Sibling'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ]),
            InputField(
                id: 'p82MlDNDGxs',
                name: 'Specify other person close to the child',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'XG1a90T7iBF',
                name: 'Does the child have a birth certificate?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'iQcx8GPINN0',
                name:
                    'How often does this child play with other friends and family members?',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'All the time', name: 'All the time'),
                  InputFieldOption(code: 'Often', name: 'Often'),
                  InputFieldOption(code: 'Sometimes', name: 'Sometimes'),
                  InputFieldOption(code: 'Rarely', name: 'Rarely'),
                  InputFieldOption(code: 'Never', name: 'Never')
                ]),
            InputField(
                id: 'RykOGTu3wcd',
                name:
                    'Has anyone ever beaten/slapped/spanked or hit the child with a belt, a stick or something hard?',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: 'No response', name: 'No response')
                ]),
            InputField(
                id: 'iUO02DiUftg',
                name:
                    'How often has someone beaten/slapped/spanked the child, or hit them with a belt, a stick or something hard?',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'Almost everyday', name: 'Almost everyday'),
                  InputFieldOption(
                      code: 'Once in a while', name: 'Once in a while'),
                  InputFieldOption(
                      code: 'Long time ago', name: 'Long time ago'),
                  InputFieldOption(code: 'No response', name: 'No response')
                ]),
            InputField(
                id: 'HqNP6ovZw3p',
                name:
                    'Was the child ever left with bruises, burns, broken bones or teeth, or other injury?',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: 'No response', name: 'No response')
                ]),
            InputField(
                id: 'fe0pgVexVbx',
                name:
                    'Did the child receive or is currently receiving services to help with this problem?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'kslj60leTJf',
                name:
                    'Is there someone in the household /neighbourhood who is or has behaved inappropriately with the child?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'LjhWZuKCIJu',
                name: 'Who has behaved inappropriately with the child?',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'gdooctJzx2o',
                name:
                    'Would you say that your caregiver listens when you talk to him/her?',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'Almost everyday', name: 'Almost everyday'),
                  InputFieldOption(
                      code: 'Once in a while', name: 'Once in a while'),
                  InputFieldOption(
                      code: 'Long time ago', name: 'Long time ago'),
                  InputFieldOption(code: 'No response', name: 'No response')
                ]),
            InputField(
                id: 't1VRnFuBb7I',
                name:
                    'Are you receiving any child or social protection support?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 't1VRnFuBb7I_checkbox',
                name: 'Child or social protection support received',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: 'seiWBkesnnc', name: 'Social Grant'),
                  InputFieldOption(
                      code: 'pQ4cUirRxqK', name: 'Public Assistance'),
                  InputFieldOption(
                      code: 'GI0cqcBMSUV', name: 'School Bursaries'),
                  InputFieldOption(code: 'MMOeHPgpVj5', name: 'Food Packages'),
                  InputFieldOption(code: 'CmJLjd2HxD7', name: 'Other'),
                ]),
            InputField(
                id: 'nLoEbs7cRIu',
                name: 'Specify which public Assistance',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'LU0OIdYmV7K',
                name: 'Specify other child or social supports',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'ahAIJZ9IkCV',
                name:
                    'Are you comfortable to seek help and advice with problems (emotional) and he/she will help to solve them?',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518),
                options: [
                  InputFieldOption(
                      code: 'Almost everyday', name: 'Almost everyday'),
                  InputFieldOption(
                      code: 'Once in a while', name: 'Once in a while'),
                  InputFieldOption(
                      code: 'Long time ago', name: 'Long time ago'),
                  InputFieldOption(code: 'No response', name: 'No response')
                ]),
            InputField(
                id: 'MxioydJaOgX',
                name:
                    'Do you feel like your opinion is heard about you and your life?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'ebeAKSCVsYo',
                name: 'Can you cope in difficult situations?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'XXHMvERCGLn',
                name: 'Why can\'t you cope in difficult situations?',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'MlcK6DAGoCx',
                name:
                    'Do you have friends that are older than you who buy or give you gifts?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'W91GgtMqWnl',
                name:
                    'Do you feel pressure to do anything in exchange for the gifts?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518)),
            InputField(
                id: 'sM8amXv7Nck',
                name: 'Who helped with child abuse problem?',
                valueType: 'TEXT',
                inputColor: Color(0xFFEE6E22),
                labelColor: Color(0xFF1A3518))
          ]),
      FormSection(
          name: 'GOALS',
          description:
              'Caseworker reads: “Now I’m going to ask you some questions about how you would like to grow and improve over the next year.”',
          color: Color(0xFF1B3519),
          inputFields: [
            InputField(
                id: 'ADc3clrQRl4',
                name: 'Goal 1',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WmnbKX3Vj05',
                allowFuturePeriod: true,
                name: 'Timeline for goal 1',
                valueType: 'DATE',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rEIhH5N4z0e',
                name: 'Actions need to take place to accomplish goal 1',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'efNgDIqhlNs',
                name: 'Goal 2',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cbxJhkrHUtk',
                allowFuturePeriod: true,
                name: 'Timeline for goal 2',
                valueType: 'DATE',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iDkUpkg6vO6',
                name: 'Actions need to take place to accomplish goal 2',
                valueType: 'LONG_TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373))
          ]),
    ];
  }
}
