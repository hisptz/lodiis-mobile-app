import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamsServicePrepIntakeInfo {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'HTS CLIENT INTAKE RECORD',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'lQ8XDsy6M6y',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Site Name',
                valueType: 'TEXT'),
            InputField(
                id: 'V83BlJrXSiv',
                name: 'Counselor Name',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                valueType: 'TEXT'),
            InputField(
              id: 'gm4R68f8gqr',
              name: 'Client Type',
              valueType: 'TEXT',
              inputColor: Color(0xFF1F8ECE),
              labelColor: Color(0xFF737373),
              options: [
                  InputFieldOption(code: 'F', name: 'F'),
                  InputFieldOption(code: 'M', name: 'M'),
                  InputFieldOption(code: 'CF', name: 'CF'),
                  InputFieldOption(code: 'CM', name: 'CM'),               
                ]),

            InputField(
                id: 'Jhp451oeYyB',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Is it a couple?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'p9AA21uFn2n',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: "Partner's name",
                valueType: 'TEXT'),
            InputField(
                id: 'Y0QGNDBCEbz',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: "Partner's date of birth",
                valueType: 'DATE'),
            InputField(
                id: 'wiPJ5G01Vq9',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Service Type',
                valueType: 'TEXT',
                options: [
                  InputFieldOption(code: 'CounselingTesting', name: 'CounselingTesting'),
                  InputFieldOption(code: 'Counseling only', name: 'Counseling only'),
                  InputFieldOption(code: 'Testing only', name: 'Testing only'),           
                ]),
            InputField(
                id: 'li1EJgHzWtV',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Marital Status',
                valueType: 'TEXT',
                options: [
                  InputFieldOption(code: 'Married', name: 'Married'),
                  InputFieldOption(code: 'Single', name: 'Single'),
                  InputFieldOption(code: 'Widowed', name: 'Widowed'),
                  InputFieldOption(code: 'Divorced/separated', name: 'Divorced/separated'),
                  InputFieldOption(code: 'Cohabiting', name: 'Cohabiting (leaving with a partner)'),           
                ]                
                ),
            InputField(
                id: 'GrChAWBTqTc',
                name: 'Specify marital status',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                valueType: 'TEXT'),
            InputField(
              id: 'wg10XmeTFSq',
              name: 'Number of children under 16 years',
              valueType: 'NUMBER',
              inputColor: Color(0xFF1F8ECE),
              labelColor: Color(0xFF737373),
            ),
            InputField(
                id: 'KE2KOYQCY8t',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Are you or your partner currently breastfeeding?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'FN1zuu5rCHI',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                ],
                name:
                    'Are you or your partner planning to have a child within next 2 years?',
                valueType: 'TEXT'),
            InputField(
                id: 'rUyb2ilJl5y',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Unemployed?',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'QdIAXIslH75',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Student?',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'bfMzA5x69SZ',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Farmer/Farm worker?',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'DKmXqOp3oYc',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Domestic worker/gardener',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'TOSx4VyOZQT',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Guard',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'GPYuQ42sg3T',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Professional',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'RFa3D2oM8aQ',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Informal Trader ',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'Y2VpdgQ2iEK',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Military/Uniformed',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'POgKhlepadZ',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Trucker/Truck driver',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'STrVefsqTij',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Commercial Sex Worker',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'b8ZaGIN11vv',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Mine worker',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'JflxahjBLrH',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Other occupation(sp)',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'PqSjDmu2eMy',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Specify other occupation',
                valueType: 'TEXT',          
                ),
            InputField(
                id: 'D26taDdz4YO',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Highest level of Education Attained',
                valueType: 'TRUE_ONLY',
                 options:[
                  InputFieldOption(code: 'None', name: 'None'),
                  InputFieldOption(code: 'Less than Standard 7', name: 'Less than Standard 7'),
                  InputFieldOption(code: 'Secondary School', name: 'Secondary School'),
                  InputFieldOption(code: 'High School', name: 'High School'),
                  InputFieldOption(code: 'College Certificate/Diploma', name: 'College CertificateDiploma'),
                  InputFieldOption(code: 'University Degree', name: 'University Degree'),
                  InputFieldOption(code: 'Graduate Degree (Masters/PhD)', name: 'Graduate DegreeMastersPhD'),
                         ],
                ),
            InputField(
                id: 'XfiDt4DzdVS',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Visited the site because I Have a child who is sick or died.',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 's5NmD81MGOc',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Visited the site because my Partner died.',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'qA5e24CNBrw',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Visited the site because I Worried about my past behaviour/curious',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'eNGTWMYAFL0',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Visited the site because I  Worried abut my partner? behaviour/status',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'jcWYjzUCG6S',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Visited the site because my Partner is sick',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'zTC4EV7XTj5',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Visited the site because my Partner has tested positive for HIV.',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'aN6VHxj82GQ',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Visited the site because I am feeling unwell',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'JFqUJNUzTww',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Visited the site because I was Advised by my family/friends',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'KaAWXJVHDVz',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Visited the site because I was Advised by health care worker',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'xzpOED9PyVh',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Visited the site because I am Planning to get married.',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'RU9VC5xsNf5',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Visited the site because I am Getting serious/stopping condoms',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'zscz5KYlCS5',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Visited the site because I am Planning to have a baby',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'yjnuJxlFmIm',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Visited the site Because I am pregnant',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'n1YU4oiRqyY',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Visited the site because my Partner requested',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'ijbtN1BP4A2',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Visited the site For life insurance',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'DXwITugq1X6',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Visited the site For scholarship/studies',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'T92Q2Irzmgj',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Visited the site For travel/visa',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'D5dyOe7GJpp',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Visited the site because I am Retesting (Closing the window)',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'RDDWIVvUOQZ',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Visited the site because I am Retesting (Confirmation of HIV positive)',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'ukX9y6lXpNo',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Other reason for visiting the site',
                valueType: 'TEXT'),
            InputField(
                id: 'onf8hoBn6xO',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'I learnt of this center through a Friend',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'qRmcFUHrKJG',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'I learnt of this center through a Partner/Spouse',
                valueType: 'TRUE_ONLY',                           
                ),
            InputField(
                id: 'ADLCht0KPSh',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'I learnt of this center through Other Family Member',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'p6Xwp6okdfN',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'I learnt of this center through Other HTC client',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'APJcg5JKvGk',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'I learnt of this center through Health worker',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'ClMb40newIJ',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'I learnt of this center through Poster',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'mrJTBtL2pea',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'I learnt of this center through Community',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'PrYvEIgsUz6',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'I learnt of this center through TV advert',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'sWbnNobbKk5',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'I learnt of this center through Radio advert',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'sWLfVZi2cRo',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'I learnt of this center through Newspaper advert or article',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'aXAPMYFxMFC',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Specify other ways you learnt of this center',
                valueType: 'TEXT'),
            InputField(
                id: 'IrJBisQbxi6',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Ever been tested for HIV?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'sUyz3SX93IM',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'How many times?',
                valueType: 'NUMBER'),
            InputField(
                id: 'XnVcJkyoobx',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'What were the most recent results?',
                valueType: 'TEXT',
                 options:[
                  InputFieldOption(code: 'Positive', name: 'Positive'),
                  InputFieldOption(code: 'Negative', name: 'Negative'),
                  InputFieldOption(code: 'Indeterminate', name: 'Indeterminate'),
                  InputFieldOption(code: 'Didnt collect', name: 'Didnt collect'),     
                   ],                                
                ),
            InputField(
                id: 'D1ukXCpeU0K',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'How long ago was your most recent test?',
                valueType: 'TEXT'),
            InputField(
                id: 'mMmJMXiEPLi',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Has your most recent sex partiner been tested in the last 3 months?',
                valueType: 'TEXT',
                 options:[
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: 'I dont know', name: 'I dont know'),
                  InputFieldOption(code: 'No response', name: 'No response'),     
                   ],
                ),
            InputField(
                id: 'U0E4mb8dSQN',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Ever received a blood transfusion?',
                valueType: 'TEXT',
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'JNeeY3eWUFF',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'History of sexual abuse?',
                valueType: 'TEXT',
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'meLwdeoU4Ei',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Ever had vaginal sexual intercourse?',
                valueType: 'TEXT',
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'Syuc71VFOuO',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Ever had anal intercourse?',
                valueType: 'TEXT',
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'zs5TJVoHg9j',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'At what age did you have sex?',
                valueType: 'NUMBER'),
            InputField(
                id: 'ZmCiT4bo0hk',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'In last 12 months have you had sex while intoxicated?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'Ft9vI1jGG0t',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'In last 12 months have you exchanged money/material for sex?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'HcMOxg4TRCc',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'In last 12 month have you had unprotected sexual intercourse?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'RZflOV27PW4',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'In last 12 months have you had a blood transfusion?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'VYiM0GzeqP8',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'In last 12 months have you had shared needles for injections?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'kQULFUqgab0',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Have you had genital sores or unusual leakage within the past 12 months?',
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ],
                valueType: 'TEXT'),
            InputField(
                id: 'WsZMwXWcHly',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Currently have sores or unusual leakage?',
                valueType: 'TEXT',
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'rZSfGXtRJbz',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'How many sexual partners(including your spouse)have you had sex with in the last 12 months?',
                valueType: 'NUMBER'),
            InputField(
                id: 'QagndU441C1',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Do you currently have more than one sexual partner(including your spouse)?',
                valueType: 'TEXT',
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'Btlk1QnYGHW',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'The last time you had sex with a non-regular partner,did you use a condom?',
                valueType: 'TEXT',
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'HL6ENjSn2kn',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Have you ever talked to anyone about HTS?',
                valueType: 'NUMBER',
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'B1wgf8qa8a6',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Have you ever talked to your spouse about HTS?',
                valueType: 'TEXT',
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'KmkodeXrOOe',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Have you ever talked to your regular partner about HTS?',
                valueType: 'TEXT',
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No'),
                  InputFieldOption(code: '0.000001', name: 'NA')
                ]),
            InputField(
                id: 'XpMXPwbmx7u',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Rapid test Result #1',
                options: [
                  InputFieldOption(code: 'Positive', name: 'Positive'),
                  InputFieldOption(code: 'Negative', name: 'Negative'),
                  InputFieldOption(
                      code: 'Indeterminate', name: 'Indeterminate'),
                ],
                valueType: 'TEXT'),
            InputField(
                id: 'zFymJBnzVRF',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Date bled #1',
                valueType: 'DATE'),
            InputField(
                id: 'n0z9fo8UxDI',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Rapid test Result #2',
                options: [
                  InputFieldOption(code: 'Positive', name: 'Positive'),
                  InputFieldOption(code: 'Negative', name: 'Negative'),
                  InputFieldOption(
                      code: 'Indeterminate', name: 'Indeterminate'),
                ],
                valueType: 'TEXT'),
            InputField(
                id: 'Z0Fs3Yr9CLN',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Date bled #2',
                valueType: 'DATE'),
                     InputField(
                id: 'Phma8a6sS4P',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Date bled #3',
                valueType: 'DATE'),
            InputField(
                id: 'CuSRO5ijeqW',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Rapid test Result #3',
                options: [
                  InputFieldOption(code: 'Positive', name: 'Positive'),
                  InputFieldOption(code: 'Negative', name: 'Negative'),
                  InputFieldOption(
                      code: 'Indeterminate', name: 'Indeterminate'),
                ],
                valueType: 'TEXT'),
            InputField(
                id: 'Phma8a6sS4P',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Date bled #3',
                valueType: 'DATE'),
            InputField(
                id: 'm8BvcCfyxQS',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Confirmatory test necessary?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'V99TfoAmnpE',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Confirmatory test Result #3',
                options: [
                  InputFieldOption(code: 'Positive', name: 'Positive'),
                  InputFieldOption(code: 'Negative', name: 'Negative'),
                  InputFieldOption(
                      code: 'Indeterminate', name: 'Indeterminate'),
                ],
                valueType: 'TEXT'),
            InputField(
                id: 'FfZdgRW5Y5U',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Client refused to receive test results?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'DPTUH5fhDVC',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Client informed of Test results',
                valueType: 'DATE'),
            InputField(
                id: 'c2BsZHprXrd',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Period between testing and Informed results?',
                valueType: 'TEXT'),
            InputField(
                id: 'cMEfQ0ir0Qy',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Type of period used to monitor duration between testing and informed results',
                valueType: 'TEXT'),
            InputField(
                id: 'c2BsZHprXrd',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Period between testing and Informed results?',
                valueType: 'TEXT'),
            InputField(
                id: 'cMEfQ0ir0Qy',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'minutes', name: 'minutes'),
                  InputFieldOption(code: 'hours', name: 'hours'),
                  InputFieldOption(code: 'days', name: 'days'),
                  InputFieldOption(code: 'weeks', name: 'weeks'),
                ],
                name:
                    'Type of period used to monitor duration between testing and informed results',
                valueType: 'TEXT'),
            InputField(
                id: 'gTvAQXCK4l7',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Period number',
                valueType: 'NUMBER'),
            InputField(
                id: 'mYjT1FB8tQ8',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Post Test Counselor Code',
                valueType: 'TEXT'),
            InputField(
                id: 'FHlLCE5NcRE',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Client received Post Test Counselling?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'wig4mkuYyPe',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Disclosure of Status Planned?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'rBnPHOouOpm',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Disclosure of Status to whom?',
                valueType: 'TEXT'),
            InputField(
                id: 'dTFwww2Lcbh',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Risk Reduction Plan Made?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'P43rMiJsvdN',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Planned to reduce risk through use of condom',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'gcUUfyjuGYd',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Planned to reduce risk through monogamy',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'QLpo44r78kP',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Planned to reduce risk through abstinence',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'RIeqF1jCQqo',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Planned to reduce risk through Treatme',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'QLpo44r78kP',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Planned to reduce risk through abstinence',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'RIeqF1jCQqo',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Planned to reduce risk through Treatment of of STIs',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'zJGSraV1Fvk',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Planned to reduce risk through Decreased # of partner',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'O8Fz5EWOOzU',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Referral made?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'KLxWrSRAXfY',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'TB screening', name: 'TB screening'),
                  InputFieldOption(code: 'STI services', name: 'STI services'),
                  InputFieldOption(code: 'HBC', name: 'HBC'),
                  InputFieldOption(
                      code: 'Family Planning', name: 'Family Planning'),
                  InputFieldOption(code: 'PMTCT', name: 'PMTCT'),
                  InputFieldOption(code: 'Nutritional', name: 'Nutritional'),
                  InputFieldOption(code: 'Medical', name: 'Medical'),
                  InputFieldOption(code: 'Financial', name: 'Financial'),
                  InputFieldOption(code: 'Legal', name: 'Legal'),
                  InputFieldOption(
                      code: 'PsychoSocial SupportSupport Group',
                      name: 'PsychoSocial SupportSupport Group'),
                  InputFieldOption(
                      code: 'Nutritional DrugAlcohol Abuse',
                      name: 'Nutritional DrugAlcohol Abuse')
                ],
                name: 'Referral made to',
                valueType: 'TEXT'),
          ]),
      FormSection(
          name: 'Data element info for section : Risk to HIV: This section to be' +
              ' competed for HIV negative clients who have a weight above 35kg, to assess if they are at substantial risk of acquiring HIV.			',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'GiwFq6VMdUm',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: "Client's weight(KG)",
                valueType: 'NUMBER'),
            InputField(
                id: 'TRE8eTo7tWl',
                name: 'Sexual partner with HIV is not ART',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                valueType: 'TRUE_ONLY'),
            InputField(
              id: 'zNz3aCntxv4',
              name: 'Sexual partner who has been on ART for less than 6 months',
              valueType: 'TRUE_ONLY',
              inputColor: Color(0xFF1F8ECE),
              labelColor: Color(0xFF737373),
            ),
            InputField(
                id: 'RLoCiIvo12e',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Sexual partner who has been on ART for more than 6 months but is not virally suppressed',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'OXmIVzKnnfX',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Vaginal or anal sexual intercourse without condoms with more than one partner',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'FHFDusOkEf7',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'A sexual partner with one or more HIV risk factors',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'gB1KMAsfA1H',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    ' history of a sexually transmitted infection(STI)by lab testing or self-report or syndromic STI treatment',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'hjKFMOVQ3Kt',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Client has requested PrEP and has received information on PrEP including which people would benefit from PrEP and client still feels they would benefit from PrEP',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'rDV6sBIwivl',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Do you consent to proceed to PrEP eligibility screening?',
                valueType: 'BOOLEAN'),
          ]),
      FormSection(
        id: 'PeSfSRaE',
          name:
              ' Pre-Exposure Prophylaxis (PrEP) Screening for Substantial Risk  and Eligibility',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'BrcTtRhrxXp',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Facility Name',
                valueType: 'ORGANISATION_UNIT'),
            InputField(
                id: 'uHrSSJghmTS',
                name: 'Entry point /Reason for visiting facility',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                valueType: 'TEXT'),
            InputField(
              id: 'rprU5DII5Aw',
              allowFuturePeriod: true,
              name: 'Date of initial client visit',
              valueType: 'DATE',
              inputColor: Color(0xFF1F8ECE),
              labelColor: Color(0xFF737373),
            ),
            InputField(
                id: 'kK8Gt6LA8QM',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Current gender',
                options: [
                  InputFieldOption(code: 'Male', name: 'Male'),
                  InputFieldOption(code: 'Female', name: 'Female'),
                  InputFieldOption(
                      code: 'Transgender (male to female)',
                      name: 'Transgender (male to female)'),
                  InputFieldOption(
                      code: 'Transgender (female to male)',
                      name: 'Transgender (female to male)'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ],
                valueType: 'TEXT'),
            InputField(
                id: 'gufQ1ELVqcS',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Other current gender',
                valueType: 'TEXT'),
            InputField(
                id: 'gCvMVscBNfk',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Weight',
                valueType: 'NUMBER'),
            InputField(
                id: 'WeaVsrFcWne',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Blood Pressure Systolic (mmHg)',
                valueType: 'NUMBER'),
            InputField(
                id: 'gCvMVscBNfk',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Weight',
                valueType: 'NUMBER'),
            InputField(
                id: 'WeaVsrFcWne',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Blood Pressure Systolic (mmHg)',
                valueType: 'NUMBER'),
            InputField(
                id: 'RqWMrqUcDqv',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Blood PressureDiastolic (mmHg)',
                valueType: 'NUMBER'),
            InputField(
                id: 'd3zHELPzSaH',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Temperature',
                valueType: 'TEXT'),
              InputField(
                id: 'YQI32r1MQxA',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: "Don't Know", name: "Don't Know"),
                ],
                name:
                    'Have you had sex without a condom with someone living with HIV who is not on treatment',
                valueType: 'TEXT'),
            InputField(
                id: 'pQaAQdJnE1w',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: "Don't Know", name: "Don't Know"),
                ],
                name:
                    'Have you had condom-less sex or other high risk HIV exposure in the past 2  6 weeks',
                valueType: 'TEXT'),
            InputField(
                id: 'DobfAIMBOvy',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: "Don't Know", name: "Don't Know"),
                ],
                name:
                    'Have you had a cold or flu, runny nose, fatigue, malaise, headache, sore throat, mouth sores, lymphadenopathy, skin rash, myalgia( muscle pain), arthralgia(joint pain)',
                valueType: 'TEXT'),
            InputField(
                id: 'jpbLNWRjUJK',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Is the client currently taking nephrotoxic drugs. Refer to creatinine clearance job aid for list of nephrotoxic drugs. Consult doctor about alternative medication/management before initiating PrEP',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'bH9DpJOIutM',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Has creatinine clearance (eGFR) <60 ml/min',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'h0P6UfkUvLP',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Weight below 35kg',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'POaEWdS7Lw5',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Allergy or contraindication to any medicine in the PrEP regimen',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'veoA322323t',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'HIV-negative',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'vMR9VtzuH3R',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Date tested',
                valueType: 'DATE'),
            InputField(
                id: 'qgNIIJBeMBT',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Type of test used',
                options: [
                  InputFieldOption(code: 'Determine', name: 'Determine'),
                  InputFieldOption(code: 'Unigold', name: 'Unigold'),
                  InputFieldOption(code: 'Elisa', name: 'Elisa'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ],
                valueType: 'TEXT'),
            InputField(
                id: 'gDlQ3IThgzH',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Other type of test used',
                valueType: 'TEXT'),
            InputField(
                id: 'AkuZ9MSPfZ4',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'At substantial risk of HIV',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'qibwngZ6fd5',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Has no signs/symptoms of acute HIV infection',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'JBmwR9pBO4I',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Has creatinine clearance (eGFR) >60 ml/min or patient has no risk factors for renal disease and the creatinine result is pending (see Creatinine clearance job aid for risk factors)',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'JBmwR9pBO4I',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Has creatinine clearance (eGFR) >60 ml/min or patient has no risk factors for renal disease and the creatinine result is pending (see Creatinine clearance job aid for risk factors)',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'Ihu2PjZMh8B',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'eGFR Result',
                valueType: 'TEXT'),
            InputField(
                id: 'W8LTmGz13QM',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Creatinine clearance (calculated)',
                valueType: 'TEXT'),
            InputField(
                id: 'XfB60ruQI3I',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Date Creatinine clearance (calculated)',
                valueType: 'DATE'),
            InputField(
                id: 'D0tq5I6jgLk',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'PrEP initiated',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'q9dpokR3G1q',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Initiated on PEP',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'rZov68n0pzv',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'To start PrEP after completing PEP',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'kqDlnMhTKTd',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'PCR/HIV Ag test or follow-up HIV re-testing (if suspicion of acute HIV infection)',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'B8jihEQnoJG',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Client declined PrEP',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'ov7UEdiyjJA',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Referred for PrEP at another facility',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'dpfubDzhwhX',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Name of facility PrEP referred',
                valueType: 'TEXT'),
          ]),
      FormSection(
          id: 'BsLnIfmtn',
          name: ' Baseline Information',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'tNPOFcRu6Uj',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'PrEP Patient Number',
                valueType: 'NUMBER'),
            InputField(
                id: 'NpeW9958TcF',
                name: 'Entry point for PrEP(community)',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                valueType: 'TEXT'),
            InputField(
              id: 'GqTYUcdyFv0',
              name: 'Entry point for PrEP(Health facility)',
              valueType: 'TEXT',
              inputColor: Color(0xFF1F8ECE),
              labelColor: Color(0xFF737373),
            ),
            InputField(
                id: 'uPpYQM3rAZ2',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Other entry point for PrEP',
                valueType: 'TEXT'),
            InputField(
                id: 'BFTG6ilADjd',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Date of most recent negative HIV test before PrEP initiation',
                valueType: 'DATE'),
            InputField(
                id: 'mSUNOhSO4c4',
                allowFuturePeriod: true,
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Date of PrEP initiation',
                valueType: 'DATE'),
            InputField(
                id: 'qMaqhDQAoGj',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Basekline creatinine',
                valueType: 'NUMBER'),
            InputField(
                id: 'OmMTgtlqlYQ',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'CrCL',
                valueType: 'NUMBER'),
            InputField(
                id: 'wuaPJIIaG3c',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Currently exchanges sex for money',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'MHKRo4smybO',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Currently pays for sex',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'RTDFe07DmAS',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Man who has sex with men',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'hzhNp8HQdxa',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Transgender individual',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'EnOWQqMl3gR',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Transgender individual',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'miDdRhIp5dT',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'In a serodiscordant relationship and HIV positive partner is not on ART or has been on ART for < 12 months',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'tcyJ2AAJk4y',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    "In a serodiscordant relationship and HIV positive partner's last viral load is >=1000 copies/ml OR viral =load is not known but partner's ART adherence is poor",
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'Vnpt71NpJE4',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Has multiple concurrent sexual partners',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'Jy2xjANHVpV',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Individual believes their partner has multiple other concurrent sexual partners',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'LcWivhRYlQl',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Individual at high risk of being forced to have sex',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'bZ8fTvAhdMS',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Other indications for PrEP initiation,specify',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'UL1Pq6sgvr2',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Other indications for PrEP initiation',
                valueType: 'TEXT'),
            InputField(
                id: 'NIZZ0Bj3XPU',
                allowFuturePeriod: true,
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Date of initial visit',
                valueType: 'DATE'),
          ])
    ];
  }
}
