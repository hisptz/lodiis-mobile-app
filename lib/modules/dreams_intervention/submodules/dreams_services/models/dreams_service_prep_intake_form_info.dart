import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamsServicePrepIntakeInfo {
  static List<String> getCheckboxInputFieldOptions(
      List<FormSection> formSections) {
    List<String> inputFieldOptions = [];
    for (FormSection section in formSections) {
      for (InputField field in section.inputFields) {
        if (field.valueType == 'CHECK_BOX') {
          for (InputFieldOption option in field.options) {
            inputFieldOptions.add(option.code);
          }
        }
      }
    }
    return inputFieldOptions;
  }

  static List<String> getMandatoryField() {
    const excludedFields = [
      'UL0xa3Sz9ML',
      'de4zcWiZB5j',
      'XfB60ruQI3I',
      'W8LTmGz13QM',
      'Ihu2PjZMh8B'
    ];
    List<String> inputFields = FormUtil.getFormFieldIds(getFormSections());
    List<String> optionalFields =
        getCheckboxInputFieldOptions(getFormSections());
    inputFields = inputFields
        .where((field) => optionalFields.indexOf(field) < 0)
        .toList()
        .where((field) => excludedFields.indexOf(field) < 0)
        .toList();
    return inputFields;
  }

  static List<FormSection> getFormSections() {
    return [
      // FormSection(
      //     name: 'HTS CLIENT INTAKE RECORD',
      //     color: Color(0xFF737373),
      //     inputFields: [
      //       InputField(
      //         id: 'lQ8XDsy6M6y',
      //         inputColor: Color(0xFF1F8ECE),
      //         labelColor: Color(0xFF737373),
      //         name: 'Site Name',
      //         valueType: 'ORGANISATION_UNIT',
      //         allowedSelectedLevels: [4],
      //       ),
      //       InputField(
      //           id: 'V83BlJrXSiv',
      //           name: 'Counselor Name',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'gm4R68f8gqr',
      //           name: 'Client Type',
      //           valueType: 'TEXT',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           options: [
      //             InputFieldOption(code: 'F', name: 'F'),
      //             InputFieldOption(code: 'M', name: 'M'),
      //             InputFieldOption(code: 'CF', name: 'CF'),
      //             InputFieldOption(code: 'CM', name: 'CM'),
      //             InputFieldOption(code: 'AGYW', name: 'AGYW'),
      //           ]),
      //       InputField(
      //           id: 'Jhp451oeYyB',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Is it a couple?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'p9AA21uFn2n',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: "Partner's name",
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'Y0QGNDBCEbz',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: "Partner's date of birth",
      //           valueType: 'DATE'),
      //       InputField(
      //           id: 'wiPJ5G01Vq9',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Service Type',
      //           valueType: 'TEXT',
      //           options: [
      //             InputFieldOption(
      //                 code: 'CounselingTesting', name: 'Counseling Testing'),
      //             InputFieldOption(
      //                 code: 'Counseling only', name: 'Counseling only'),
      //             InputFieldOption(code: 'Testing only', name: 'Testing only'),
      //           ]),
      //       InputField(
      //           id: 'li1EJgHzWtV',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Marital Status',
      //           valueType: 'TEXT',
      //           options: [
      //             InputFieldOption(
      //                 code: 'Never married', name: 'Never married'),
      //             InputFieldOption(
      //                 code: 'Currently Married to one person',
      //                 name: 'Currently Married to one person'),
      //             InputFieldOption(
      //                 code: 'Polygamous Marriage', name: 'Polygamous Marriage'),
      //             InputFieldOption(code: 'Divorced', name: 'Divorced'),
      //             InputFieldOption(code: 'Separated', name: 'Separated'),
      //             InputFieldOption(code: 'Widowed', name: 'Widowed'),
      //             InputFieldOption(
      //                 code: 'Living with (unmarried) partner',
      //                 name: 'Living with (unmarried) partner'),
      //             InputFieldOption(code: 'Other', name: 'Other'),
      //           ]),
      //       InputField(
      //           id: 'GrChAWBTqTc',
      //           name: 'Specify marital status',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           valueType: 'TEXT'),
      //       InputField(
      //         id: 'wg10XmeTFSq',
      //         name: 'Number of children under 16 years',
      //         valueType: 'NUMBER',
      //         inputColor: Color(0xFF1F8ECE),
      //         labelColor: Color(0xFF737373),
      //       ),
      //       InputField(
      //           id: 'pPKoRExOuKU',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Are you or your partner currently pregnant?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'KE2KOYQCY8t',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Are you or your partner currently breastfeeding?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'FN1zuu5rCHI',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           options: [
      //             InputFieldOption(code: 'Yes', name: 'Yes'),
      //             InputFieldOption(code: 'No', name: 'No'),
      //             InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
      //           ],
      //           name:
      //               'Are you or your partner planning to have a child within next 2 years?',
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: '',
      //           name: 'Occupation',
      //           valueType: 'CHECK_BOX',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           renderAsRadio: true,
      //           options: [
      //             InputFieldOption(code: 'rUyb2ilJl5y', name: 'Unemployed'),
      //             InputFieldOption(
      //               code: 'QdIAXIslH75',
      //               name: 'Student',
      //             ),
      //             InputFieldOption(
      //               code: 'bfMzA5x69SZ',
      //               name: 'Farmer/Farm worker',
      //             ),
      //             InputFieldOption(
      //                 code: 'DKmXqOp3oYc', name: 'Domestic worker/gardener'),
      //             InputFieldOption(
      //               code: 'TOSx4VyOZQT',
      //               name: 'Guard',
      //             ),
      //             InputFieldOption(code: 'GPYuQ42sg3T', name: 'Professional'),
      //             InputFieldOption(
      //               code: 'RFa3D2oM8aQ',
      //               name: 'Informal Trader',
      //             ),
      //             InputFieldOption(
      //               code: 'Y2VpdgQ2iEK',
      //               name: 'Military/Uniformed',
      //             ),
      //             InputFieldOption(
      //               code: 'POgKhlepadZ',
      //               name: 'Trucker/Truck driver',
      //             ),
      //             InputFieldOption(
      //               code: 'STrVefsqTij',
      //               name: 'Commercial Sex Worker',
      //             ),
      //             InputFieldOption(
      //               code: 'b8ZaGIN11vv',
      //               name: 'Mine worker',
      //             ),
      //             InputFieldOption(
      //               code: 'JflxahjBLrH',
      //               name: 'Other occupation(sp)',
      //             ),
      //           ]),
      //       InputField(
      //         id: 'PqSjDmu2eMy',
      //         inputColor: Color(0xFF1F8ECE),
      //         labelColor: Color(0xFF737373),
      //         name: 'Specify other occupation',
      //         valueType: 'TEXT',
      //       ),
      //       InputField(
      //         id: 'D26taDdz4YO',
      //         inputColor: Color(0xFF1F8ECE),
      //         labelColor: Color(0xFF737373),
      //         name: 'Highest level of Education Attained',
      //         valueType: 'BOOLEAN',
      //         options: [
      //           InputFieldOption(code: 'None', name: 'None'),
      //           InputFieldOption(
      //               code: 'Less than Standard 7', name: 'Less than Standard 7'),
      //           InputFieldOption(
      //               code: 'Secondary School', name: 'Secondary School'),
      //           InputFieldOption(code: 'High School', name: 'High School'),
      //           InputFieldOption(
      //               code: 'College Certificate/Diploma',
      //               name: 'College CertificateDiploma'),
      //           InputFieldOption(
      //               code: 'University Degree', name: 'University Degree'),
      //           InputFieldOption(
      //               code: 'Graduate Degree (Masters/PhD)',
      //               name: 'Graduate DegreeMastersPhD'),
      //         ],
      //       ),
      //       InputField(
      //           id: '',
      //           name: 'Reasons for visiting site',
      //           valueType: 'CHECK_BOX',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           renderAsRadio: true,
      //           options: [
      //             InputFieldOption(
      //                 code: 'XfiDt4DzdVS',
      //                 name:
      //                     'Visited the site because I Have a child who is sick or died.'),
      //             InputFieldOption(
      //               code: 's5NmD81MGOc',
      //               name: 'Visited the site because my Partner died.',
      //             ),
      //             InputFieldOption(
      //                 code: 'qA5e24CNBrw',
      //                 name:
      //                     'Visited the site because I Worried about my past behaviour/curious'),
      //             InputFieldOption(
      //                 code: 'eNGTWMYAFL0',
      //                 name:
      //                     'Visited the site because I  Worried abut my partner? behaviour/status'),
      //             InputFieldOption(
      //                 code: 'lsFT00D6nOV',
      //                 name:
      //                     'Visited the site because I Have multiple partners.'),
      //             InputFieldOption(
      //                 code: 'jcWYjzUCG6S',
      //                 name: 'Visited the site because my Partner is sick'),
      //             InputFieldOption(
      //                 code: 'zTC4EV7XTj5',
      //                 name:
      //                     'Visited the site because my Partner has tested positive for HIV.'),
      //             InputFieldOption(
      //                 code: 'aN6VHxj82GQ',
      //                 name: 'Visited the site because I am feeling unwell'),
      //             InputFieldOption(
      //                 code: 'JFqUJNUzTww',
      //                 name:
      //                     'Visited the site because I was Advised by my family/friends'),
      //             InputFieldOption(
      //                 code: 'KaAWXJVHDVz',
      //                 name:
      //                     'Visited the site because I was Advised by health care worker'),
      //             InputFieldOption(
      //                 code: 'xzpOED9PyVh',
      //                 name:
      //                     'Visited the site because I am Planning to get married.'),
      //             InputFieldOption(
      //                 code: 'RU9VC5xsNf5',
      //                 name:
      //                     'Visited the site because I am Getting serious/stopping condoms'),
      //             InputFieldOption(
      //                 code: 'zscz5KYlCS5',
      //                 name:
      //                     'Visited the site because I am Planning to have a baby'),
      //             InputFieldOption(
      //                 code: 'yjnuJxlFmIm',
      //                 name: 'Visited the site Because I am pregnant'),
      //             InputFieldOption(
      //                 code: 'n1YU4oiRqyY',
      //                 name: 'Visited the site because my Partner requested'),
      //             InputFieldOption(
      //                 code: 'ijbtN1BP4A2',
      //                 name: 'Visited the site For life insurance'),
      //             InputFieldOption(
      //                 code: 'DXwITugq1X6',
      //                 name: 'Visited the site For scholarship/studies'),
      //             InputFieldOption(
      //                 code: 'T92Q2Irzmgj',
      //                 name: 'Visited the site For travel/visa'),
      //             InputFieldOption(
      //                 code: 'D5dyOe7GJpp',
      //                 name:
      //                     'Visited the site because I am Retesting (Closing the window)'),
      //             InputFieldOption(
      //                 code: 'RDDWIVvUOQZ',
      //                 name:
      //                     'Visited the site because I am Retesting (Confirmation of HIV positive)'),
      //             InputFieldOption(
      //                 code: 'F42UdUKO75Z',
      //                 name: 'Other reason for visiting the site(sp)')
      //           ]),
      //       InputField(
      //           id: 'ukX9y6lXpNo',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Other reason for visiting the site',
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: '',
      //           name: 'How did you learn of this center?',
      //           valueType: 'CHECK_BOX',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           renderAsRadio: true,
      //           options: [
      //             InputFieldOption(
      //                 code: 'onf8hoBn6xO',
      //                 name: 'I learnt of this center through a Friend'),
      //             InputFieldOption(
      //               code: 'qRmcFUHrKJG',
      //               name: 'I learnt of this center through a Partner/Spouse',
      //             ),
      //             InputFieldOption(
      //                 code: 'ADLCht0KPSh',
      //                 name:
      //                     'I learnt of this center through Other Family Member'),
      //             InputFieldOption(
      //                 code: 'p6Xwp6okdfN',
      //                 name: 'I learnt of this center through Other HTC client'),
      //             InputFieldOption(
      //                 code: 'APJcg5JKvGk',
      //                 name: 'I learnt of this center through Health worker'),
      //             InputFieldOption(
      //                 code: 'ClMb40newIJ',
      //                 name: 'I learnt of this center through Poster'),
      //             InputFieldOption(
      //                 code: 'mrJTBtL2pea',
      //                 name: 'I learnt of this center through Community'),
      //             InputFieldOption(
      //                 code: 'PrYvEIgsUz6',
      //                 name: 'I learnt of this center through TV advert'),
      //             InputFieldOption(
      //                 code: 'sWbnNobbKk5',
      //                 name: 'I learnt of this center through Radio advert'),
      //             InputFieldOption(
      //                 code: 'sWLfVZi2cRo',
      //                 name:
      //                     'I learnt of this center through Newspaper advert or article'),
      //             InputFieldOption(
      //                 code: 'kTHUZ8SOSXK',
      //                 name: 'Other ways you learnt of this center(sp)'),
      //           ]),
      //       InputField(
      //           id: 'aXAPMYFxMFC',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Specify other ways you learnt of this center',
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'IrJBisQbxi6',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Ever been tested for HIV?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'sUyz3SX93IM',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'How many times?',
      //           valueType: 'NUMBER'),
      //       InputField(
      //         id: 'XnVcJkyoobx',
      //         inputColor: Color(0xFF1F8ECE),
      //         labelColor: Color(0xFF737373),
      //         name: 'What were the most recent results?',
      //         valueType: 'TEXT',
      //         options: [
      //           InputFieldOption(code: 'Positive', name: 'Positive'),
      //           InputFieldOption(code: 'Negative', name: 'Negative'),
      //           InputFieldOption(code: 'Indeterminate', name: 'Indeterminate'),
      //           InputFieldOption(code: 'Didnt collect', name: 'Didnt collect'),
      //         ],
      //       ),
      //       InputField(
      //           id: 'D1ukXCpeU0K',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'How long ago was your most recent test?',
      //           valueType: 'TEXT'),
      //       InputField(
      //         id: 'mMmJMXiEPLi',
      //         inputColor: Color(0xFF1F8ECE),
      //         labelColor: Color(0xFF737373),
      //         name:
      //             'Has your most recent sex partner been tested in the last 3 months?',
      //         valueType: 'TEXT',
      //         options: [
      //           InputFieldOption(
      //               code: 'Yes, and the result was negative',
      //               name: 'Yes, and the result was negative'),
      //           InputFieldOption(
      //               code: 'Yes, and the result was positive',
      //               name: 'Yes, and the result was positive'),
      //           InputFieldOption(
      //               code: 'Yes, but I don’t know the result',
      //               name: 'Yes, but I don’t know the result'),
      //           InputFieldOption(code: 'No', name: 'No'),
      //           InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know'),
      //           InputFieldOption(code: 'N/A', name: 'N/A'),
      //         ],
      //       ),
      //       InputField(
      //           id: 'U0E4mb8dSQN',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Ever received a blood transfusion?',
      //           valueType: 'TEXT',
      //           options: [
      //             InputFieldOption(code: '1', name: 'Yes'),
      //             InputFieldOption(code: '0', name: 'No'),
      //             InputFieldOption(code: '0.000001', name: 'NA')
      //           ]),
      //       InputField(
      //           id: 'JNeeY3eWUFF',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'History of sexual abuse?',
      //           valueType: 'TEXT',
      //           options: [
      //             InputFieldOption(code: '1', name: 'Yes'),
      //             InputFieldOption(code: '0', name: 'No'),
      //             InputFieldOption(code: '0.000001', name: 'NA')
      //           ]),
      //       InputField(
      //           id: 'meLwdeoU4Ei',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Ever had vaginal sexual intercourse?',
      //           valueType: 'TEXT',
      //           options: [
      //             InputFieldOption(code: '1', name: 'Yes'),
      //             InputFieldOption(code: '0', name: 'No'),
      //             InputFieldOption(code: '0.000001', name: 'NA')
      //           ]),
      //       InputField(
      //           id: 'Syuc71VFOuO',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Ever had anal intercourse?',
      //           valueType: 'TEXT',
      //           options: [
      //             InputFieldOption(code: '1', name: 'Yes'),
      //             InputFieldOption(code: '0', name: 'No'),
      //             InputFieldOption(code: '0.000001', name: 'NA')
      //           ]),
      //       InputField(
      //           id: 'zs5TJVoHg9j',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'At what age did you have sex?',
      //           valueType: 'NUMBER'),
      //       InputField(
      //           id: 'ZmCiT4bo0hk',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'In last 12 months have you had sex while intoxicated?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'Ft9vI1jGG0t',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name:
      //               'In last 12 months have you exchanged money/material for sex?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'HcMOxg4TRCc',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name:
      //               'In last 12 month have you had unprotected sexual intercourse?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'RZflOV27PW4',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'In last 12 months have you had a blood transfusion?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'VYiM0GzeqP8',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name:
      //               'In last 12 months have you shared needles for injections?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'kQULFUqgab0',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name:
      //               'Have you had genital sores or unusual leakage within the past 12 months?',
      //           options: [
      //             InputFieldOption(code: '1', name: 'Yes'),
      //             InputFieldOption(code: '0', name: 'No'),
      //             InputFieldOption(code: '0.000001', name: 'NA')
      //           ],
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'WsZMwXWcHly',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Currently have sores or unusual leakage?',
      //           valueType: 'TEXT',
      //           options: [
      //             InputFieldOption(code: '1', name: 'Yes'),
      //             InputFieldOption(code: '0', name: 'No'),
      //             InputFieldOption(code: '0.000001', name: 'NA')
      //           ]),
      //       InputField(
      //           id: 'rZSfGXtRJbz',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name:
      //               'How many sexual partners(including your spouse)have you had sex with in the last 12 months?',
      //           valueType: 'NUMBER'),
      //       InputField(
      //           id: 'QagndU441C1',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name:
      //               'Do you currently have more than one sexual partner(including your spouse)?',
      //           valueType: 'TEXT',
      //           options: [
      //             InputFieldOption(code: '1', name: 'Yes'),
      //             InputFieldOption(code: '0', name: 'No'),
      //             InputFieldOption(code: '0.000001', name: 'NA')
      //           ]),
      //       InputField(
      //           id: 'Btlk1QnYGHW',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name:
      //               'The last time you had sex with a non-regular partner,did you use a condom?',
      //           valueType: 'TEXT',
      //           options: [
      //             InputFieldOption(code: '1', name: 'Yes'),
      //             InputFieldOption(code: '0', name: 'No'),
      //             InputFieldOption(code: '0.000001', name: 'NA')
      //           ]),
      //       InputField(
      //           id: 'HL6ENjSn2kn',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Have you ever talked to anyone about HTS?',
      //           valueType: 'NUMBER',
      //           options: [
      //             InputFieldOption(code: '1', name: 'Yes'),
      //             InputFieldOption(code: '0', name: 'No'),
      //             InputFieldOption(code: '0.000001', name: 'NA')
      //           ]),
      //       InputField(
      //           id: 'B1wgf8qa8a6',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Have you ever talked to your spouse about HTS?',
      //           valueType: 'TEXT',
      //           options: [
      //             InputFieldOption(code: '1', name: 'Yes'),
      //             InputFieldOption(code: '0', name: 'No'),
      //             InputFieldOption(code: '0.000001', name: 'NA')
      //           ]),
      //       InputField(
      //           id: 'KmkodeXrOOe',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Have you ever talked to your regular partner about HTS?',
      //           valueType: 'TEXT',
      //           options: [
      //             InputFieldOption(code: '1', name: 'Yes'),
      //             InputFieldOption(code: '0', name: 'No'),
      //             InputFieldOption(code: '0.000001', name: 'NA')
      //           ]),
      //       InputField(
      //           id: 'XpMXPwbmx7u',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Rapid test Result #1',
      //           isReadOnly: true,
      //           options: [
      //             InputFieldOption(code: 'Positive', name: 'Positive'),
      //             InputFieldOption(code: 'Negative', name: 'Negative'),
      //             InputFieldOption(
      //                 code: 'Indeterminate', name: 'Indeterminate'),
      //           ],
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'zFymJBnzVRF',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Date bled #1',
      //           valueType: 'DATE'),
      //       InputField(
      //           id: 'n0z9fo8UxDI',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           isReadOnly: true,
      //           name: 'Rapid test Result #2',
      //           options: [
      //             InputFieldOption(code: 'Positive', name: 'Positive'),
      //             InputFieldOption(code: 'Negative', name: 'Negative'),
      //             InputFieldOption(
      //                 code: 'Indeterminate', name: 'Indeterminate'),
      //           ],
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'Z0Fs3Yr9CLN',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Date bled #2',
      //           valueType: 'DATE'),
      //       // InputField(
      //       //     id: 'Phma8a6sS4P',
      //       //     inputColor: Color(0xFF1F8ECE),
      //       //     labelColor: Color(0xFF737373),
      //       //     name: 'Date bled #3',
      //       //     valueType: 'DATE'),
      //       InputField(
      //           id: 'CuSRO5ijeqW',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Rapid test Result #3',
      //           options: [
      //             InputFieldOption(code: 'Positive', name: 'Positive'),
      //             InputFieldOption(code: 'Negative', name: 'Negative'),
      //             InputFieldOption(
      //                 code: 'Indeterminate', name: 'Indeterminate'),
      //           ],
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'Phma8a6sS4P',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Date bled #3',
      //           valueType: 'DATE'),
      //       InputField(
      //           id: 'm8BvcCfyxQS',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Confirmatory test necessary?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'V99TfoAmnpE',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Confirmatory test Result #3',
      //           options: [
      //             InputFieldOption(code: 'Positive', name: 'Positive'),
      //             InputFieldOption(code: 'Negative', name: 'Negative'),
      //             InputFieldOption(
      //                 code: 'Indeterminate', name: 'Indeterminate'),
      //           ],
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'FfZdgRW5Y5U',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Client refused to receive test results?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'DPTUH5fhDVC',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Client informed of Test results',
      //           valueType: 'DATE'),
      //       InputField(
      //           id: 'c2BsZHprXrd',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           isReadOnly: true,
      //           name: 'Period between testing and Informed results?',
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'cMEfQ0ir0Qy',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           options: [
      //             InputFieldOption(code: 'minutes', name: 'minutes'),
      //             InputFieldOption(code: 'hours', name: 'hours'),
      //             InputFieldOption(code: 'days', name: 'days'),
      //             InputFieldOption(code: 'weeks', name: 'weeks'),
      //           ],
      //           name:
      //               'Type of period used to monitor duration between testing and informed results',
      //           valueType: 'TEXT'),
      //       // InputField(
      //       //     id: 'gTvAQXCK4l7',
      //       //     inputColor: Color(0xFF1F8ECE),
      //       //     labelColor: Color(0xFF737373),
      //       //     name: 'Period number',
      //       //     valueType: 'NUMBER'),
      //       InputField(
      //           id: 'FHlLCE5NcRE',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Client received Post Test Counselling?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'mYjT1FB8tQ8',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Post Test Counselor Code',
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'wig4mkuYyPe',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Disclosure of Status Planned?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'rBnPHOouOpm',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Disclosure of Status to whom?',
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'dTFwww2Lcbh',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Risk Reduction Plan Made?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'dTFwww2Lcbh_checkbox',
      //           name: 'Plan',
      //           valueType: 'CHECK_BOX',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           options: [
      //             InputFieldOption(
      //                 code: 'P43rMiJsvdN',
      //                 name: 'Reduce risk through use of condom'),
      //             InputFieldOption(
      //                 code: 'gcUUfyjuGYd',
      //                 name: 'Reduce risk through monogamy'),
      //             InputFieldOption(
      //                 code: 'QLpo44r78kP',
      //                 name: 'Reduce risk through abstinence'),
      //             InputFieldOption(
      //                 code: 'RIeqF1jCQqo',
      //                 name: 'Reduce risk through Treatment of STIs'),
      //             InputFieldOption(
      //                 code: 'zJGSraV1Fvk',
      //                 name: 'Reduce risk through Decreased # of partner'),
      //           ]),
      //       InputField(
      //           id: 'O8Fz5EWOOzU',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Referral made?',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'KLxWrSRAXfY',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           options: [
      //             InputFieldOption(code: 'TB screening', name: 'TB screening'),
      //             InputFieldOption(code: 'STI services', name: 'STI services'),
      //             InputFieldOption(code: 'HBC', name: 'HBC'),
      //             InputFieldOption(
      //                 code: 'Family Planning', name: 'Family Planning'),
      //             InputFieldOption(code: 'PMTCT', name: 'PMTCT'),
      //             InputFieldOption(code: 'Nutritional', name: 'Nutritional'),
      //             InputFieldOption(code: 'Medical', name: 'Medical'),
      //             InputFieldOption(code: 'Financial', name: 'Financial'),
      //             InputFieldOption(code: 'Legal', name: 'Legal'),
      //             InputFieldOption(
      //                 code: 'PsychoSocial SupportSupport Group',
      //                 name: 'PsychoSocial SupportSupport Group'),
      //             InputFieldOption(
      //                 code: 'Nutritional DrugAlcohol Abuse',
      //                 name: 'Nutritional DrugAlcohol Abuse'),
      //             InputFieldOption(
      //                 code: 'KB Intervention', name: 'KB Intervention'),
      //           ],
      //           name: 'Referral made to',
      //           valueType: 'TEXT'),
      //     ]),
      // FormSection(
      //     name: 'Data element info for section : Risk to HIV: This section to be' +
      //         ' competed for HIV negative clients who have a weight above 35kg, to assess if they are at substantial risk of acquiring HIV.			',
      //     color: Color(0xFF1F8ECE),
      //     inputFields: [
      //       InputField(
      //           id: 'GiwFq6VMdUm',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: "Client's weight(KG)",
      //           isReadOnly: true,
      //           valueType: 'NUMBER'),
      //       InputField(
      //           id: 'TRE8eTo7tWl',
      //           name: 'Sexual partner with HIV is not ART',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //         id: 'zNz3aCntxv4',
      //         name: 'Sexual partner who has been on ART for less than 6 months',
      //         valueType: 'BOOLEAN',
      //         inputColor: Color(0xFF1F8ECE),
      //         labelColor: Color(0xFF737373),
      //       ),
      //       InputField(
      //           id: 'RLoCiIvo12e',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name:
      //               'Sexual partner who has been on ART for more than 6 months but is not virally suppressed',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'OXmIVzKnnfX',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name:
      //               'Vaginal or anal sexual intercourse without condoms with more than one partner',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'FHFDusOkEf7',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'A sexual partner with one or more HIV risk factors',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'gB1KMAsfA1H',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name:
      //               'A history of a sexually transmitted infection(STI)by lab testing or self-report or syndromic STI treatment',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'hjKFMOVQ3Kt',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name:
      //               'Client has requested PrEP and has received information on PrEP including which people would benefit from PrEP and client still feels they would benefit from PrEP',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'rDV6sBIwivl',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name:
      //               'Do you consent to proceed to PrEP eligibility screening?',
      //           valueType: 'BOOLEAN'),
      //     ]),
      FormSection(
          id: 'PeSfSRaE',
          name: '1. Facility Information',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'BrcTtRhrxXp',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                allowedSelectedLevels: [4],
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
          ]),
      FormSection(
          id: 'PeSfSRaE',
          name: '3. Client Demographics',
          color: Color(0xFF1F8ECE),
          inputFields: [
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
                suffixLabel: 'Kg',
                valueType: 'NUMBER'),
            InputField(
                id: 'WeaVsrFcWne',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Blood Pressure Systolic (mmHg)',
                suffixLabel: 'mmHg',
                valueType: 'NUMBER'),
            InputField(
                id: 'RqWMrqUcDqv',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Blood Pressure Diastolic (mmHg)',
                suffixLabel: 'mmHg',
                valueType: 'NUMBER'),
            InputField(
                id: 'd3zHELPzSaH',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Temperature',
                valueType: 'TEXT'),
          ]),
      FormSection(
          id: 'PeSfSRaE',
          name: '4. Recent Exposure to HIV. Ask, "In the last 30 days"...',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'YQI32r1MQxA',
                description:
                    '*If ONLY reporting sex without a condom, consider post-exposure prophylaxis (PEP). Refer to ART guidelines for management.',
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
          ]),
      FormSection(
          id: 'PeSfSRaE',
          name: '5. Assessment for acute HIV syndrome',
          color: Color(0xFF1F8ECE),
          inputFields: [
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
                description:
                    'If reporting sex without a condom in the past 2 to 6 weeks and  has flu-like symptoms, an acute HIV infection might be suspected and further investigation is required; \n DO NOT offer PrEP or PEP and conduct further HIV testingIf a more sensitive test e.g. \n DNA PCR is available with results available within 2 weeks conduct the more sensitive test.If more sensitive test e.g. \n DNA PCR is not available, ask the client to come back after 4 weeks for repeat rapid HIV test.',
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: "Don't Know", name: "Don't Know"),
                ],
                name:
                    'Have you had a cold or flu, runny nose, fatigue, malaise, headache, sore throat, mouth sores, lymphadenopathy, skin rash, myalgia( muscle pain), arthralgia(joint pain)',
                valueType: 'TEXT'),
          ]),
      FormSection(
          id: 'PeSfSRaE',
          name:
              '6. Contraindications for PrEP. If any of the contraindications are present do not offer PrEP',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'jpbLNWRjUJK',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Is the client currently taking nephrotoxic drugs. Refer to creatinine clearance job aid for list of nephrotoxic drugs. Consult doctor about alternative medication/management before initiating PrEP',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'bH9DpJOIutM',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Has creatinine clearance (eGFR) <60 ml/min',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'h0P6UfkUvLP',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Weight below 35kg',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'POaEWdS7Lw5',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Allergy or contraindication to any medicine in the PrEP regimen',
                valueType: 'BOOLEAN'),
          ]),
      FormSection(
          id: 'PeSfSRaE',
          name: '7. PrEP Eligibility',
          description: 'If all answers in this section are yes, offer PrEP.',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'veoA322323t',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'HIV-negative',
                isReadOnly: true,
                valueType: 'BOOLEAN'),
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
                valueType: 'BOOLEAN'),
            InputField(
                id: 'qibwngZ6fd5',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Has no signs/symptoms of acute HIV infection',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'JBmwR9pBO4I',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Has creatinine clearance (eGFR) >60 ml/min or patient has no risk factors for renal disease and the creatinine result is pending (see Creatinine clearance job aid for risk factors)',
                valueType: 'BOOLEAN'),
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
          ]),
      FormSection(
          id: 'PeSfSRaE',
          name: '8. Services Received by Client',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'D0tq5I6jgLk',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'PrEP initiated',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'q9dpokR3G1q',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Initiated on PEP',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'rZov68n0pzv',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'To start PrEP after completing PEP',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'kqDlnMhTKTd',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'PCR/HIV Ag test or follow-up HIV re-testing (if suspicion of acute HIV infection)',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'B8jihEQnoJG',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Client declined PrEP',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'ov7UEdiyjJA',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Referred for PrEP at another facility',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'dpfubDzhwhX',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Name of facility PrEP referred',
                allowedSelectedLevels: [4],
                valueType: 'ORGANISATION_UNIT'),
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
                options: [
                  InputFieldOption(
                      code: 'Health facility outreach',
                      name: 'Health facility outreach'),
                  InputFieldOption(
                      code: 'Community program',
                      name: 'Community program (Specify)'),
                ],
                valueType: 'TEXT'),
            InputField(
                id: 'GqTYUcdyFv0',
                name: 'Entry point for PrEP(Health facility)',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Adolescent corner/clinic',
                      name: 'Adolescent corner/clinic'),
                  InputFieldOption(code: 'ART', name: 'ART'),
                  InputFieldOption(code: 'OPD', name: 'OPD'),
                  InputFieldOption(code: 'Other', name: 'Other'),
                ],
                valueType: 'TEXT'),
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
                name: 'Baseline creatinine',
                valueType: 'NUMBER'),
            InputField(
                id: 'OmMTgtlqlYQ',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'CrCL',
                valueType: 'NUMBER'),
            InputField(
                id: 'OlDYLVf0bRA',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Indication for starting PrEP',
                options: [
                  InputFieldOption(
                      code: 'Currently exchanges sex for money',
                      name: 'Currently exchanges sex for money'),
                  InputFieldOption(
                      code: 'Currently pays for sex',
                      name: 'Currently pays for sex'),
                  InputFieldOption(
                      code: 'Man who has sex with men',
                      name: 'Man who has sex with men'),
                  InputFieldOption(
                      code: 'Transgender individual',
                      name: 'Transgender individual'),
                  InputFieldOption(
                      code: 'Individual who injects drugs',
                      name: 'Individual who injects drugs'),
                  InputFieldOption(
                      code:
                          'In a serodiscordant relationship and HIV-positive partner is not on ART or has been on ART for < 12 months',
                      name:
                          'In a serodiscordant relationship and HIV-positive partner is not on ART or has been on ART for < 12 months'),
                  InputFieldOption(
                      code:
                          "In a serodiscordant relationship and HIV-positive partner's last viral load is >= 1000 copies/ml OR viral load is not known but partner's ART adherence is believed to be poor",
                      name:
                          "In a serodiscordant relationship and HIV-positive partner's last viral load is >= 1000 copies/ml OR viral load is not known but partner's ART adherence is believed to be poor"),
                  InputFieldOption(
                      code: 'Has multiple concurrent sexual partners',
                      name: 'Has multiple concurrent sexual partners'),
                  InputFieldOption(
                      code:
                          'Individual believes their partner has multiple other concurrent sexual partners',
                      name:
                          'Individual believes their partner has multiple other concurrent sexual partners'),
                  InputFieldOption(
                      code:
                          'Individual at high risk of being forced to have sex',
                      name:
                          'Individual at high risk of being forced to have sex'),
                  InputFieldOption(code: 'Other', name: 'Other (Specify)'),
                ],
                valueType: 'TEXT'),
            InputField(
                id: 'UL1Pq6sgvr2',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Other reason for starting PrEP',
                valueType: 'TEXT'),
            InputField(
                id: 'vNyGPa7FbQm',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Ever been on PrEP',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'UL0xa3Sz9ML',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Date PrEP stopped',
                valueType: 'DATE'),
            InputField(
                id: 'de4zcWiZB5j',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Indication for stopping PrEP',
                options: [
                  InputFieldOption(
                      code: 'Patient decision', name: 'Patient decision'),
                  InputFieldOption(
                      code: 'Poor adherence',
                      name: 'Poor adherence (clinician decision)'),
                  InputFieldOption(
                      code: 'New HIV diagnosis', name: 'New HIV diagnosis'),
                  InputFieldOption(
                      code: 'Patient no longer at high risk for HIV infection',
                      name:
                          'Patient no longer at high risk for HIV infection (clinician decision)'),
                  InputFieldOption(code: 'Other', name: 'Other (Specify)'),
                ],
                valueType: 'TEXT'),
            InputField(
                id: 'y7lRj3QSDkn',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Other reason for stopping PrEP',
                valueType: 'TEXT'),
            InputField(
                id: 'QInz3UAj6zC',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Date initiated on ART',
                valueType: 'DATE'),
            InputField(
                id: 'R63XVONUFeG',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Unique ART Number',
                valueType: 'NUMBER'),
            InputField(
                id: 'mPLGZsuyrvb',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Pregnancy Test',
                valueType: 'TEXT'),
            InputField(
                id: 'd9UoOBO2BWi',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Hepatitis B Screening',
                valueType: 'TEXT'),
            InputField(
                id: 'GMGpCj6Nkvd',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'RPR/VDRL  Screening',
                valueType: 'TEXT'),
            InputField(
                id: 'NIZZ0Bj3XPU',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Date of initial visit',
                valueType: 'DATE'),
          ])
    ];
  }
}
