import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcServicesCasePlanGaps {
  static List<FormSection> getFormSections() {
    return [
       FormSection(
                name: 'CASE PLAN: GAPS',
                color: Color(0xFF4D9E49),
                inputFields: [
                InputField(
                      id: 'QjlTTO5KAIf',
                      name: 'Identified need/Gap',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373)
                     )]),
       FormSection(
                name: 'DOMAIN HEALTH',
                color: Color(0xFF4D9E49),
                borderColor: Color(0xFF4D9E49),
                inputFields: [
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
                      name: '(HIVSCREEN) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(HTS) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(HIVTREAT) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(HIVS&D) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(HEALTH) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(PRG&L) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(SAIDS) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(IMMUNIZE) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(MALNU) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(CCFLS) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(STIMULATE) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(TBSCREEN) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(TBREFER) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(FOODPREP) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(FOODPREV) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(FOODSUPP) Projected date for completion',
                      valueType: 'DATE',
                      inputColor: Color(0xFF4D9E49),
                      labelColor: Color(0xFF737373))
                ]),
             FormSection(
                name: 'DOMAIN STABLE',
                color: Color(0xFF0000FF),
                borderColor: Color(0xFF0000FF),
                inputFields: [
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
                      name: '(OVCFUND) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(SGROUP) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(EST COOPRTVS) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(FUNCT COOPRTVS) Projected date for completion',
                      valueType: 'DATE',
                      inputColor: Color(0xFF0000FF),
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
                      name: '(MARKT COOPRTVS) Projected date for completion',
                      valueType: 'DATE',
                      inputColor: Color(0xFF0000FF),
                      labelColor: Color(0xFF737373)),
                ]),
             FormSection(
                name: 'DOMAIN SAFE',
                color: Color(0xFF0F9587),
                borderColor: Color(0xFF0F9587),
                inputFields: [
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
                      name: '(SLION ) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(RTEEN) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(RKIDS) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(VAC) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(SURVIVORS) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(COUNSEL) Projected date for completion',
                      valueType: 'DATE',
                      inputColor: Color(0xFF0F9587),
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
                      name: '(FCARE) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(SHELTER) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(ABUSE) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(LEGALPROT) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(BIRTHCERT) Projected date for completion',
                      valueType: 'DATE',
                      inputColor: Color(0xFF0F9587),
                      labelColor: Color(0xFF737373))
                ]),
              FormSection(
                name: 'DOMAIN SCHOOLED',
                color: Color(0xFF9B2BAE),
                borderColor: Color(0xFF9B2BAE),
                inputFields: [
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
                      name: '(AFLAS) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(PTS4G) Projected date for completion',
                      valueType: 'DATE',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                InputField(
                      id: '',
                      name: '(PTS4NG) Responsible person(Internal/External)',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'Internal', name: 'Internal'),
                        InputFieldOption(code: 'External', name: 'External')
                      ]),
                 InputField(
                      id: '',
                      name: '(PTS4NG) Name of responsible person',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                 InputField(
                      id: '',
                      name: '(PTS4NG) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(HWCLUB) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(BURSARY) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(SFEES) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(SMATERIAL) Projected date for completion',
                      valueType: 'DATE',
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
                      name: '(REENROL) Projected date for completion',
                      valueType: 'DATE',
                      inputColor: Color(0xFF9B2BAE),
                      labelColor: Color(0xFF737373)),
                ]),
        ];
  }
}
