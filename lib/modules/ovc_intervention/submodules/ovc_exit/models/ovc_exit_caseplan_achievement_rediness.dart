import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcExitCasePlanAchievementRediness {
  static List<FormSection> getFormSections() {
    return [
            FormSection(
                name: 'DOMAIN:SCHOOLED',
                color: Color(0xFF9B2BAE),
                borderColor: Color(0xFF9B2BAE),
                inputFields: [
                  InputField(
                      id: 'ykWP2yOWHGa',
                      name: 'Do you regularly attend your vocational training?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF284227))
                ]),
              FormSection(
                name: 'DOMAIN:STABLE',
                color: Color(0xFF4D9E49),
                borderColor: Color(0xFF4D9E49),
                inputFields: [
                   InputField(
                      id: 'GLa2FfCqwdZ',
                      name: 'Have you or someone in your family been supported to access services if you or someone in your family was sick, hurt or needed help?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF455B44)),
                ] ),
               FormSection(
                name: 'DOMAIN:HEALTH',
                color: Color(0xFF2895F0),
                borderColor: Color(0xFF2895F0),
                inputFields: [
                 InputField(
                      id: 'EyuBnr41tuE',
                      name: 'Does the caregiver knows how many pills this child should take each day?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'YVOEE0WdyNV',
                      name: 'Can the caregiver name/identify the medication that this child take each day?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'hO6qe3pnqHw',
                      name: 'Does the caregiver remember when their child last visited the health clinic?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'MxqFxPKniYx',
                      name: 'Does the caregiver know when is their child\'s next appointment at the health clinic?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                 InputField(
                      id: 'i8uwIFKsJIc',
                      name: 'Does the caregiver know if their child/adolescent viral load is high or low?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'B0wO5j6cI7X',
                      name: 'Do you know how many pills you should take each day?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'P7h8BZtQFHi',
                      name: 'Can you name/identify the medication that you take each day?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'ivAAsGBjjIN',
                      name: 'Do you remember when you last visited the health clinic?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'ZzDA8ZSpvJu',
                      name: 'Do you know when you have your next appointment at the health clinic?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'l9HIQkANCHj',
                      name: 'Do you know if your viral load is high or low?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: '',
                      name: 'Viral load level',
                      valueType: 'CHECK_BOX',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518),
                      options: [
                        InputFieldOption(code: 'jkVk4s9DaJS', name: 'High'),
                        InputFieldOption(code: 'RbN08XDyAis', name: 'Low')
                      ]),
                InputField(
                      id: 'PmmQPR3pTkU',
                      name: 'Is there evidence that you are pregnant?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                 InputField(
                      id: 'RUeZiMeoNOk',
                      name: 'Have you delivered in the past few months/days?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                 InputField(
                      id: 'RK3fD7HvH9Q',
                      name: 'Is there evidence that you have been tested for HIV?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'wGeVdyVO5hE',
                      name: 'HIV status',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518),
                      options: [
                        InputFieldOption(code: 'Positive', name: 'Positive'),
                        InputFieldOption(code: 'Negative', name: 'Negative'),
                        InputFieldOption(code: 'Unknown', name: 'Unknown'),
                      ]),
                InputField(
                      id: 'LetMVqMZHW0',
                      name: 'Have you been enrolled in PMTCT measures?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'UxPgBn3JRBQ',
                      name: 'Have you or are you currently attending ANC services?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                 InputField(
                      id: 'ZqXYLhDeR8G',
                      name: 'Have you adhered to ART after delivery?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                 InputField(
                      id: 'YzdUhhrOhEM',
                      name: 'Is the infant was exposed to HIV during delivery?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                 InputField(
                      id: 'fffETOzhGsU',
                      name: 'Has the infant been tested for HIV?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                 InputField(
                      id: '',
                      name: 'At what age',
                      valueType: 'CHECK_BOX',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518),
                      options: [
                        InputFieldOption(code: 'gSgJKdbwTSs', name: 'Six weeks'),
                        InputFieldOption(code: 'bhXYz7AnnN7', name: 'Six months'),
                        InputFieldOption(code: 'dRiKVfftiaX', name: 'Eighteen months')
                      ]),
                InputField(
                      id: 'vo62MRNquXB',
                      name: 'Have you completed a life skills course or received information on positive communication,protection and self-care?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'FF8JcTnAelf',
                      name: 'Please tell me at least two behaviors that increase the risk of HIV?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'AI7Hm7norQN',
                      name: 'Please tell me at least two behaviors that can help keep you safe from HIV or from infecting another person with HIV.',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'B2TrxSBhN45',
                      name: 'Is the child Z score below the median score?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'vPvpyeO9ma9',
                      name: 'Is the child free of any signs of bipedal edema?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF2895F0),
                      labelColor: Color(0xFF1A3518))
                ]),
                
              FormSection(
                name: 'DOMAIN:SAFE',
                color: Color(0xFFEE6E21),
                borderColor: Color(0xFFEE6E21),
                inputFields: [
                 InputField(
                      id: 'Ba5NsLaYEkN',
                      name: 'Do you have an adult whom you share exciting or good news or ask for help if you have a problem?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFFEE6E22),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'OSbheGZm0C8',
                      name: 'Are there times you do activities together with the rest of the family members?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFFEE6E22),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'u6eVBItm5QQ',
                      name: 'Do you have someone who shows you love and affection and make you feel safe?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFFEE6E22),
                      labelColor: Color(0xFF1A3518)),
                InputField(
                      id: 'fCw5ohRmqBb',
                      name: 'In the last six months, have you been beaten or kicked by spouse/partner or any adult?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFFEE6E22),
                      labelColor: Color(0xFF1A3518)),
                 InputField(
                      id: 'nnEupGNMRPD',
                      name: 'Has a child been exposed to violence, abuse (sexual, physical or emotional), neglect, or exploitation?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFFEE6E22),
                      labelColor: Color(0xFF1A3518)),
                   InputField(
                      id: 'tVqHf7wsmnu',
                      name: 'is there any evidence that the case has been referred for child protection services (e.g CGPU, Social Development)?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFFEE6E22),
                      labelColor: Color(0xFF1A3518)),
                  InputField(
                      id: 'xABMGkOofJL',
                      name: 'Could you tell me two or three things that are wrong for somebody to do to you?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFFEE6E22),
                      labelColor: Color(0xFF1A3518)),
                  InputField(
                      id: 'P7r88fO8avr',
                      name: 'If these things were to be done to you, do you know whom you would tell to get help?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFFEE6E22),
                      labelColor: Color(0xFF1A3518)),
                   InputField(
                      id: 'OR2w18hdqx3',
                      name: 'Can you mention who you would tell to get help?',
                      valueType: 'TEXT',
                      inputColor: Color(0xFFEE6E22),
                      labelColor: Color(0xFF1A3518)),
                   InputField(
                      id: 'sOluXVUYZOa',
                      name: 'Could you please tell me one way that you try to solve problems?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFFEE6E22),
                      labelColor: Color(0xFF1A3518)),
                  InputField(
                      id: 'RIVCBJYZ3yk',
                      name: 'Is there at least one person or place besides your family you can go to when you need help?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFFEE6E22),
                      labelColor: Color(0xFF1A3518))
                ]),
            FormSection(
                name: 'ACTION POINTS',
                color: Color(0xFF1B3519),
                inputFields: [
                   InputField(
                      id: 'IeB7GmiX5l2',
                      name: 'Actions to be taken/services to be provided in health domain',
                      valueType: 'LONG_TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF455B44)),
                InputField(
                      id: 'b73ur3g5lnn',
                      allowFuturePeriod: true,
                      name: 'Estimated action date for health domain',
                      valueType: 'DATE',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF455B44)),
                InputField(
                      id: 'g8Ckc5OfS2p',
                      name: 'Actions to be taken/services to be provided in safe domain',
                      valueType: 'LONG_TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF455B44)),
                  InputField(
                      id: 'y2AXtjJo8YB',
                      allowFuturePeriod: true,
                      name: 'Estimated action date for safe domain',
                      valueType: 'DATE',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF455B44)),
                    InputField(
                      id: 'zNq52VGv7bv',
                      name: 'Actions to be taken/services to be provided in stable domain',
                      valueType: 'LONG_TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF455B44)),
                    InputField(
                      id: 'XWolMis9rdv',
                      allowFuturePeriod: true,
                      name: 'Estimated action date for stable domain',
                      valueType: 'DATE',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF455B44)),
                  InputField(
                      id: 'RuoxyTvCDI7',
                      name: 'Actions to be taken/services to be provided in schooled domain',
                      valueType: 'LONG_TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF455B44)),
                  InputField(
                      id: 'w5s66Dpufem',
                      allowFuturePeriod: true,
                      name: 'Estimated action date for schooled domain',
                      valueType: 'DATE',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF455B44)),
                ] ),

    ];
  }
}








