import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

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
                id: 'vqf67Edjw4y',
                name: '(HTS) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa HTS',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'bQtXR6iQyo8',
                name: '(HTS) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa HTS',
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
                id: 'elqeNdaYNTS',
                name: '(HIVTREAT) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa HIVTREAT',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'IhzyIy3tzo0',
                name: '(HIVTREAT) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa HIVTREAT',
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
                translatedName: 'Tšebeletso ea  HIVS&D/HIV Messaging',
                name: 'HIVS&D/HIV Messaging',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'b6hvMQuH3oJ',
                name:
                    '(HIVS&D/HIV Messaging) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa HIVS&D/HIV Messaging',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iy0KZ7K4qld',
                name:
                    '(HIVS&D/HIV Messaging) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa HIVS&D/HIV Messaging',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'SIEeRmPm0Q0',
                allowFuturePeriod: true,
                name: '(HIVS&D/HIV Messaging) Projected date for completion',
                translatedName:
                    'Letsatsi la HIVS&D/HIV Messaging le tla phetheloa',
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
                id: 'G6GkSeccLmB',
                name: '(HEALTH) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa HEALTH',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GULhHDCXRvz',
                name: '(HEALTH) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa HEALTH',
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
                id: 'GnsYKEE2fnr',
                name: '(PRG&L) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa PRG&L',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'X2CA3iQZU74',
                name: '(PRG&L) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa HEALTH',
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
                id: 'emAJOTWYHVq',
                name: '(SAIDS) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa SAIDS',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'lwa1qFrFISz',
                name: '(SAIDS) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa SAIDS',
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
                id: 'ue6xLPEURqt',
                name: '(WASHMES) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa WASHMES',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'vIbKIUgzBU4',
                name: '(WASHMES) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa WASHMES',
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
                id: 'ontonbgTJ8k',
                name: '(SOACKAGE) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa SOACKAGE',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'AjYKLfIQPtT',
                name: '(SOACKAGE) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa SOACKAGE',
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
                id: 'P4I6rK6Xqxw',
                name: '(TIPPY) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa TIPPY',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WFKe1YpH1uK',
                name: '(TIPPY) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa TIPPY',
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
                id: 'JtfKB58MvNK',
                name: '(SILC) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa SILC',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'MMjndp2xsoQ',
                name: '(SILC) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa SILC',
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
                name: 'Financial Education',
                translatedName: 'Tšebeletso ea  Financial Education',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'OMtcDA7tcVL',
                name:
                    '(Financial Education) Name of responsible internal person',
                // translatedName: 'Lebitso la motho ea ikarabellang bakeng sa FE',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Mz24UpWclb3',
                name:
                    '(Financial Education) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa FE',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'zVCkEJuy2t8',
                allowFuturePeriod: true,
                name: '(Financial Education) Projected date for completion',
                translatedName:
                    'Letsatsi la Financial Education le tla phetheloa',
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
                id: 'xse9M31M9z1',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa EST COOPRTVS',
                name: '(EST COOPRTVS) Name of responsible internal person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'uLi7eqd0eEy',
                name: '(EST COOPRTVS) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa EST COOPRTVS',
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
                id: 'cKJggm2OXFQ',
                name: '(FUNCT COOPRTVS) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa FUNCT COOPRTVS ',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'NUXAxwvM3FE',
                name: '(FUNCT COOPRTVS) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa FUNCT COOPRTVS',
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
                id: 'a9geBDwDmXA',
                name: '(MARKT COOPRTVS) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa MARKT COOPRTVS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 's5mJvzRyfmW',
                name: '(MARKT COOPRTVS) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa MARKT COOPRTVS',
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
                id: 'NWBZilCPutW',
                name: '(K/TPLOTS) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa K/TPLOTS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0000FF),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'boUUP8UeWDL',
                name: '(K/TPLOTS) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa K/TPLOTS',
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
                id: 'O3mOdzWYmg3',
                name: '(P&FC) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa P&FC ',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WFscqdyjgUy',
                name: '(P&FC) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa P&FC',
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
                translatedName: 'Tšebeletso ea  VAC/VAC Messaging',
                name: 'VAC/VAC Messaging',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'jKqWohAPqyW',
                name: '(VAC/VAC MessagingVAC) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa VAC',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'U8jnyQsnfBD',
                name: '(VAC/VAC Messaging) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa VAC',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'wGrQeSydiwd',
                allowFuturePeriod: true,
                name: '(VAC/VAC Messaging) Projected date for completion',
                translatedName: 'Letsatsi la VAC/VAC Messaging le tla phetheloa',
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
                id: 'TizNGPP6e1d',
                name:
                    '(VAC Legal Messaging) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa VAC Legal Messaging',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Q7GxvZD6h99',
                name:
                    '(VAC Legal Messaging) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa VAC Legal Messaging',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'A4xYu8BYOg7',
                allowFuturePeriod: true,
                name: '(VAC Legal Messaging) Projected date for completion',
                translatedName:
                    'Letsatsi la VAC Legal Messaging le tla phetheloa',
                valueType: 'DATE',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Vd8dV7OweWB',
                name: 'Survivors of Abuse',
                translatedName: 'Tšebeletso ea  Survivors of Abuse',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UDYd31rUKgN',
                name:
                    '(Survivors of Abuse) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa SURVIVORS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'XvOgqGxX39f',
                name:
                    '(Survivors of Abuse) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa SURVIVORS',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ZO2Zg7kaYyD',
                allowFuturePeriod: true,
                name: '(Survivors of Abuse) Projected date for completion',
                translatedName:
                    'Letsatsi la Survivors of Abuse le tla phetheloa',
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
                id: 'kGoKVtkQxvk',
                name: '(COUNSEL) Name of responsible internal person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yoI0bu18mPo',
                name: '(COUNSEL) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa COUNSEL',
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
                id: 'oth3dRYox12',
                name: '(ABUSE) Name of responsible internal person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'RsCebbDkMx9',
                name: '(ABUSE) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa ABUSE',
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
                id: 'dJR6GJyHCTr',
                name: '(LEGALPROT) Name of responsible internal person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'cu1UkUUTbME',
                name: '(LEGALPROT) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa LEGALPROT',
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
                id: 'LDH3TLjHUYK',
                name: '(BIRTHCERT) Name of responsible internal person',
                valueType: 'TEXT',
                inputColor: Color(0xFF0F9587),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Pd5CyDu2Z54',
                name: '(BIRTHCERT) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa BIRTHCERT',
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
          translatedName: 'TSA SEKOLO',
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
                id: 'do1fAllY7Jv',
                name: '(PTS4G) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa PTS4G',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'y5v9t8Skiyi',
                name: '(PTS4G) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa PTS4G',
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
                id: 'k9R0AUmBqHS',
                name: '(PTS4NG) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa PTS4NG',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'k2eUheeYmfk',
                name: '(PTS4NG) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa PTS4NG',
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
                id: 'kfcqLf2d2dc',
                name: '(HWCLUB) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa HWCLUB',
                valueType: 'TEXT',
                inputColor: Color(0xFF9B2BAE),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ewpLauNhb8N',
                name: '(HWCLUB) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa HWCLUB',
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
                id: 'Mq7g4k4lk44',
                name: '(Other activities) Name of responsible internal person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa Mesebetsi e meng',
                valueType: 'TEXT',
                inputColor: Color(0xFF4D9E49),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'XSTUvAjvijB',
                name: '(Other activities) Name of responsible external person',
                // translatedName:
                //     'Lebitso la motho ea ikarabellang bakeng sa Other activities',
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
