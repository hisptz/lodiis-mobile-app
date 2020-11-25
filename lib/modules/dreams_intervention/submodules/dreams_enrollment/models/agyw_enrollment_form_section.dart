import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class AgywEnrollmentFormSection {
  static List<String> getMandatoryField() {
    return [
      'location',
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: 'Enrollment Basic Details',
        color: Color(0xFF258DCC),
        inputFields: [
          InputField(
              id: 'cifBFSTHgv5',
              name: 'Is the AGYW aged 9-24 years old',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'oEbOkfQY3NP',
            name: 'What was used for verification',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Birth Certificate', name: 'Birth Certificate'),
              InputFieldOption(code: 'National ID', name: 'National ID'),
              InputFieldOption(
                  code: 'National ID waiting for the card',
                  name: 'National ID waiting for the card'),
              InputFieldOption(code: 'Other', name: 'Other')
            ],
          ),
          InputField(
              id: 'ODMyZc2F7uc',
              name: 'Other age verification document used',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'fEHah8SvP35',
              name:
                  'Is she currently residing in a community council/ district you are implementing DREAMS?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'uSxDP43mFEG',
              name: 'Which community council and district?',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'x6VFmJLsqgx',
              name:
                  'Has parent/guardian provided consent for the girl to be enrolled in DREAMS?',
              valueType: 'BOOLEAN',
              description: 'Ensure you have documented consent in AGYW file.',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'OmOU8n78dg7',
              name: 'Has the AGYW agreed to be enrolled in DREAMS?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'L1Z7gkuKtbs',
              name: 'Comments/Notes',
              valueType: 'LONG_TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'VJiWumvINR6',
            name: 'Sex',
            valueType: 'TEXT',
            isReadOnly: true,
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Male', name: 'Male'),
              InputFieldOption(code: 'Female', name: 'Female'),
              InputFieldOption(code: 'Transgender (male to female)', name: 'Transgender (male to female)'),
              InputFieldOption(code: 'Transgender (female to male)', name: 'Transgender (female to male)'),
            ],
          ),
          InputField(
              id: 'dQPw7EzqJP6',
              name: 'Land mark near residence',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'Qgy2ZvF0EwJ',
              name: 'DREAMS UIC Number',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'iS9mAp3jDaU',
            name: 'Relationship to Caregiver',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Biological mother', name: 'Biological mother'),
              InputFieldOption(
                  code: 'Biological father', name: 'Biological father'),
              InputFieldOption(code: 'Aunt/Uncle', name: 'Aunt/Uncle'),
              InputFieldOption(code: 'Sibling', name: 'Sibling'),
              InputFieldOption(code: 'Grandparent', name: 'Grandparent')
            ],
          ),
        ],
      ),
      FormSection(
        name: 'Enrollment Module 1:  Individual and Household Information',
        color: Color(0xFF258DCC),
        inputFields: [
          InputField(
            id: 'O7FZEfXR1Ge',
            name: 'Who is the head of your household?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Self', name: 'Self'),
              InputFieldOption(code: 'Father', name: 'Father'),
              InputFieldOption(code: 'Mother', name: 'Mother'),
              InputFieldOption(code: 'Sibling', name: 'Sibling'),
              InputFieldOption(code: 'Uncle or Aunt', name: 'Uncle or Aunt'),
              InputFieldOption(code: 'Grand Parent', name: 'Grand Parent'),
              InputFieldOption(
                  code: 'Husband/Partner', name: 'Husband/Partner'),
              InputFieldOption(code: 'Other', name: 'Other')
            ],
          ),
          InputField(
              id: 'FehkgSKYkaQ',
              name: 'How old is the head of the household?',
              valueType: 'NUMBER',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'cJl00w5DjIL',
            name: 'Is your father alive?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Yes', name: 'Yes'),
              InputFieldOption(code: 'No', name: 'No'),
              InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
            ],
          ),
          InputField(
            id: 'R9e8v9r3lMM',
            name: 'Is your mother alive?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Yes', name: 'Yes'),
              InputFieldOption(code: 'No', name: 'No'),
              InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
            ],
          ),
          InputField(
            id: 'eWbL7tHhp2f',
            name:
                'Are any of your parents/guardians chronically ill (including HIV)?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Yes', name: 'Yes'),
              InputFieldOption(code: 'No', name: 'No'),
              InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
            ],
          ),
          InputField(
            id: 'JmiNCIwfZvh',
            name: 'What is the main material on the floor of your house?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Earth or Mud or Dung or Sand',
                  name: 'Earth or Mud or Dung or Sand'),
              InputFieldOption(
                  code: 'Corrugated iron sheet', name: 'Corrugated iron sheet'),
              InputFieldOption(code: 'Ceramic tiles', name: 'Ceramic tiles'),
              InputFieldOption(code: 'Cement', name: 'Cement'),
              InputFieldOption(code: 'Other', name: 'Other')
            ],
          ),
          InputField(
              id: 'HuGpuXtz673',
              name: 'Specify other type of floor material',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'VWtI5ROqFzd',
            name: 'What is the main material on the roof of your house?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Grass', name: 'Grass'),
              InputFieldOption(
                  code: 'Corrugated iron sheet', name: 'Corrugated iron sheet'),
              InputFieldOption(
                  code: 'Asbestos sheets', name: 'Asbestos sheets'),
              InputFieldOption(code: 'Concrete', name: 'Concrete'),
              InputFieldOption(code: 'Other', name: 'Other')
            ],
          ),
          InputField(
              id: 'Qiuxkrvq5mH',
              name: 'Specify other type of roof material',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'xNx00hrCdWj',
            name: 'What is the main material on the walls of your house?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'No Walls', name: 'No Walls'),
              InputFieldOption(code: 'Dung or Mud', name: 'Dung or Mud'),
              InputFieldOption(code: 'Stone with mud', name: 'Stone with mud'),
              InputFieldOption(
                  code: 'Plywood or Cardboard', name: 'Plywood or Cardboard'),
              InputFieldOption(code: 'Carton', name: 'Carton'),
              InputFieldOption(code: 'Wood', name: 'Wood'),
              InputFieldOption(
                  code: 'Stone or Brick or Cement',
                  name: 'Stone or Brick or Cement'),
              InputFieldOption(code: 'Other', name: 'Other')
            ],
          ),
          InputField(
              id: 'B1lYiAi3AQE',
              name: 'Specify other walls materials of your house',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'ghkM8TrpEHr',
            name:
                'What is the main source of drinking water for members of your household?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Piped water', name: 'Piped water'),
              InputFieldOption(code: 'Open well', name: 'Open well'),
              InputFieldOption(
                  code: 'Covered well or borehole',
                  name: 'Covered well or borehole'),
              InputFieldOption(
                  code: 'Surface water (river, spring, lake)',
                  name: 'Surface water (river, spring, lake)'),
              InputFieldOption(code: 'Rain water', name: 'Rain water'),
              InputFieldOption(code: 'Other', name: 'Other')
            ],
          ),
          InputField(
              id: 'BwlYnY5isNK',
              name: 'Specify other source of drinking water',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'iIdrEpTkpsk',
              name:
                  'In the past 4 weeks, was there any day that you went without food in your household for a full day because of lack of resources?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'ovd3lF6epue',
            name: 'For how many days did this happen in the last 4 weeks?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Rarely', name: 'Rarely'),
              InputFieldOption(code: 'Sometimes', name: 'Sometimes'),
              InputFieldOption(code: 'Often', name: 'Often')
            ],
          ),
          InputField(
              id: 'GGZMeIWhXU9',
              name: 'Do you have any form of disability?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'gyQS55npBZ8',
            name: 'State disability type',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Hearing impairment', name: 'Hearing impairment'),
              InputFieldOption(
                  code: 'Speech impairment', name: 'Speech impairment'),
              InputFieldOption(
                  code: 'Visual impairment', name: 'Visual impairment'),
              InputFieldOption(
                  code: 'Mental impairment', name: 'Mental impairment'),
              InputFieldOption(
                  code: 'Physical impairment', name: 'Physical impairment'),
              InputFieldOption(code: 'Other', name: 'Other')
            ],
          ),
          InputField(
              id: 'A3pHHLPwpyq',
              name: 'Specify other type of disabilities',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'BXUNH6LXeGA',
              name:
                  'Female children below 18 years of age currently living in household',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'kQehaqmaygZ',
              name:
                  'Male children below 18 years of age currently living in household',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'rGAQnszNGVN',
              name:
                  'Female aged 18 years and above currently living in household',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'l9tcZ2TNgx6',
              name:
                  'Male aged 18 years and above currently living in household',
              valueType: 'INTEGER_ZERO_OR_POSITIVE',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'eraVEI3PUF1',
            name: 'Have you ever been enrolled in a cash transfer program',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Yes', name: 'Yes'),
              InputFieldOption(code: 'No', name: 'No'),
              InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
            ],
          ),
          InputField(
            id: 'GG0gYqd3Rdt',
            name: 'Are you currently enrolled in any cash transfer programs?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Yes', name: 'Yes'),
              InputFieldOption(code: 'No', name: 'No'),
              InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
            ],
          ),
          InputField(
              id: 'w780PZTlVhS',
              name:
                  'Which cash transfer programs are you currently enrolled in?',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
        ],
      ),
      FormSection(
        name: 'Enrollment Module 2:  Education & Employment',
        color: Color(0xFF258DCC),
        inputFields: [
          InputField(
              id: 'JTNxMQPT134',
              name: 'Do you currently go to school?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'iQdwzVfZdml',
            name: 'Type of school',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Formal', name: 'Formal'),
              InputFieldOption(code: 'Informal', name: 'Informal')
            ],
          ),
          InputField(
              id: 'J6OTM0c1WCV',
              name: 'What is the name of the school?',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'aPNGd6RCsY9',
            name: 'What level of school are you currently in?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Primary level', name: 'Primary level'),
              InputFieldOption(
                  code: 'Secondary level', name: 'Secondary level'),
              InputFieldOption(code: 'Tertiary level', name: 'Tertiary level'),
              InputFieldOption(
                  code: 'Vocational level', name: 'Vocational level'),
              InputFieldOption(code: 'None', name: 'None'),
              InputFieldOption(code: 'Primary', name: 'Primary'),
              InputFieldOption(code: 'High school', name: 'High school'),
              InputFieldOption(code: 'Tertiary', name: 'Tertiary'),
              InputFieldOption(code: 'Other', name: 'Other')
            ],
          ),
          InputField(
              id: 'T56nYogWRYq',
              name: 'Specify other school level',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'h1HeZ2eEkGn',
              name: 'Which class are you currently enrolled in?',
              valueType: 'NUMBER',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'NGVFqUVSHiU',
              name: 'Which form are you currently enrolled in?',
              valueType: 'NUMBER',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: '',
            name: 'Where do you get support towards your current education?',
            valueType: 'CHECK_BOX',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'omcO1NZi372', name: 'Government bursary'),
              InputFieldOption(code: 'H1eanHofoq8', name: 'NGO'),
              InputFieldOption(
                  code: 'AbgTDPl08pL',
                  name: 'Faith-based institutions (Church, Mosque etc.)'),
              InputFieldOption(
                  code: 'xmdJPtEgGOf',
                  name: 'Relatives (excludes parent/guardian)'),
              InputFieldOption(
                  code: 'yoYYq80SrxC', name: 'None (no additional support)'),
              InputFieldOption(code: 'cr4RA9GGMyf', name: 'Other sources')
            ],
          ),
          InputField(
            id: 'vpmRiwVyKn2',
            name: 'What is the main reason why you are not going to school?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Completed secondary School',
                  name: 'Completed secondary School'),
              InputFieldOption(
                  code: 'Lack of school fees', name: 'Lack of school fees'),
              InputFieldOption(code: 'Pregnancy', name: 'Pregnancy'),
              InputFieldOption(code: 'Peer pressure', name: 'Peer pressure'),
              InputFieldOption(code: 'Not interested', name: 'Not interested'),
              InputFieldOption(
                  code: 'Awaiting to join secondary',
                  name: 'Awaiting to join secondary'),
              InputFieldOption(code: 'Got married', name: 'Got married'),
              InputFieldOption(code: 'Other', name: 'Other')
            ],
          ),
          InputField(
              id: 'JDFx7WfZ0Qi',
              name: 'Specify other reasons not going to school',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'nhI53DrKB7u',
            name: 'When was the last time you went to school?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Less than 6 Months ago',
                  name: 'Less than 6 Months ago'),
              InputFieldOption(
                  code: '6 to 12 months ago', name: '6 to 12 months ago'),
              InputFieldOption(
                  code: '1 to 2 years ago', name: '1 to 2 years ago'),
              InputFieldOption(
                  code: 'More than 2 years ago', name: 'More than 2 years ago'),
              InputFieldOption(
                  code: 'Never attended to school',
                  name: 'Never attended to school')
            ],
          ),
          InputField(
              id: 'BoQ3kawURfW',
              name: 'In what class/ form did you stop schooling?',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: '',
            name: 'Given a chance, what would you wish to do with your life?',
            valueType: 'CHECK_BOX',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'aJuhtxvbLUn', name: 'Pursue a course'),
              InputFieldOption(code: 'CXwRMbOl4s8', name: 'Start a business'),
              InputFieldOption(code: 'b1kQ78GvzNv', name: 'Go back to school'),
              InputFieldOption(code: 'WmneCKqL6hV', name: 'Get married')
            ],
          ),
          InputField(
              id: 'T0PGSSQXFtV',
              name: 'Other things you would do?',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'IH4Ly0VPRtL',
            name: 'What is your current main source of income?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Formally employed', name: 'Formally employed'),
              InputFieldOption(
                  code: 'Business person', name: 'Business person'),
              InputFieldOption(code: 'Casual labour', name: 'Casual labour'),
              InputFieldOption(
                  code: 'Petty trade (hawker etc.)',
                  name: 'Petty trade (hawker etc.)'),
              InputFieldOption(code: 'Farmer', name: 'Farmer'),
              InputFieldOption(
                  code: 'None (I have no source of income)',
                  name: 'None (I have no source of income)'),
              InputFieldOption(
                  code: 'Other age verification document used',
                  name: 'Other age verification document used')
            ],
          ),
          InputField(
              id: 'KFgOeRoncRb',
              name: 'Other source of income',
              valueType: 'LONG_TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'TK4WYUEG5UK',
              name: 'Do you have any savings?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'RiSceJCKIzH',
            name: 'Where do you keep your savings?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'At home', name: 'At home'),
              InputFieldOption(
                  code: 'Saving groups or Stokfel',
                  name: 'Saving groups or Stokfel'),
              InputFieldOption(code: 'In the bank', name: 'In the bank'),
              InputFieldOption(code: 'Other', name: 'Other')
            ],
          ),
          InputField(
              id: 'Gzuxkl4zjrI',
              name: 'Other where you keep your savings',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
        ],
      ),
      FormSection(
        name: 'Enrollment Module 3:  HIV Testing',
        color: Color(0xFF258DCC),
        inputFields: [
          InputField(
              id: 'agg0eUd8Wwo',
              name: 'Have you ever been tested for HIV?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'jT72rsATBtu',
            name: 'When/how long ago was your last HIV test?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Less than 3 months ago',
                  name: 'Less than 3 months ago'),
              InputFieldOption(
                  code: '3 to 5 months ago', name: '3 to 5 months ago'),
              InputFieldOption(
                  code: '6 to 12 months ago', name: '6 to 12 months ago'),
              InputFieldOption(
                  code: 'More than a year ago', name: 'More than a year ago')
            ],
          ),
          InputField(
            id: 'muAZsONb53n',
            name:
                'If you don’t mind telling me, what were the results of your last HIV test?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Positive', name: 'Positive'),
              InputFieldOption(code: 'Negative', name: 'Negative'),
              InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know'),
              InputFieldOption(
                  code: 'Declined to disclose', name: 'Declined to disclose')
            ],
          ),
          InputField(
              id: 'bK3G4mIj2wL',
              name:
                  'Are you currently going to clinic/facility to seek HIV care?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'hmtIvw2mKGc',
              name: 'At which facility are you currently seeking HIV care?',
              valueType: 'ORGANISATION_UNIT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'aQdK3NzB4Xq',
            name:
                'What is the main reason why you are not going to a clinic to seek HIV care?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Facility is too far away',
                  name: 'Facility is too far away'),
              InputFieldOption(
                  code: 'I don’t know where clinic is',
                  name: 'I don’t know where clinic is'),
              InputFieldOption(
                  code: 'I can’t afford it', name: 'I can’t afford it'),
              InputFieldOption(
                  code: 'I feel healthy/not sick',
                  name: 'I feel healthy/not sick'),
              InputFieldOption(
                  code: 'Fear people will know', name: 'Fear people will know'),
              InputFieldOption(
                  code: 'Will be discriminated', name: 'Will be discriminated'),
              InputFieldOption(
                  code: 'Providers at facility are unfriendly',
                  name: 'Providers at facility are unfriendly'),
              InputFieldOption(
                  code: 'Taking alternative medicine',
                  name: 'Taking alternative medicine'),
              InputFieldOption(
                  code: 'Im too busy to go', name: 'Im too busy to go'),
              InputFieldOption(code: 'Other', name: 'Other'),
            ],
          ),
          InputField(
              id: 'NVhWo52VJaZ',
              name: 'Specify other reasons not going to clinic',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'agg0eUd8Wwo_checkbox',
            name: 'Never been tested for HIV because',
            valueType: 'CHECK_BOX',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'ErH33FSpFcQ', name: 'No knowledge about HIV tests'),
              InputFieldOption(
                  code: 'fyDiWTn63jY', name: 'Don’t know where to get one'),
              InputFieldOption(code: 'eHUHUbqwtmc', name: 'Can’t afford it'),
              InputFieldOption(
                  code: 'Obxp92Sd0Eo',
                  name: 'Transport costs to the site are too much'),
              InputFieldOption(
                  code: 'xN6adtem2UD',
                  name: 'Testing facility is too far away'),
              InputFieldOption(
                  code: 'Vk8oBO8z3yD',
                  name: 'Afraid others will know about the test/ test results'),
              InputFieldOption(
                  code: 'hOmGc8b4FRA', name: 'Don’t need to test/ low risk'),
              InputFieldOption(
                  code: 'XWVu7LTxAJZ', name: 'Afraid to know if I have HIV'),
              InputFieldOption(code: 'csebqOXyZZe', name: 'Too busy to go')
            ],
          ),
          InputField(
              id: 'Bf8Wp7c3dJF',
              name: 'Other reason',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'sTbepI08QYq',
              name:
                  'Do you know of a place(s) where people can get tested for HIV?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
        ],
      ),
      FormSection(
        id: 'E_M_4_S_A',
        name: 'Enrollment Module 4:  Sexual Activity',
        color: Color(0xFF258DCC),
        inputFields: [
          InputField(
            id: 'lASgoPYJFDc',
            name:
                'Was your last sexual partner same age, younger or older than you?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Same Age', name: 'Same Age'),
              InputFieldOption(code: 'Younger', name: 'Younger'),
              InputFieldOption(code: 'Older', name: 'Older')
            ],
          ),
          InputField(
            id: 'aiXLkPRWtYb',
            name: 'Was your last sexual partner circumcised?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Yes', name: 'Yes'),
              InputFieldOption(code: 'No', name: 'No'),
              InputFieldOption(code: "Don't Know", name: "Don't Know")
            ],
          ),
          InputField(
              id: 'cVoH1CAuMTb',
              name: 'Do you know your last sexual partner HIV status?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'jnO7z2XOLKv',
            name: 'How often did/do you use a condom with last partner?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Always', name: 'Always'),
              InputFieldOption(code: 'Sometimes', name: 'Sometimes'),
              InputFieldOption(code: "Never", name: "Never")
            ],
          ),
          InputField(
            id: 'QvjdlvdDG7B',
            name:
                'Was your second to last sexual partner same age, younger or older than you?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Same Age', name: 'Same Age'),
              InputFieldOption(code: 'Younger', name: 'Younger'),
              InputFieldOption(code: 'Older', name: 'Older')
            ],
          ),
          InputField(
            id: 'ZJ1O2mAvqwE',
            name: 'Was your second to last sexual partner circumcised?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Yes', name: 'Yes'),
              InputFieldOption(code: 'No', name: 'No'),
              InputFieldOption(code: "Don't Know", name: "Don't Know")
            ],
          ),
          InputField(
              id: 'vaDqnt0gK9y',
              name:
                  'Do you know your second to last sexual partner HIV status?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'Ec5OLY5STtW',
            name:
                'How often did/do you use a condom with second to last partner?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Always', name: 'Always'),
              InputFieldOption(code: 'Sometimes', name: 'Sometimes'),
              InputFieldOption(code: "Never", name: "Never")
            ],
          ),
          InputField(
            id: 'jbKpQbrAoDh',
            name:
                'Was your third last sexual partner same age, younger or older than you?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Same Age', name: 'Same Age'),
              InputFieldOption(code: 'Younger', name: 'Younger'),
              InputFieldOption(code: "Older", name: "Older")
            ],
          ),
          InputField(
            id: 'tO8VP3yEJHq',
            name: 'Was your third to last sexual partner circumcised?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Yes', name: 'Yes'),
              InputFieldOption(code: 'No', name: 'No'),
              InputFieldOption(code: "Don't Know", name: "Don't Know")
            ],
          ),
          InputField(
              id: 'caGPbXZ8ATS',
              name: 'Do you know your third to last sexual partner HIV status?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'bhH17wShRcN',
            name:
                'How often did/do you use a condom with third to last partner?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Always', name: 'Always'),
              InputFieldOption(code: 'Sometimes', name: 'Sometimes'),
              InputFieldOption(code: "Never", name: "Never")
            ],
          ),
          InputField(
              id: 'VaPh0Wesrnh',
              name:
                  'In the last 12 months have you received money, gifts or favours in exchange for sex?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
        ],
      ),
      FormSection(
        name: 'Enrollment Module 5:  Reproductive Health',
        color: Color(0xFF258DCC),
        inputFields: [
          InputField(
              id: 'AHbtSNH0i7C',
              name: 'Do you have biological children?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'RW9VeyKDvjj',
              name: 'How many biological children do you have?',
              valueType: 'NUMBER',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'XYPRtYgQUF8',
            name: 'Are you currently pregnant?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Yes', name: 'Yes'),
              InputFieldOption(code: 'No', name: 'No'),
              InputFieldOption(code: "Don't Know", name: "Don't Know")
            ],
          ),
          InputField(
              id: 'SuB4oeLyzZ0',
              name: 'Are you attending an ANC clinic for this pregnancy?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'GDrEW22l54i',
              name:
                  'Which clinic/facility are you currently seeking ANC services?',
              valueType: 'ORGANISATION_UNIT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'Gs4ArB4ToX5',
              name: 'Are you aware of any family planning methods?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'Gs4ArB4ToX5_checkbox',
            name: 'What family planning methods do you know?',
            valueType: 'CHECK_BOX',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'jIlNVicSnqS', name: 'Pills'),
              InputFieldOption(code: 'L4qhaxocyu4', name: 'Injections'),
              InputFieldOption(code: 'PJHUhZt3YC7', name: 'Implants'),
              InputFieldOption(code: 'iYyKrzKvF9i', name: 'IUCD (Coil)'),
              InputFieldOption(code: 'u4PdP8HWVrs', name: 'Condom'),
              InputFieldOption(
                  code: 'XR1QhO62Zm9', name: 'Permanent (Tubal Ligation)')
            ],
          ),
          InputField(
              id: 'qjFPwTWaHhx',
              name: 'Other family planning method you know',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'sNLZwEeOdZe',
              name:
                  'Are you currently using any modern family planning method?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'NjAdtVA5MCl',
              name: 'Are you currently using Pills family planning method?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'qdK24nEkW3f',
              name:
                  'Are you currently using Injections family planning method?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'kRBlMI2RlqO',
              name: 'Are you currently using Implants family planning method?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'sKIywDycbit',
              name:
                  'Are you currently using IUCD (Coil) family planning method?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'vsfOugPeOqm',
              name: 'Are you currently using condoms family planning method?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'yButAy4UMTY',
              name:
                  'Are you currently using Permanent (Tubal Ligation) family planning method?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'EuH6l8V4sXm',
              name: 'Other family planning methods currently using',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'HyT7FrFWRyH',
              name:
                  'What’s the main reason for not using any family planning method?',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373),
              options: [
                InputFieldOption(
                    code: 'Not sexually active', name: 'Not sexually active'),
                InputFieldOption(
                    code: 'Religious reasons', name: 'Religious reasons'),
                InputFieldOption(code: 'Cannot afford', name: 'Cannot afford'),
                InputFieldOption(
                    code: 'Do not know where to get',
                    name: 'Do not know where to get'),
                InputFieldOption(
                    code: 'Currently pregnant', name: 'Currently pregnant'),
                InputFieldOption(code: 'Other', name: 'Other'),
              ]),
          InputField(
              id: 'pq5LEMAI1EX',
              name:
                  'Specify other reasons for not using family planning methods',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
        ],
      ),
      FormSection(
        name: 'Enrollment Module 6:  Gender-based Violence',
        color: Color(0xFF258DCC),
        inputFields: [
          InputField(
              id: 'i32OwNqUYRn',
              name:
                  'Has any man ever said or did something to humiliate you in front of others?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'ClDEtAAqDPI',
            name:
                'Last three months any man said or did something to humiliate you in front of other?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Often', name: 'Often'),
              InputFieldOption(code: 'sometimes', name: 'Sometimes'),
              InputFieldOption(
                  code: 'Not in the last 3 months',
                  name: 'Not in the last 3 months')
            ],
          ),
          InputField(
              id: 'NgIDtgfZMVH',
              name:
                  'Has any man threatened to hurt or harm you or someone you care about?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'gY0nOLnR3eh',
            name:
                'Last three months any man threatened to hurt or harm you or someone you care about?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Often', name: 'Often'),
              InputFieldOption(code: 'sometimes', name: 'Sometimes'),
              InputFieldOption(
                  code: 'Not in the last 3 months',
                  name: 'Not in the last 3 months')
            ],
          ),
          InputField(
              id: 'KNqzbD65UrN',
              name: 'Any man insulted or made you feel bad about yourself?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'OZqIvrzGBFK',
            name:
                'Last three months any man insulted or made you feel bad about yourself?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Often', name: 'Often'),
              InputFieldOption(code: 'sometimes', name: 'Sometimes'),
              InputFieldOption(
                  code: 'Not in the last 3 months',
                  name: 'Not in the last 3 months')
            ],
          ),
          InputField(
              id: 'Zmt7PefVzk4',
              name: 'Any man threatened to take away your economic livelihood?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'iLX2uQ4ZXM0',
            name:
                'Last three months any man threatened to take away your economic livelihood?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Often', name: 'Often'),
              InputFieldOption(code: 'sometimes', name: 'Sometimes'),
              InputFieldOption(
                  code: 'Not in the last 3 months',
                  name: 'Not in the last 3 months')
            ],
          ),
          InputField(
              id: 'NOJbkKuHccD',
              name:
                  'Any man push you, shake you, slap/punch/beat you, hit you with something, try to choke you or throw something at you that could hurt you?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'GdsRvY5lHCU',
            name:
                'Last three months any man push you, shake you, slap/punch/beat you, hit you with something, try to choke you or throw something at you that could hurt you?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Often', name: 'Often'),
              InputFieldOption(code: 'sometimes', name: 'Sometimes'),
              InputFieldOption(
                  code: 'Not in the last 3 months',
                  name: 'Not in the last 3 months')
            ],
          ),
          InputField(
              id: 'mvPAYFoFQcW',
              name:
                  'Any man physically forced you to have sexual intercourse with him when you did not want to?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'RO2RIidPOqK',
            name:
                'Last three months any man physically forced you to have sexual intercourse with him when you did not want to?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Often', name: 'Often'),
              InputFieldOption(code: 'sometimes', name: 'Sometimes'),
              InputFieldOption(
                  code: 'Not in the last 3 months',
                  name: 'Not in the last 3 months')
            ],
          ),
          InputField(
              id: 'WwTI82dbYIc',
              name:
                  'Any man physically forced you to perform any other sexual acts you did not want to?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'CU4HyDp6XO0',
            name:
                'Last three months any man physically forced you to perform any other sexual acts you did not want to?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Often', name: 'Often'),
              InputFieldOption(code: 'sometimes', name: 'Sometimes'),
              InputFieldOption(
                  code: 'Not in the last 3 months',
                  name: 'Not in the last 3 months')
            ],
          ),
          InputField(
              id: 'bBVCUqsdfL3',
              name:
                  'Any man force you with threats or in any other way to perform sexual acts you did not want to?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'NP7LbypO3li',
            name:
                'Last three months any man force you with threats or in any other way to perform sexual acts you did not want to?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Often', name: 'Often'),
              InputFieldOption(code: 'sometimes', name: 'Sometimes'),
              InputFieldOption(
                  code: 'Not in the last 3 months',
                  name: 'Not in the last 3 months')
            ],
          ),
          InputField(
              id: 'ZcfLYz7JlVo',
              name:
                  'Did you seek help after experiencing the different things we have discussed?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'ZcfLYz7JlVo_checkbox',
            name: 'Where did you seek help from?',
            valueType: 'CHECK_BOX',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'prTJovIPAKu', name: 'My family'),
              InputFieldOption(
                  code: 'ABZxvJiwxzk',
                  name: 'Husband/Partner/Boyfriend’s family'),
              InputFieldOption(code: 'bSV7DYAysFT', name: 'Friend'),
              InputFieldOption(code: 'DzQ8pTNwsoA', name: 'Neighbour'),
              InputFieldOption(code: 'ydSybWoOk93', name: 'Religious leader'),
              InputFieldOption(
                  code: 'U5MaBVRWZTu', name: 'Doctor/Medical personnel'),
              InputFieldOption(
                  code: 'fq9YW2mfHhx', name: 'Chief or village elder'),
              InputFieldOption(code: 'NOZhaj68naE', name: 'Police'),
              InputFieldOption(code: 'YaP6i0e5ksq', name: 'Justice system'),
              InputFieldOption(code: 'OnrjChs6Pzg', name: 'NGO/CBO')
            ],
          ),
          InputField(
              id: 'H2Az2c3MeAy',
              name:
                  'Do you know where to seek help if you experience the different things that we discussed?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'H2Az2c3MeAy_checkbox',
            name:
                'If experienced the different things that we discussed,where would you seek help from?',
            valueType: 'CHECK_BOX',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'GUOZrOkgtxO', name: 'Family'),
              InputFieldOption(
                  code: 'dXKzcRop0YS',
                  name: 'Husband/Partner/Boyfriend’s family'),
              InputFieldOption(code: 'K5NF7rk4RYa', name: 'Friend'),
              InputFieldOption(code: 'u3IjpFje21i', name: 'Neighbour'),
              InputFieldOption(code: 'JWuFSdMrZXy', name: 'Religious leader'),
              InputFieldOption(
                  code: 'oWcT4kzD78y', name: 'Doctor/Medical personnel'),
              InputFieldOption(
                  code: 'zhumM3lBA8J', name: 'Chief or Village elder'),
              InputFieldOption(code: 'k53fDCE7BHI', name: 'Police'),
              InputFieldOption(code: 'COJIywvGzco', name: 'Justice'),
              InputFieldOption(code: 'fJzsO0ADn85', name: 'NGO/CBO')
            ],
          ),
          InputField(
              id: 'OFJD1RNGEZu',
              name: 'Specify other you will seek help from',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
        ],
      ),
      FormSection(
        name: 'Enrollment Module 7:  Non-Prescription Drug Use',
        color: Color(0xFF258DCC),
        inputFields: [
          InputField(
              id: 'QaIUtFdgdIa',
              name: 'Have you used alcohol in the last 12 months?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'JSBixuSLIC5',
            name:
                'In the past 12 months, how often did you have a drink containing alcohol?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Everyday', name: 'Everyday'),
              InputFieldOption(
                  code: '5 to 6 times a week', name: '5 to 6 times a week'),
              InputFieldOption(
                  code: '3 to 4 times a week', name: '3 to 4 times a week'),
              InputFieldOption(code: 'Once a week', name: 'Once a week'),
              InputFieldOption(
                  code: '2 to 3 times a month', name: '2 to 3 times a month'),
              InputFieldOption(code: 'Once a month', name: 'Once a month'),
              InputFieldOption(
                  code: '3 to 11 times in the past year',
                  name: '3 to 11 times in the past year'),
              InputFieldOption(
                  code: '1 or 2 times in the past year',
                  name: '1 or 2 times in the past year')
            ],
          ),
          InputField(
              id: 'o9tReELSzRN',
              name:
                  'Have you used drugs of abuse or addiction in the last 12 months?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'wfb1pQ1odtz',
            name:
                'Which type of drugs of abuse/addiction have you used in the last 12 months?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Marijoana or Matekoane',
                  name: 'Marijoana or Matekoane'),
              InputFieldOption(
                  code: 'Glue or Petrol or Gundi',
                  name: 'Glue or Petrol or Gundi'),
              InputFieldOption(code: 'Cocaine', name: 'Cocaine'),
              InputFieldOption(code: 'Heroin', name: 'Heroin'),
              InputFieldOption(code: 'Mandrax', name: 'Mandrax'),
              InputFieldOption(
                  code: 'Cigarettes or Tobacco', name: 'Cigarettes or Tobacco'),
              InputFieldOption(code: 'Other', name: 'Other')
            ],
          ),
          InputField(
              id: 'YSAyCyGWCaK',
              name:
                  'In the last 12 months have you engaged in brewing or selling alcohol and/or drugs of abuse or addiction?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
        ],
      ),
      FormSection(
          name:
              'Enrollment Module 8:  Participation in HIV Prevention Programme',
          color: Color(0xFF258DCC),
          inputFields: [
            InputField(
                id: 'Hn0P1sGIKe1',
                name:
                    'Have you ever participated or been trained in Go Girls: Sepheo Adopted Curriculum: Married Women?',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'SaAW6b6glDZ',
                name:
                    'Have you ever participated or been trained in Singing to the Lions: A Facilitator\'s Guide to Overcoming Fear and Violence in Our Lives?',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'hGzsAgaBPSY',
                name:
                    'Have you ever participated or been trained in Aflatoun Non Formal Education?',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iFFZOpnvyDp',
                name:
                    'Have you ever participated or been trained in  Financial Education?',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Ue7KBKNtUzO',
                name:
                    'Have you ever participated or been trained in Savings and Internal Lending Communities (SILC)?',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'uEl5YpDbqnb',
                name:
                    'Have you ever participated or been trained in Condom Social Marketing CSM Toolkit (Pusha love)?',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'w4GPtcJq2x9',
                name: 'Comments',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(
          name: 'Enrollment Criteria',
          color: Color(0xFF258DCC),
          inputFields: [
            InputField(
                id: 'B4ojlzKypUF',
                name: 'Is Orphanhood (AGYW 10-17 Yrs)',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HJIHPjOf5s1',
                name: 'Alcohol Use',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                isReadOnly: true,
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'bApA6X6TVvJ',
                name: 'Out of school/Never schooled education/Enrollment',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                isReadOnly: true,
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yc3BlUIEup3',
                name: 'Experience of violence',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                isReadOnly: true,
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'p33MrrhsQRz',
                name: 'Transactional Sex',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                isReadOnly: true,
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iY67qYnywgS',
                name: 'No or Irregular Condom use',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                isReadOnly: true,
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rh881j2vfvT',
                name:
                    'Sexually Transmitted Infection (STI) - (past or present)',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                isReadOnly: true,
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AZCVLPzD0Vd',
                name: 'High number of sex partners',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                isReadOnly: true,
                labelColor: Color(0xFF737373)),
          ])
    ];
  }
}
