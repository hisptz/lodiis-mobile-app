import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcHouseholdServicesCasePlanGaps {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          id: 'Health',
          name: 'DOMAIN HEALTH',
          color: Color(0xFF4D9E49),
          borderColor: Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'm8ujTeOcYO3',
                name: 'Identified need/Gap',
                valueType: 'TEXT',
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
                id: 'Hvq9oisH7Gt',
                name: 'WASHMES',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'pRhbAQNT0NO',
                name: '(WASHMES) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'ue6xLPEURqt',
                name: '(WASHMES) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'tQ3pKyJ0X9d',
                allowFuturePeriod: true,
                name: '(WASHMES) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'qTf8VSoojJ2',
                name: 'SOACKAGE',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'qV0BwfYa8yU',
                name: '(SOACKAGE) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'ontonbgTJ8k',
                name: '(SOACKAGE) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'M2Aqvn027cd',
                allowFuturePeriod: true,
                name: '(SOACKAGE) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'DQxqyncQtwm',
                name: 'TIPPY',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LPDcGvb5bp7',
                name: '(TIPPY) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'P4I6rK6Xqxw',
                name: '(TIPPY) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'YJXb5rSVP0L',
                allowFuturePeriod: true,
                name: '(TIPPY) Projected date for completion',
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
                id: 'm8ujTeOcYO3',
                name: 'Identified need/Gap',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'e6NV2ZAzFEh',
                name: 'SILC',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UJIxjjBeJTh',
                name: '(SILC) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'JtfKB58MvNK',
                name: '(SILC) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Hdf3EtTGfAb',
                allowFuturePeriod: true,
                name: '(SILC) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kvF996ugmMl',
                name: 'FE',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'x29nktyRKEn',
                name: '(FE) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'OMtcDA7tcVL',
                name: '(FE) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'zVCkEJuy2t8',
                allowFuturePeriod: true,
                name: '(FE) Projected date for completion',
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
                allowFuturePeriod: true,
                name: '(MARKT COOPRTVS) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WrjNxZBVHCL',
                name: 'K/TPLOTS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aUJZcOapflH',
                name: '(K/TPLOTS) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'NWBZilCPutW',
                name: '(K/TPLOTS) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'd3k97F0fS2y',
                allowFuturePeriod: true,
                name: '(K/TPLOTS) Projected date for completion',
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
                id: 'm8ujTeOcYO3',
                name: 'Identified need/Gap',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'PoxYSqq8Hgz',
                name: 'P&FC',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ond1LSLwHBC',
                name: '(P&FC) Responsible person(Internal/External)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Internal', name: 'Internal'),
                  InputFieldOption(code: 'External', name: 'External')
                ]),
            InputField(
                id: 'O3mOdzWYmg3',
                name: '(P&FC) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fCDk1LxN484',
                allowFuturePeriod: true,
                name: '(P&FC) Projected date for completion',
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
                id: 'm8ujTeOcYO3',
                name: 'Identified need/Gap',
                valueType: 'TEXT',
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
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          name: 'Other Activities',
          color: Color(0xFF4D9E49),
          borderColor: Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'm8ujTeOcYO3',
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
