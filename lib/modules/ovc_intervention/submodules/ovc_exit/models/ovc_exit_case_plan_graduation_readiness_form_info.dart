import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcExitCasePlanGraduationFormInfo {
  static List<FormSection> getFormSections({
    required String firstDate,
  }) {
    return [
      FormSection(
          name: 'Case Plan Graduation Readiness Assessment Information',
          color: const Color(0xFF0D3A16),
          inputFields: [
            InputField(
                id: 'DFPZI9TQLo1',
                name:
                    'Is this the first Case Plan Graduation Readiness Assessment?',
                translatedName:
                    'Na ke Case Plan Readiness Assessment ea pele ee?',
                valueType: 'BOOLEAN',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373)),
            InputField(
              id: 'DoltSbENAuc',
              name: 'Date of Previous Assessment',
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF737373),
              valueType: 'DATE',
              firstDate: firstDate,
            ),
            InputField(
                id: 'aU9CHJNURsH',
                name:
                    'Is this household child-headed (i.e. Household head age is less than 18 years)?',
                translatedName:
                    'Na hlooho ea lelapa lee ke ngoana? (Ha a le lilemo ka tlase ho 18)',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'AMcUQ378pJy',
                name:
                    'Does this household currently have a pregnant woman or pregnant adolescent girl?',
                translatedName:
                    'Na ho na le motho ea mmeleng ka hare ho lelapa ha hajoale?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'zpxF0UbwoFg',
                name:
                    'Does this household have a child living with disability or has chronic illness? (Note: Cancer, Diabetes, etc)',
                translatedName:
                    'Na ka hare ho lelapa lee ho na le ngoana ea phelang le bokooa kapa bokulo bo sa foleng? (joalo ka: Cancer, Diabetes, le tse ling)',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'YiEFzKZ6d4d',
                name:
                    'Does this household have an adolescent or youth enrolled in secondary school or vocational training?',
                translatedName:
                    'Na lelapa lee le na le ngoana kapa mocha ea ntse a le sekolong se mahareng kapa sa koetliso ea mesebetsi ea matsoho?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF737373),
                valueType: 'BOOLEAN')
          ]),
      FormSection(
          name: 'DOMAIN-HEALTHY BENCHMARK 1',
          color: const Color(0xFF4B9F46),
          borderColor: const Color(0xFF4B9F46),
          inputFields: [
            InputField(
                id: 'rumwEfp1ztg',
                name:
                    'Have the children at high risk of HIV been identified through the HIV risk assessment?',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF1A3518),
                valueType: 'BOOLEAN'),
            InputField(
              id: 'a10M4Wqw7U3',
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF1A3518),
              name: 'If yes indicate the date when this was done',
              valueType: 'DATE',
              firstDate: firstDate,
            ),
            InputField(
                id: 'GH9770U0uSq',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Have the child(ren) identified as high risk of HIV been referred for HIV testing services',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'eHcnm5Nn6Zo',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF1A3518),
                name:
                    'For the child(ren) identified at high risk of HIV, has documentation of all children completed referrals for HIV testing services been documented in their case file',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'f69qW9zJ1Tp',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Has the HIV status of all children in the household (positive, negative, or test not required based HIV risk assessment) been documented in their case file?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'Ddle2RGHIgV',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Is the HIV status of the caregivers (positive, negative) documented in the case file?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'bSdbmpAteTX',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF1A3518),
                name:
                    'If there is a child or children in the household older than the age of five and  living with HIV, do they know their HIV status',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'wE7and4EnCR',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF1A3518),
                name: 'Has the household achieved this benchmark 1us',
                valueType: 'BOOLEAN')
          ]),
      FormSection(
          name: 'DOMAIN-HEALTHY BENCHMARK 2',
          color: const Color(0xFF009688),
          borderColor: const Color(0xFF009688),
          inputFields: [
            InputField(
                id: 'uniJ8iIVKWC',
                name: 'HIs there HIV+ child (ren) in the households',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF1A3518),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'zPggDcmT4zt',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Is there evidence that an adolescent or woman in the household is pregnant and has been tested for HIV',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'FsX9whvb4GA',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Have you (the pregnant HIV+ adolescent / woman) been enrolled in PMTCT measures?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'yVAwsv3KoeD',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF1A3518),
                name: 'Have you or are you currently attending ANC services',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'ZqXYLhDeR8G',
                name: 'Have you adhered to ART after delivery?',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF1A3518),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'PnoBb14W732',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF1A3518),
                name:
                    'If the infant was exposed to HIV during delivery, has the infant been tested for HIV',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'SP8w6AiVGCF',
                name: 'Infant has been tested for HIV at six weeks',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF1A3518),
                renderAsRadio: true,
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'fpVryquRrCV',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF1A3518),
                renderAsRadio: true,
                name:
                    'If there is a child or children in the household older than the age of five and  living with HIV, do they know their HIV status',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'k5BHccZLAJL',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF1A3518),
                renderAsRadio: true,
                name: 'Infant has been tested for HIV at eighteen months',
                valueType: 'TRUE_ONLY'),
            InputField(
                id: 'R71zksHtVNn',
                inputColor: const Color(0xFF009688),
                labelColor: const Color(0xFF1A3518),
                name: 'Infant has been tested for HIV at eighteen months',
                valueType: 'BOOLEAN')
          ]),
      FormSection(
          name: 'DOMAIN-HEALTHY BENCHMARK 3',
          color: const Color(0xFF2196F3),
          borderColor: const Color(0xFF2196F3),
          inputFields: [
            InputField(
                id: 't22WdY2MOpE',
                name:
                    'Has the caregiver completed evidence-based parenting training or HIV messagings',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                valueType: 'BOOLEAN'),
            InputField(
                id: 'Grrvcjesu41',
                name:
                    'Is there evidence that an adolescent or woman in the household is pregnant and has been tested for HIV',
                valueType: 'NUMBER',
                renderAsRadio: true,
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No')
                ]),
            InputField(
                id: 'r9x5pcp1t9U',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                name: 'At least two behaviors that increase the risk of HIV',
                valueType: 'LONG_TEXT'),
            InputField(
                id: 'xkvrwL19c1T',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                name:
                    'At least two behaviors that can help keep you safe from HIV or from infecting another person with HIVs',
                valueType: 'LONG_TEXT'),
            InputField(
                id: 'rPSpAEnnVS4',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                name: 'Has the household achieved this benchmark 3',
                valueType: 'BOOLEAN'),
          ]),
      FormSection(
          name: 'DOMAIN-STABLE BENCHMARK 5',
          color: const Color(0xFF9C27B0),
          borderColor: const Color(0xFF9C27B0),
          inputFields: [
            InputField(
                id: 'wkrs2WI4tyc',
                name:
                    'Are you able to pay school fees/ cater for school needs for all children in your household under the age 21',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                valueType: 'BOOLEAN'),
            InputField(
              id: 'jRWqOcwnNkb',
              inputColor: const Color(0xFF9C27B0),
              labelColor: const Color(0xFF1A3518),
              name:
                  'Are you able to pay these school fees without selling productive assets (milk/ploughing cow, agricultural tools etc)',
              valueType: 'BOOLEAN',
            ),
            InputField(
                id: 'hzx5Hm23r8N',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Does the household have a regular source of income that meets their basic needs (this can include informal and formal income)',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'LxhULNWvXMw',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Have all the children in the household eaten at least two cooked meals per day for at least the past six months?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'gYudLSw0eUU',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Are you able to provide your child with a range of nutritious (at least 2 food groups) foods on a regular basis, please describe',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'iEA5kldEs11',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Is the house safe and has a place for the child(ren) to sleep? (dry, ventilated, lockable)  (based on local standards)',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'TyfgSdQproa',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Was the household able to meet unexpected expenses such as medical treatment, house repair, etc. in the last six months?',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'SU04afFbFih',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Do you know the types of critical services that exist in your community? e.g., treatments, psychosocial support, legal assistance, financial services or other protection services',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'TEhjEXSglH3',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                renderAsRadio: true,
                name:
                    'Have you or someone in your family ever accessed any critical service that exists in your community when you or someone in your family needed help in the last six months?',
                valueType: 'NUMBER',
                options: [
                  InputFieldOption(code: 1, name: 'Yes'),
                  InputFieldOption(code: 0, name: 'No')
                ]),
            InputField(
                id: 'BzpSZ5TxH7R',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Have you or someone in your family been supported to access services if you or someone in your family was sick, hurt or needed help',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'XxioqueCXcn',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name: 'Has the household achieved this benchmark 5',
                valueType: 'BOOLEAN'),
          ]),
      FormSection(
          name: 'DOMAIN-SAFE BENCHMARK 6',
          color: const Color(0xFF2196F3),
          borderColor: const Color(0xFF2196F3),
          inputFields: [
            InputField(
                id: 'dvquGMojh0M',
                name:
                    'Are all children in the household able to participate in daily activities such as eating, playing or talking with other family members or friends',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                valueType: 'BOOLEAN'),
            InputField(
              id: 'BY3fIOfHynR',
              inputColor: const Color(0xFF2196F3),
              labelColor: const Color(0xFF1A3518),
              name:
                  'If there is a child with signs of depression or mental health issues such as being withdrawn, not eating, or not playing, did they receive direct services from the project (singing to the Lions, parenting, child stimulation, CCFLS',
              valueType: 'BOOLEAN',
            ),
            InputField(
                id: 'Z4v3fDAJiE9',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                name:
                    'If there is a child with signs of depression or mental health issues such as being withdrawn, not eating, or not playing, have they been referred for services',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'hqQlsf02mTH',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                name:
                    'If the child has been referred for services, did they receive the service',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'jJzwnW4XyMy',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                name:
                    'In the last six months, have you been beaten or kicked by spouse/partner or any adult',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'ecUnojfm6I0',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Has a child been exposed to violence, abuse (sexual, physical or emotional), neglect, or exploitation',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'DXLmjVDJQCJ',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Is there any evidence that the case has been referred for child protection services (e.g CGPU, Social Development)',
                valueType: 'NUMBER',
                renderAsRadio: true,
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No')
                ]),
            InputField(
                id: 'zCIs3rB7YS0',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Is there someone or a group of people that you speak with when you are stressed or sad or want to share good news',
                valueType: 'BOOLEAN'),
            InputField(
              id: 'oF2UbAxXcoj',
              inputColor: const Color(0xFF2196F3),
              labelColor: const Color(0xFF1A3518),
              renderAsRadio: true,
              name:
                  'Has the caregiver attended or been engaged in any positive parenting sessions',
              valueType: 'BOOLEAN',
            ),
            InputField(
                id: 'eQzRNzh3AwY',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Could you please describe various ways of disciplining children? Probe; which ones do you use frequently',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'ZnVFYGoO5RB',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Do you feel that you can positively communicate with your child or adolescent and could you please give me an example',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'OcbE9kN8Dcp',
                inputColor: const Color(0xFF2196F3),
                labelColor: const Color(0xFF1A3518),
                name: 'Has the household achieved this benchmark 6',
                valueType: 'BOOLEAN'),
          ]),
      FormSection(
          name: 'DOMAIN-SCHOOLED BENCHMARK 8',
          color: const Color(0xFF9C27B0),
          borderColor: const Color(0xFF9C27B0),
          inputFields: [
            InputField(
                id: 'PkvK39frchD',
                name:
                    'Are all children between ages 6 and 17 (including above 17 in school) enrolled in school',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                valueType: 'BOOLEAN'),
            InputField(
              id: 'RVGFbzbEGmY',
              name: 'Are the enrolled children attending school regularly',
              valueType: 'BOOLEAN',
              inputColor: const Color(0xFF9C27B0),
              labelColor: const Color(0xFF1A3518),
            ),
            InputField(
                id: 'HzUAxTw1nZs',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Are all children between ages 6-17 years progressing from one level to the other in school',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'CsviqDQej1Z',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name: 'Is your child attending ECCD Centre',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'qtzegeULUAA',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name: 'If no, did the child attend Child stimulation sessions',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'doaf8WClgUy',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name:
                    'Is your adolescent regularly attending or completing vocational training',
                valueType: 'NUMBER',
                renderAsRadio: true,
                options: [
                  InputFieldOption(code: '1', name: 'Yes'),
                  InputFieldOption(code: '0', name: 'No')
                ]),
            InputField(
                id: 'sLZhFel4YAc',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name:
                    ' Does the household have the capacity to support the adolescent to complete their vocational training',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'obB7bvy6Nmh',
                inputColor: const Color(0xFF9C27B0),
                labelColor: const Color(0xFF1A3518),
                name: 'Has the household achieved this benchmark 8',
                valueType: 'BOOLEAN'),
          ]),
      FormSection(
          name: 'Case Plan Assessment Readiness Goals & Actions',
          color: const Color(0xFF4B9F46),
          inputFields: [
            InputField(
                id: 'Sw7x7QjZBJC',
                name: 'Healthy: Actions or Services to be provided',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF1A3518),
                valueType: 'LONG_TEXT'),
            InputField(
              id: 'V7w2O3LqZf0',
              allowFuturePeriod: true,
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF1A3518),
              name: 'Estimated date for Health actions or services completion',
              valueType: 'DATE',
              firstDate: firstDate,
            ),
            InputField(
                id: 'clt8ZSmmqES',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF1A3518),
                name: 'Safe: Actions or Services to be provided',
                valueType: 'LONG_TEXT'),
            InputField(
              id: 'DmTaqTuZ880',
              allowFuturePeriod: true,
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF1A3518),
              name: 'Estimated date for Safe actions or services completion',
              valueType: 'DATE',
              firstDate: firstDate,
            ),
            InputField(
                id: 'eK4frB0jbWZ',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF1A3518),
                name: 'Stable: Actions or Services to be provided',
                valueType: 'LONG_TEXT'),
            InputField(
              id: 'UTQXWRszCSg',
              allowFuturePeriod: true,
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF1A3518),
              name: 'Estimated date for Stable actions or services completion',
              valueType: 'DATE',
              firstDate: firstDate,
            ),
            InputField(
                id: 'Amzaqqx5e1S',
                inputColor: const Color(0xFF4B9F46),
                labelColor: const Color(0xFF1A3518),
                name: 'Schooled: Actions or Services to be provided',
                valueType: 'LONG_TEXT'),
            InputField(
              id: 'WiBjV85rYAf',
              allowFuturePeriod: true,
              inputColor: const Color(0xFF4B9F46),
              labelColor: const Color(0xFF1A3518),
              name:
                  'Estimated date for Schooled actions or services completion',
              valueType: 'DATE',
              firstDate: firstDate,
            ),
          ]),
    ];
  }
}
