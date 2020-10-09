import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcServicesChildCasePlanGaps {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'DOMAIN HEALTH',
          id: 'Health',
          color: Color(0xFF4D9E49),
          borderColor: Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'QjlTTO5KAIf',
                name: 'Identified need/Gap',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yJQi4cbzeBF',
                name: 'HIVSCREEN',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'lDxuiUg9TOM',
                name: '(HIVSCREEN) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'iWH5MhwPSbD',
                name: '(HIVSCREEN) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'DqlxkJ0dMA2',
                allowFuturePeriod: true,
                name: '(HIVSCREEN) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'XoSPWmpWXCy',
                name: 'HTS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'CxwbNfPmiN9',
                name: '(HTS) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'vqf67Edjw4y',
                name: '(HTS) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iFv7FJeG3V1',
                allowFuturePeriod: true,
                name: '(HTS) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ylSjcj6cv42',
                name: 'HIVTREAT',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JDqgRJlOSeZ',
                name: '(HIVTREAT) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'elqeNdaYNTS',
                name: '(HIVTREAT) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'qMrZcC7VvCV',
                allowFuturePeriod: true,
                name: '(HIVTREAT) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cx4xBY4jZXM',
                name: 'HIVS&D',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Fmsfd0cXF5w',
                name: '(HIVS&D) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'b6hvMQuH3oJ',
                name: '(HIVS&D) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'SIEeRmPm0Q0',
                allowFuturePeriod: true,
                name: '(HIVS&D) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AxtahhoHcXV',
                name: 'HEALTH',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cHWpS3Pa71v',
                name: '(HEALTH) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'G6GkSeccLmB',
                name: '(HEALTH) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ugZKkd3UMNF',
                allowFuturePeriod: true,
                name: '(HEALTH) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'd2vXxEPeCq7',
                name: 'PRG&L',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HbjnW1JjroQ',
                name: '(PRG&L) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'GnsYKEE2fnr',
                name: '(PRG&L) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kpzlTeM0673',
                allowFuturePeriod: true,
                name: '(PRG&L) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'dTFLFtUUeEK',
                name: 'SAIDS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'b3vvyHQKsoK',
                name: '(SAIDS) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'emAJOTWYHVq',
                name: '(SAIDS) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'jlu7TDN7khJ',
                allowFuturePeriod: true,
                name: '(SAIDS) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'x4yAqv4z2Xv',
                name: 'IMMUNIZE',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'B1yERoBbRzH',
                name: '(IMMUNIZE) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'tYYpfnshIvw',
                name: '(IMMUNIZE) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'eTDE6zroxBC',
                allowFuturePeriod: true,
                name: '(IMMUNIZE) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AM9oJCOHM7f',
                name: 'MALNU',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'KzxrHSAQQa0',
                name: '(MALNU) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'SOPRtGCfa5Z',
                name: '(MALNU) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'RoJrwtEhpzk',
                allowFuturePeriod: true,
                name: '(MALNU) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'hJUuQ648wVF',
                name: 'CCFLS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'thVPqfmKo4X',
                name: '(CCFLS) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'DQab5Id3WMj',
                name: '(CCFLS) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'o37J0mUPmg6',
                allowFuturePeriod: true,
                name: '(CCFLS) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'BJrrrqQqwQO',
                name: 'STIMULATE',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'I0s1qoxF2wl',
                name: '(STIMULATE) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'c5vtF9QMiVU',
                name: '(STIMULATE) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'S6O1OxbLfzz',
                allowFuturePeriod: true,
                name: '(STIMULATE) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LswSBpMoG5C',
                name: 'TBSCREEN',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 't9HMcipzuSf',
                name: '(TBSCREEN) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'Zdv3luz9Fja',
                name: '(TBSCREEN) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ziQvzVbjmcb',
                allowFuturePeriod: true,
                name: '(TBSCREEN) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'gCKoJgBFdob',
                name: 'TBREFER',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'epF36cYU1Em',
                name: '(TBREFER) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'zVUhTogG1qE',
                name: '(TBREFER) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VmuVgr4tfor',
                allowFuturePeriod: true,
                name: '(TBREFER) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JSQ3xP1NhuN',
                name: 'FOODPREP',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'PVWwxGicRIl',
                name: '(FOODPREP) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'DWIqhVfMZrD',
                name: '(FOODPREP) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'MdmCqSwcrlk',
                allowFuturePeriod: true,
                name: '(FOODPREP) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AwWKp6KmqgY',
                name: 'FOODPREV',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WiJd5cYINcp',
                name: '(FOODPREV) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'jvxeGCV3VZf',
                name: '(FOODPREV) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Mu0LxlAOoSp',
                allowFuturePeriod: true,
                name: '(FOODPREV) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'EaJTFrklMo5',
                name: 'FOODSUPP',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kyie4dHxpeC',
                name: '(FOODSUPP) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'whcEPShYGkD',
                name: '(FOODSUPP) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WAq2HJHXZYS',
                allowFuturePeriod: true,
                name: '(FOODSUPP) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          id: 'Stable',
          name: 'DOMAIN STABLE',
          color: Color(0xFF0000FF),
          borderColor: Color(0xFF0000FF),
          inputFields: [
            InputField(
                id: 'QjlTTO5KAIf',
                name: 'Identified need/Gap',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HsxFZOuV4oZ',
                name: 'OVCFUND',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'j6rrXcnGpvo',
                name: '(OVCFUND) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'KKZBSXc1Sg3',
                name: '(OVCFUND) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'tRxPMAXY6VC',
                allowFuturePeriod: true,
                name: '(OVCFUND) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yPP7lkomNfK',
                name: 'SGROUP',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'oASchGdCDjh',
                name: '(SGROUP) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'ZQ6jDrZ54ic',
                name: '(SGROUP) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'vJx6vWPxGsJ',
                allowFuturePeriod: true,
                name: '(SGROUP) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iiJpQsEE4qx',
                name: 'EST COOPRTVS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Am9LJf6APMW',
                name: '(EST COOPRTVS) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'xse9M31M9z1',
                name: '(EST COOPRTVS) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'nIoqbMHf3AS',
                allowFuturePeriod: true,
                name: '(EST COOPRTVS) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ithLHgsAoxs',
                name: 'FUNCT COOPRTVS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aN9rwRWUOr9',
                name: '(FUNCT COOPRTVS) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'cKJggm2OXFQ',
                name: '(FUNCT COOPRTVS) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kCoBEKqJelO',
                allowFuturePeriod: true,
                name: '(FUNCT COOPRTVS) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JqGGsDlZh8T',
                name: 'MARKT COOPRTVS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ixFuNoQKLoB',
                name: '(MARKT COOPRTVS) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'a9geBDwDmXA',
                name: '(MARKT COOPRTVS) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'XODRLh84TdQ',
                allowFuturePeriod: true,
                name: '(MARKT COOPRTVS) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(
          id: 'Safe',
          name: 'DOMAIN SAFE',
          color: Color(0xFF0F9587),
          borderColor: Color(0xFF0F9587),
          inputFields: [
            InputField(
                id: 'QjlTTO5KAIf',
                name: 'Identified need/Gap',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'uQiyym8SEvd',
                name: 'SLION',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HfJSiIYVwn9',
                name: '(SLION ) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'GjIU252Rcvq',
                name: '(SLION ) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'MEFwYLoRyPR',
                allowFuturePeriod: true,
                name: '(SLION ) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WiPTQhWLVU1',
                name: 'RTEEN',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ldXiV8hkfjt',
                name: '(RTEEN) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'E2CWztOcx2X',
                name: '(RTEEN) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'BpLk6ruSL7e',
                allowFuturePeriod: true,
                name: '(RTEEN) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'neF08iYV9Os',
                name: 'RKIDS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cVOG90HglRW',
                name: '(RKIDS) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'kGQwyzaP5Km',
                name: '(RKIDS) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Y1ta8eJAWBT',
                allowFuturePeriod: true,
                name: '(RKIDS) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aPmPhwm8Zln',
                name: 'VAC',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'xMrGYeREh1d',
                name: '(VAC) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'jKqWohAPqyW',
                name: '(VAC) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'wGrQeSydiwd',
                allowFuturePeriod: true,
                name: '(VAC) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Vd8dV7OweWB',
                name: 'SURVIVORS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VL3CAgTpdqK',
                name: '(SURVIVORS) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'UDYd31rUKgN',
                name: '(SURVIVORS) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ZO2Zg7kaYyD',
                allowFuturePeriod: true,
                name: '(SURVIVORS) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Ccp4Odlh3BE',
                name: 'COUNSEL',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'tPDgzkbmywi',
                name: '(COUNSEL) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'kGoKVtkQxvk',
                name: '(COUNSEL) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Io9nnYXCvWR',
                allowFuturePeriod: true,
                name: '(COUNSEL) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GO3Ojp1UEX7',
                name: 'FCARE',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UR5q3bp0Qez',
                name: '(FCARE) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'kRwTftt9Nl0',
                name: '(FCARE) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Trhl3lfCSA6',
                allowFuturePeriod: true,
                name: '(FCARE) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'exHDkX1gPiC',
                name: 'SHELTER',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'vis25l3jzKh',
                name: '(SHELTER) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'vODRi6sq3Pn',
                name: '(SHELTER) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'MDMmtTJTIyh',
                allowFuturePeriod: true,
                name: '(SHELTER) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yf6KmY3Rm5I',
                name: 'ABUSE',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UVuBtkjHQ95',
                name: '(ABUSE) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'oth3dRYox12',
                name: '(ABUSE) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'YtwjCoHKA9G',
                allowFuturePeriod: true,
                name: '(ABUSE) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WdZ3PnW5yV6',
                name: 'LEGALPROT',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Hvvdmc2rsKl',
                name: '(LEGALPROT) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'dJR6GJyHCTr',
                name: '(LEGALPROT) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'OIw6D3I6BmY',
                allowFuturePeriod: true,
                name: '(LEGALPROT) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'hS7aONLz2cq',
                name: 'BIRTHCERT',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'psqUATvYzdu',
                name: '(BIRTHCERT) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'LDH3TLjHUYK',
                name: '(BIRTHCERT) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'SvkvfRNqyh2',
                allowFuturePeriod: true,
                name: '(BIRTHCERT) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          id: 'Schooled',
          name: 'DOMAIN SCHOOLED',
          color: Color(0xFF9B2BAE),
          borderColor: Color(0xFF9B2BAE),
          inputFields: [
            InputField(
                id: 'QjlTTO5KAIf',
                name: 'Identified need/Gap',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Cb8qzfdrg7d',
                name: 'AFLAS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'NwrsMPc0Per',
                name: '(AFLAS) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'JiqD0sYv7pH',
                name: '(AFLAS) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HeoYwEJukC8',
                allowFuturePeriod: true,
                name: '(AFLAS) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TQSMaZgfZPO',
                name: 'PTS4G',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'y9Qs6zDLZM2',
                name: '(PTS4G) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'do1fAllY7Jv',
                name: '(PTS4G) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'mvuyd2jt4Jz',
                allowFuturePeriod: true,
                name: '(PTS4G) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'SN2kJN3jAG9',
                name: 'PTS4NG',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LXX0ixRx2IT',
                name: '(PTS4NG) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'k9R0AUmBqHS',
                name: '(PTS4NG) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'bIMwh3ONDGq',
                allowFuturePeriod: true,
                name: '(PTS4NG) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'X47zxNAqMv0',
                name: 'HWCLUB',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fVfftqUpEMa',
                name: '(HWCLUB) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'kfcqLf2d2dc',
                name: '(HWCLUB) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rPhOdwWvfOA',
                allowFuturePeriod: true,
                name: '(HWCLUB) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'qraZh4n14S4',
                name: 'BURSARY',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'hLafgW56GqY',
                name: '(BURSARY) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'dSS3xEVkH26',
                name: '(BURSARY) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ZwGE57BjVdJ',
                allowFuturePeriod: true,
                name: '(BURSARY) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TdReJf2LTXA',
                name: 'SFEES',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TdReJf2LTXA',
                name: '(SFEES) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'EonyCjxIh5l',
                name: '(SFEES) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'YIFHsUgTAlI',
                allowFuturePeriod: true,
                name: '(SFEES) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'q2N7p3UbvSF',
                name: 'SMATERIAL',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VSVJitLJCmb',
                name: '(SMATERIAL) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'XFY4FxA7ymC',
                name: '(SMATERIAL) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Gw1wRcsPemn',
                allowFuturePeriod: true,
                name: '(SMATERIAL) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'NcMANzhhphO',
                name: 'REENROL',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ZEC0IXEd8KX',
                name: '(REENROL) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'fT9sHAd6Gvw',
                name: '(REENROL) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GhPb5Acr00X',
                allowFuturePeriod: true,
                name: '(REENROL) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(
          name: 'Other Activities',
          color: Color(0xFF4D9E49),
          borderColor: Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'QjlTTO5KAIf',
                name: 'Identified need/Gap',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ksc7ov3MihX',
                name: 'OTHER ACTIVITIES',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JJrN3c03i7f',
                name:
                    '(Other activities) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'Mq7g4k4lk44',
                name: '(Other activities) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LGsvIyYkrP8',
                allowFuturePeriod: true,
                name: '(Other activities) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
          ])
    ];
  }
}
