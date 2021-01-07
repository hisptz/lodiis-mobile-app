import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcServicesChildCasePlanGaps {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'DOMAIN HEALTH',
          translatedName: 'BOPHELO BO BOTLE',
          id: 'Health',
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
                id: 'yJQi4cbzeBF',
                name: 'HIVSCREEN',
                translatedName: 'Tšebeletso ea HIVSCREEN',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'lDxuiUg9TOM',
                name: '(HIVSCREEN) Responsible person(Internal/External)',
                translatedName:
                    '(HIVSCREEN) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'iWH5MhwPSbD',
                name: '(HIVSCREEN) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa HIVSCREEN',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'DqlxkJ0dMA2',
                allowFuturePeriod: true,
                name: '(HIVSCREEN) Projected date for completion',
                translatedName: 'Letsatsi la HIVSCREEN le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'XoSPWmpWXCy',
                name: 'HTS',
                translatedName: 'Tšebeletso a HTS ',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'CxwbNfPmiN9',
                name: '(HTS) Responsible person(Internal/External)',
                translatedName:
                    '(HTS) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                name: '(HTS) Projected date for completion',
                translatedName: 'Letsatsi la HTS le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ylSjcj6cv42',
                name: 'HIVTREAT',
                translatedName: 'Tšebeletso a HIVTREAT',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JDqgRJlOSeZ',
                name: '(HIVTREAT) Responsible person(Internal/External)',
                translatedName:
                    '(HIVTREAT) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                name: 'HIVS&D',
                translatedName: 'Tšebeletso a HIVS&D ',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Fmsfd0cXF5w',
                name: '(HIVS&D) Responsible person(Internal/External)',
                translatedName:
                    '(HIVS&D) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                translatedName: 'Tšebeletso a HEALTH',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cHWpS3Pa71v',
                name: '(HEALTH) Responsible person(Internal/External)',
                translatedName:
                    '(HEALTH) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                translatedName: 'Tšebeletso a PRG&L',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HbjnW1JjroQ',
                name: '(PRG&L) Responsible person(Internal/External)',
                translatedName:
                    '(PRG&L) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                translatedName: 'Tšebeletso a SAIDS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'b3vvyHQKsoK',
                name: '(SAIDS) Responsible person(Internal/External)',
                translatedName:
                    '(SAIDS) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'x4yAqv4z2Xv',
                name: 'IMMUNIZE',
                translatedName: 'Tšebeletso a IMMUNIZE',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'B1yERoBbRzH',
                name: '(IMMUNIZE) Responsible person(Internal/External)',
                translatedName:
                    '(IMMUNIZE) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'tYYpfnshIvw',
                name: '(IMMUNIZE) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa IMMUNIZE',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'eTDE6zroxBC',
                allowFuturePeriod: true,
                name: '(IMMUNIZE) Projected date for completion',
                translatedName: 'Letsatsi la IMMUNIZE le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AM9oJCOHM7f',
                name: 'MALNU',
                translatedName: 'Tšebeletso a MALNU',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'KzxrHSAQQa0',
                name: '(MALNU) Responsible person(Internal/External)',
                translatedName:
                    '(MALNU) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'SOPRtGCfa5Z',
                name: '(MALNU) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa MALNU',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'RoJrwtEhpzk',
                allowFuturePeriod: true,
                name: '(MALNU) Projected date for completion',
                translatedName: 'Letsatsi la MALNU le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'hJUuQ648wVF',
                name: 'CCFLS',
                translatedName: 'Tšebeletso a CCFLS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'thVPqfmKo4X',
                name: '(CCFLS) Responsible person(Internal/External)',
                translatedName:
                    '(CCFLS) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'DQab5Id3WMj',
                name: '(CCFLS) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa CCFLS',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'o37J0mUPmg6',
                allowFuturePeriod: true,
                name: '(CCFLS) Projected date for completion',
                translatedName: 'Letsatsi la CCFLS le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'BJrrrqQqwQO',
                name: 'STIMULATE',
                translatedName: 'Tšebeletso a STIMULATE',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'I0s1qoxF2wl',
                name: '(STIMULATE) Responsible person(Internal/External)',
                translatedName:
                    '(STIMULATE) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'c5vtF9QMiVU',
                name: '(STIMULATE) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa STIMULATE',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'S6O1OxbLfzz',
                allowFuturePeriod: true,
                name: '(STIMULATE) Projected date for completion',
                translatedName: 'Letsatsi la STIMULATE le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LswSBpMoG5C',
                name: 'TBSCREEN',
                translatedName: 'Tšebeletso a TBSCREEN',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 't9HMcipzuSf',
                name: '(TBSCREEN) Responsible person(Internal/External)',
                translatedName:
                    '(TBSCREEN) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'Zdv3luz9Fja',
                name: '(TBSCREEN) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa TBSCREEN',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ziQvzVbjmcb',
                allowFuturePeriod: true,
                name: '(TBSCREEN) Projected date for completion',
                translatedName: 'Letsatsi la TBSCREEN le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'gCKoJgBFdob',
                name: 'TBREFER',
                translatedName: 'Tšebeletso a TBREFER',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'epF36cYU1Em',
                name: '(TBREFER) Responsible person(Internal/External)',
                translatedName:
                    '(TBREFER) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'zVUhTogG1qE',
                name: '(TBREFER) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa TBREFER',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VmuVgr4tfor',
                allowFuturePeriod: true,
                name: '(TBREFER) Projected date for completion',
                translatedName: 'Letsatsi la TBREFER le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JSQ3xP1NhuN',
                name: 'FOODPREP',
                translatedName: 'Tšebeletso ea FOODPREP',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'PVWwxGicRIl',
                name: '(FOODPREP) Responsible person(Internal/External)',
                translatedName:
                    '(FOODPREP) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'DWIqhVfMZrD',
                name: '(FOODPREP) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa FOODPREP',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'MdmCqSwcrlk',
                allowFuturePeriod: true,
                name: '(FOODPREP) Projected date for completion',
                translatedName: 'Letsatsi la FOODPREP le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AwWKp6KmqgY',
                name: 'FOODPREV',
                translatedName: 'Tšebeletso a FOODPREV',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WiJd5cYINcp',
                name: '(FOODPREV) Responsible person(Internal/External)',
                translatedName:
                    '(FOODPREV) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'jvxeGCV3VZf',
                name: '(FOODPREV) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa FOODPREV',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Mu0LxlAOoSp',
                allowFuturePeriod: true,
                name: '(FOODPREV) Projected date for completion',
                translatedName: 'Letsatsi la FOODPREV le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'EaJTFrklMo5',
                name: 'FOODSUPP',
                translatedName: 'Tšebeletso a FOODSUPP',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kyie4dHxpeC',
                name: '(FOODSUPP) Responsible person(Internal/External)',
                translatedName:
                    '(FOODSUPP) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'whcEPShYGkD',
                name: '(FOODSUPP) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa FOODSUPP',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WAq2HJHXZYS',
                allowFuturePeriod: true,
                name: '(FOODSUPP) Projected date for completion',
                translatedName: 'Letsatsi la FOODSUPP le tla phetheloa',
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
                id: 'HsxFZOuV4oZ',
                name: 'OVCFUND',
                translatedName: 'Tšebeletso a OVCFUND',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'j6rrXcnGpvo',
                name: '(OVCFUND) Responsible person(Internal/External)',
                translatedName:
                    '(OVCFUND) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'KKZBSXc1Sg3',
                name: '(OVCFUND) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa OVCFUND',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'tRxPMAXY6VC',
                allowFuturePeriod: true,
                name: '(OVCFUND) Projected date for completion',
                translatedName: 'Letsatsi la OVCFUND le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yPP7lkomNfK',
                name: 'SGROUP',
                translatedName: 'Tšebeletso a SGROUP',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'oASchGdCDjh',
                name: '(SGROUP) Responsible person(Internal/External)',
                translatedName:
                    '(SGROUP) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'ZQ6jDrZ54ic',
                name: '(SGROUP) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa SGROUP',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'vJx6vWPxGsJ',
                allowFuturePeriod: true,
                name: '(SGROUP) Projected date for completion',
                translatedName: 'Letsatsi la SGROUP le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iiJpQsEE4qx',
                name: 'EST COOPRTVS',
                translatedName: 'Tšebeletso a EST COOPRTVS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Am9LJf6APMW',
                name: '(EST COOPRTVS) Responsible person(Internal/External)',
                translatedName:
                    '(EST COOPRTVS) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                name: '(EST COOPRTVS) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa EST COOPRTVS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'nIoqbMHf3AS',
                allowFuturePeriod: true,
                name: '(EST COOPRTVS) Projected date for completion',
                translatedName: 'Letsatsi la EST COOPRTVS le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ithLHgsAoxs',
                name: 'FUNCT COOPRTVS',
                translatedName: 'Tšebeletso a FUNCT COOPRTVS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aN9rwRWUOr9',
                name: '(FUNCT COOPRTVS) Responsible person(Internal/External)',
                translatedName:
                    '(FUNCT COOPRTVS) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                    'Lebitso la motho ea ikarabellang bakeng sa FUNCT COOPRTVS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kCoBEKqJelO',
                allowFuturePeriod: true,
                name: '(FUNCT COOPRTVS) Projected date for completion',
                translatedName: 'Letsatsi la FUNCT COOPRTVS le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'JqGGsDlZh8T',
                name: 'MARKT COOPRTVS',
                translatedName: 'Tšebeletso a MARKT COOPRTVS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ixFuNoQKLoB',
                name: '(MARKT COOPRTVS) Responsible person(Internal/External)',
                translatedName:
                    '(MARKT COOPRTVS) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'uQiyym8SEvd',
                name: 'SLION',
                translatedName: 'Tšebeletso a SLION',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HfJSiIYVwn9',
                name: '(SLION ) Responsible person(Internal/External)',
                translatedName:
                    '(SLION) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'GjIU252Rcvq',
                name: '(SLION ) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa SLION',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'MEFwYLoRyPR',
                allowFuturePeriod: true,
                name: '(SLION ) Projected date for completion',
                translatedName: 'Letsatsi la SLION le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WiPTQhWLVU1',
                name: 'RTEEN',
                translatedName: 'Tšebeletso a RTEEN',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ldXiV8hkfjt',
                name: '(RTEEN) Responsible person(Internal/External)',
                translatedName:
                    '(RTEEN) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'E2CWztOcx2X',
                name: '(RTEEN) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa RTEEN',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'BpLk6ruSL7e',
                allowFuturePeriod: true,
                name: '(RTEEN) Projected date for completion',
                translatedName: 'Letsatsi la RTEEN le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'neF08iYV9Os',
                name: 'RKIDS',
                translatedName: 'Tšebeletso a RKIDS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cVOG90HglRW',
                name: '(RKIDS) Responsible person(Internal/External)',
                translatedName:
                    '(RKIDS) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'kGQwyzaP5Km',
                name: '(RKIDS) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa RKIDS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Y1ta8eJAWBT',
                allowFuturePeriod: true,
                name: '(RKIDS) Projected date for completion',
                translatedName: 'Letsatsi la RKIDS le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aPmPhwm8Zln',
                name: 'VAC',
                translatedName: 'Tšebeletso a VAC',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'xMrGYeREh1d',
                name: '(VAC) Responsible person(Internal/External)',
                translatedName:
                    '(VAC) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                translatedName: 'Tšebeletso a SURVIVORS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VL3CAgTpdqK',
                name: '(SURVIVORS) Responsible person(Internal/External)',
                translatedName:
                    '(SURVIVORS) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                name: 'COUNSEL',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'tPDgzkbmywi',
                name: '(COUNSEL) Responsible person(Internal/External)',
                translatedName:
                    '(COUNSEL) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa COUNSEL',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Io9nnYXCvWR',
                allowFuturePeriod: true,
                name: '(COUNSEL) Projected date for completion',
                translatedName: 'Letsatsi la COUNSEL le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GO3Ojp1UEX7',
                name: 'FCARE',
                translatedName: 'Tšebeletso a FCARE',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UR5q3bp0Qez',
                name: '(FCARE) Responsible person(Internal/External)',
                translatedName:
                    '(FCARE) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'kRwTftt9Nl0',
                name: '(FCARE) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa FCARE',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Trhl3lfCSA6',
                allowFuturePeriod: true,
                name: '(FCARE) Projected date for completion',
                translatedName: 'Letsatsi la FCARE le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'exHDkX1gPiC',
                name: 'SHELTER',
                translatedName: 'Tšebeletso a SHELTER',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'vis25l3jzKh',
                name: '(SHELTER) Responsible person(Internal/External)',
                translatedName:
                    '(SHELTER) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'vODRi6sq3Pn',
                name: '(SHELTER) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa SHELTER',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'MDMmtTJTIyh',
                allowFuturePeriod: true,
                name: '(SHELTER) Projected date for completion',
                translatedName: 'Letsatsi la SHELTER le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yf6KmY3Rm5I',
                name: 'ABUSE',
                translatedName: 'Tšebeletso a ABUSE',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UVuBtkjHQ95',
                name: '(ABUSE) Responsible person(Internal/External)',
                translatedName:
                    '(ABUSE) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa ABUSE',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'YtwjCoHKA9G',
                allowFuturePeriod: true,
                name: '(ABUSE) Projected date for completion',
                translatedName: 'Letsatsi la ABUSE le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WdZ3PnW5yV6',
                name: 'LEGALPROT',
                translatedName: 'Tšebeletso a LEGALPROT',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Hvvdmc2rsKl',
                name: '(LEGALPROT) Responsible person(Internal/External)',
                translatedName:
                    '(LEGALPROT) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa LEGALPROT',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'OIw6D3I6BmY',
                allowFuturePeriod: true,
                name: '(LEGALPROT) Projected date for completion',
                translatedName: 'Letsatsi la LEGALPROT le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'hS7aONLz2cq',
                name: 'BIRTHCERT',
                translatedName: 'Tšebeletso a BIRTHCERT',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'psqUATvYzdu',
                name: '(BIRTHCERT) Responsible person(Internal/External)',
                translatedName:
                    '(BIRTHCERT) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa BIRTHCERT',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'SvkvfRNqyh2',
                allowFuturePeriod: true,
                name: '(BIRTHCERT) Projected date for completion',
                translatedName: 'Letsatsi la BIRTHCERT le tla phetheloa',
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
                id: 'Cb8qzfdrg7d',
                name: 'AFLAS',
                translatedName: 'Tšebeletso a AFLAS',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'NwrsMPc0Per',
                name: '(AFLAS) Responsible person(Internal/External)',
                translatedName:
                    '(AFLAS) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'JiqD0sYv7pH',
                name: '(AFLAS) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa AFLAS',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HeoYwEJukC8',
                allowFuturePeriod: true,
                name: '(AFLAS) Projected date for completion',
                translatedName: 'Letsatsi la AFLAS le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TQSMaZgfZPO',
                name: 'PTS4G',
                translatedName: 'Tšebeletso a PTS4G',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'y9Qs6zDLZM2',
                name: '(PTS4G) Responsible person(Internal/External)',
                translatedName:
                    '(PTS4G) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                translatedName: 'Tšebeletso a PTS4NG',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LXX0ixRx2IT',
                name: '(PTS4NG) Responsible person(Internal/External)',
                translatedName:
                    '(PTS4NG) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                translatedName: 'Tšebeletso ea HWCLUB',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fVfftqUpEMa',
                name: '(HWCLUB) Responsible person(Internal/External)',
                translatedName:
                    '(HWCLUB) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'qraZh4n14S4',
                name: 'BURSARY',
                translatedName: 'Tšebeletso ea BURSARY',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'hLafgW56GqY',
                name: '(BURSARY) Responsible person(Internal/External)',
                translatedName:
                    '(BURSARY) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'dSS3xEVkH26',
                name: '(BURSARY) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa BURSARY',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ZwGE57BjVdJ',
                allowFuturePeriod: true,
                name: '(BURSARY) Projected date for completion',
                translatedName: 'Letsatsi la BURSARY le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TdReJf2LTXA',
                name: 'SFEES',
                translatedName: 'Tšebeletso a SFEES',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TdReJf2LTXA',
                name: '(SFEES) Responsible person(Internal/External)',
                translatedName:
                    '(SFEES) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'EonyCjxIh5l',
                name: '(SFEES) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa SFEES',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'YIFHsUgTAlI',
                allowFuturePeriod: true,
                name: '(SFEES) Projected date for completion',
                translatedName: 'Letsatsi la SFEES le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'q2N7p3UbvSF',
                name: 'SMATERIAL',
                translatedName: 'Tšebeletso a SMATERIAL',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VSVJitLJCmb',
                name: '(SMATERIAL) Responsible person(Internal/External)',
                translatedName:
                    '(SMATERIAL) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'XFY4FxA7ymC',
                name: '(SMATERIAL) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa SMATERIAL',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Gw1wRcsPemn',
                allowFuturePeriod: true,
                name: '(SMATERIAL) Projected date for completion',
                translatedName: 'Letsatsi la SMATERIAL le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'NcMANzhhphO',
                name: 'REENROL',
                translatedName: 'Tšebeletso a REENROL',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ZEC0IXEd8KX',
                name: '(REENROL) Responsible person(Internal/External)',
                translatedName:
                    '(REENROL) Motho ea ikarabellang (ka hare ho lelapa/ka ntle ho lelapa)',
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
                id: 'fT9sHAd6Gvw',
                name: '(REENROL) Name of responsible person',
                translatedName:
                    'Lebitso la motho ea ikarabellang bakeng sa REENROL',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GhPb5Acr00X',
                allowFuturePeriod: true,
                name: '(REENROL) Projected date for completion',
                translatedName: 'Letsatsi la REENROL le tla phetheloa',
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
                name: '(Other activities) Projected date for completion',
                translatedName: 'Letsatsi la Mesebetsi e meng le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
          ])
    ];
  }
}
