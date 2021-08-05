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
          translatedName: 'BOPHELO BO BOTLE',
          color: Color(0xFF4D9E49),
          borderColor: Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'QjlTTO5KAIf',
                name: 'Identified need/Gap',
                translatedName: 'Litlhoko kapa likhahello tse hloauoeng',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'XoSPWmpWXCy',
                translatedName: 'Tšebeletso ea  HTS',
                name: 'HTS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'CxwbNfPmiN9',
                name: '(HTS) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) HTS',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'vqf67Edjw4y',
                name: '(HTS) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa HTS',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iFv7FJeG3V1',
                allowFuturePeriod: true,
                translatedName: 'Letsatsi la HTS le tla phetheloa',
                name: '(HTS) Projected date for completion',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ylSjcj6cv42',
                name: 'HIVTREAT',
                translatedName: 'Tšebeletso ea  HIVTREAT',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JDqgRJlOSeZ',
                name: '(HIVTREAT) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) HIVTREAT',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'elqeNdaYNTS',
                name: '(HIVTREAT) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa HIVTREAT',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'qMrZcC7VvCV',
                allowFuturePeriod: true,
                name: '(HIVTREAT) Projected date for completion',
                translatedName: 'Letsatsi la HIVTREAT le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cx4xBY4jZXM',
                translatedName: 'Tšebeletso ea  HIVS&D',
                name: 'HIVS&D',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Fmsfd0cXF5w',
                name: '(HIVS&D) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) HIVS&D',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'b6hvMQuH3oJ',
                name: '(HIVS&D) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa HIVS&D',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'SIEeRmPm0Q0',
                allowFuturePeriod: true,
                name: '(HIVS&D) Projected date for completion',
                translatedName: 'Letsatsi la HIVS&D le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AxtahhoHcXV',
                name: 'HEALTH',
                translatedName: 'Tšebeletso ea  HEALTH',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cHWpS3Pa71v',
                name: '(HEALTH) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) HEALTH',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'G6GkSeccLmB',
                name: '(HEALTH) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa HEALTH',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ugZKkd3UMNF',
                allowFuturePeriod: true,
                name: '(HEALTH) Projected date for completion',
                translatedName: 'Letsatsi la HEALTH le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'd2vXxEPeCq7',
                name: 'PRG&L',
                translatedName: 'Tšebeletso ea  PRG&L',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HbjnW1JjroQ',
                name: '(PRG&L) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) PRG&L',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'GnsYKEE2fnr',
                name: '(PRG&L) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa PRG&L',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kpzlTeM0673',
                allowFuturePeriod: true,
                name: '(PRG&L) Projected date for completion',
                translatedName: 'Letsatsi la PRG&L le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'dTFLFtUUeEK',
                name: 'SAIDS',
                translatedName: 'Tšebeletso ea  SAIDS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'b3vvyHQKsoK',
                name: '(SAIDS) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) SAIDS',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'emAJOTWYHVq',
                name: '(SAIDS) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa SAIDS',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'jlu7TDN7khJ',
                allowFuturePeriod: true,
                name: '(SAIDS) Projected date for completion',
                translatedName: 'Letsatsi la SAIDS le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Hvq9oisH7Gt',
                name: 'WASHMES',
                translatedName: 'Tšebeletso ea  WASHMES',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'pRhbAQNT0NO',
                name: '(WASHMES) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) WASHMES',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'ue6xLPEURqt',
                name: '(WASHMES) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa WASHMES',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'tQ3pKyJ0X9d',
                allowFuturePeriod: true,
                name: '(WASHMES) Projected date for completion',
                translatedName: 'Letsatsi la WASHMES le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'qTf8VSoojJ2',
                name: 'SOACKAGE',
                translatedName: 'Tšebeletso ea  SOACKAGE',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'qV0BwfYa8yU',
                name: '(SOACKAGE) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) SOACKAGE',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'ontonbgTJ8k',
                name: '(SOACKAGE) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa SOACKAGE',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'M2Aqvn027cd',
                allowFuturePeriod: true,
                name: '(SOACKAGE) Projected date for completion',
                translatedName: 'Letsatsi la SOACKAGE le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'DQxqyncQtwm',
                name: 'TIPPY',
                valueType: 'TRUE_ONLY',
                translatedName: 'Tšebeletso ea  TIPPY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LPDcGvb5bp7',
                name: '(TIPPY) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) TIPPY',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'P4I6rK6Xqxw',
                name: '(TIPPY) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa TIPPY',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'YJXb5rSVP0L',
                allowFuturePeriod: true,
                name: '(TIPPY) Projected date for completion',
                translatedName: 'Letsatsi la TIPPY le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          id: 'Stable',
          name: 'DOMAIN STABLE',
          translatedName: 'BOTSITSO',
          color: Color(0xFF0000FF),
          borderColor: Color(0xFF0000FF),
          inputFields: [
            InputField(
                id: 'QjlTTO5KAIf',
                name: 'Identified need/Gap',
                translatedName: 'Litlhoko kapa likhahello tse hloauoeng',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'e6NV2ZAzFEh',
                name: 'SILC',
                valueType: 'TRUE_ONLY',
                translatedName: 'Tšebeletso ea  SILC',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UJIxjjBeJTh',
                name: '(SILC) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) SILC',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'JtfKB58MvNK',
                name: '(SILC) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa SILC',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Hdf3EtTGfAb',
                allowFuturePeriod: true,
                name: '(SILC) Projected date for completion',
                translatedName: 'Letsatsi la SILC le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kvF996ugmMl',
                name: 'FE',
                translatedName: 'Tšebeletso ea  FE',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'x29nktyRKEn',
                name: '(FE) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) FE',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'OMtcDA7tcVL',
                name: '(FE) Name of responsible person',
                translatedName: 'Lebitso la motho ea ikarabellang bakeng sa FE',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'zVCkEJuy2t8',
                allowFuturePeriod: true,
                name: '(FE) Projected date for completion',
                translatedName: 'Letsatsi la FE le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iiJpQsEE4qx',
                name: 'EST COOPRTVS',
                translatedName: 'Tšebeletso ea  EST COOPRTVS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Am9LJf6APMW',
                name: '(EST COOPRTVS) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) EST COOPRTVS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'xse9M31M9z1',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa EST COOPRTVS',
                name: '(EST COOPRTVS) Name of responsible person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'nIoqbMHf3AS',
                allowFuturePeriod: true,
                name: '(EST COOPRTVS) Projected date for completion',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa EST COOPRTVS',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ithLHgsAoxs',
                name: 'FUNCT COOPRTVS',
                translatedName: 'Tšebeletso ea  FUNCT COOPRTVS ',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aN9rwRWUOr9',
                name: '(FUNCT COOPRTVS) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) FUNCT COOPRTVS ',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'cKJggm2OXFQ',
                name: '(FUNCT COOPRTVS) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa FUNCT COOPRTVS ',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kCoBEKqJelO',
                allowFuturePeriod: true,
                name: '(FUNCT COOPRTVS) Projected date for completion',
                translatedName: 'Letsatsi la FUNCT COOPRTVS  le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JqGGsDlZh8T',
                name: 'MARKT COOPRTVS',
                translatedName: 'Tšebeletso ea  MARKT COOPRTVS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ixFuNoQKLoB',
                name: '(MARKT COOPRTVS) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) MARKT COOPRTVS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'a9geBDwDmXA',
                name: '(MARKT COOPRTVS) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa MARKT COOPRTVS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'XODRLh84TdQ',
                allowFuturePeriod: true,
                name: '(MARKT COOPRTVS) Projected date for completion',
                translatedName: 'Letsatsi la MARKT COOPRTVS le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WrjNxZBVHCL',
                name: 'K/TPLOTS',
                valueType: 'TRUE_ONLY',
                translatedName: 'Tšebeletso ea  K/TPLOTS',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aUJZcOapflH',
                name: '(K/TPLOTS) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) K/TPLOTS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'NWBZilCPutW',
                name: '(K/TPLOTS) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa K/TPLOTS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'd3k97F0fS2y',
                allowFuturePeriod: true,
                name: '(K/TPLOTS) Projected date for completion',
                translatedName: 'Letsatsi la K/TPLOTS le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(
          id: 'Safe',
          name: 'DOMAIN SAFE',
          translatedName: 'TSIRELETSO',
          color: Color(0xFF0F9587),
          borderColor: Color(0xFF0F9587),
          inputFields: [
            InputField(
                id: 'QjlTTO5KAIf',
                name: 'Identified need/Gap',
                translatedName: 'Litlhoko kapa likhahello tse hloauoeng',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'PoxYSqq8Hgz',
                name: 'P&FC',
                translatedName: 'Tšebeletso ea  P&FC ',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ond1LSLwHBC',
                name: '(P&FC) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) P&FC ',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'O3mOdzWYmg3',
                name: '(P&FC) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa P&FC ',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fCDk1LxN484',
                allowFuturePeriod: true,
                name: '(P&FC) Projected date for completion',
                translatedName: 'Letsatsi la P&FC  le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aPmPhwm8Zln',
                translatedName: 'Tšebeletso ea  VAC',
                name: 'VAC',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'xMrGYeREh1d',
                name: '(VAC) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) VAC',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'jKqWohAPqyW',
                name: '(VAC) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa VAC',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'wGrQeSydiwd',
                allowFuturePeriod: true,
                name: '(VAC) Projected date for completion',
                translatedName: 'Letsatsi la VAC le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AaqeRcyjbyS',
                name: 'VAC Legal Messaging',
                translatedName: 'Tšebeletso a VAC Legal Messaging',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'RCDsibNNIWq',
                name: '(VAC Legal Messaging) Responsible person(Internal/External)',
                translatedName:
                    '(VAC Legal Messaging) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'TizNGPP6e1d',
                name: '(VAC Legal Messaging) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa VAC Legal Messaging',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'A4xYu8BYOg7',
                allowFuturePeriod: true,
                name: '(VAC Legal Messaging) Projected date for completion',
                translatedName: 'Letsatsi la VAC Legal Messaging le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Vd8dV7OweWB',
                name: 'SURVIVORS',
                translatedName: 'Tšebeletso ea  SURVIVORS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VL3CAgTpdqK',
                name: '(SURVIVORS) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) SURVIVORS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'UDYd31rUKgN',
                name: '(SURVIVORS) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa SURVIVORS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ZO2Zg7kaYyD',
                allowFuturePeriod: true,
                name: '(SURVIVORS) Projected date for completion',
                translatedName: 'Letsatsi la SURVIVORS le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Ccp4Odlh3BE',
                translatedName: 'Tšebeletso ea  COUNSEL',
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
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
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
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
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
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
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
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
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
          translatedName:'TSA SEKOLO',
          color: Color(0xFF9B2BAE),
          borderColor: Color(0xFF9B2BAE),
          inputFields: [
            InputField(
                id: 'QjlTTO5KAIf',
                name: 'Identified need/Gap',
                translatedName: 'Litlhoko kapa likhahello tse hloauoeng',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TQSMaZgfZPO',
                name: 'PTS4G',
                translatedName: 'Tšebeletso ea  PTS4G',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'y9Qs6zDLZM2',
                name: '(PTS4G) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) PTS4G',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'do1fAllY7Jv',
                name: '(PTS4G) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa PTS4G',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'mvuyd2jt4Jz',
                allowFuturePeriod: true,
                name: '(PTS4G) Projected date for completion',
                translatedName: 'Letsatsi la PTS4G le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'SN2kJN3jAG9',
                name: 'PTS4NG',
                translatedName: 'Tšebeletso ea  PTS4NG',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LXX0ixRx2IT',
                name: '(PTS4NG) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) PTS4NG',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'k9R0AUmBqHS',
                name: '(PTS4NG) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa PTS4NG',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'bIMwh3ONDGq',
                allowFuturePeriod: true,
                name: '(PTS4NG) Projected date for completion',
                translatedName: 'Letsatsi la PTS4NG le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'X47zxNAqMv0',
                name: 'HWCLUB',
                translatedName: 'Tšebeletso ea  HWCLUB',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fVfftqUpEMa',
                name: '(HWCLUB) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) HWCLUB',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'kfcqLf2d2dc',
                name: '(HWCLUB) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa HWCLUB',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rPhOdwWvfOA',
                allowFuturePeriod: true,
                name: '(HWCLUB) Projected date for completion',
                translatedName: 'Letsatsi la HWCLUB le tla phetheloa',
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
                id: 'QjlTTO5KAIf',
                name: 'Identified need/Gap',
                translatedName: 'Litlhoko kapa likhahello tse hloauoeng',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ksc7ov3MihX',
                name: 'OTHER ACTIVITIES',
                translatedName: 'Mesebetsi e meng',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JJrN3c03i7f',
                name:
                    '(Other activities) Responsible person(Internal/External)',
                translatedName:
                    'Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa) Mesebetsi e meng',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Internal',
                      name: 'Internal',
                      translatedName: 'Ka hare ho lelapa'),
                  InputFieldOption(
                      code: 'External',
                      name: 'External',
                      translatedName: 'Ka ntle ho lelapa')
                ]),
            InputField(
                id: 'Mq7g4k4lk44',
                name: '(Other activities) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa Mesebetsi e meng',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LGsvIyYkrP8',
                allowFuturePeriod: true,
                name: '(Other activities) Projected date for completion ',
                translatedName: 'Letsatsi la Mesebetsi e meng le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
          ])
    ];
  }
}
