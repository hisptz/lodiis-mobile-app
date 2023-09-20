import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class OvcHouseholdServicesCasePlanGaps {
  static List<FormSection> getFormSections({
    required String firstDate,
  }) {
    return [
      FormSection(
          id: 'Health',
          name: 'DOMAIN HEALTH',
          translatedName: 'BOPHELO BO BOTLE',
          color: const Color(0xFF4D9E49),
          borderColor: const Color(0xFF4D9E49),
          inputFields: [
            InputField(
                id: 'XoSPWmpWXCy',
                translatedName: 'Tšebeletso ea  HTS',
                name: 'HTS',
                valueType: 'TRUE_ONLY',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'vqf67Edjw4y',
                name: '(HTS) Name of responsible internal person',
                translatedName: 'Motho ea ikarabellang ka hare ho HTS',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'bQtXR6iQyo8',
                name: '(HTS) Name of responsible external person',
                translatedName: 'Motho ea ikarabellang ka ntle ho HTS',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'iFv7FJeG3V1',
                allowFuturePeriod: true,
                translatedName: 'Letsatsi la HTS le tla phetheloa',
                name: '(HTS) Projected date for completion',
                valueType: 'DATE',
                firstDate: firstDate,
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'ylSjcj6cv42',
                name: 'HIVTREAT',
                translatedName: 'Tšebeletso ea  HIVTREAT',
                valueType: 'TRUE_ONLY',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'elqeNdaYNTS',
                name: '(HIVTREAT) Name of responsible internal person',
                translatedName: 'Motho ea ikarabellang ka hare ho HIVTREAT',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'IhzyIy3tzo0',
                name: '(HIVTREAT) Name of responsible external person',
                translatedName: 'Motho ea ikarabellang ka ntle ho HIVTREAT',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'qMrZcC7VvCV',
                allowFuturePeriod: true,
                name: '(HIVTREAT) Projected date for completion',
                translatedName: 'Letsatsi la HIVTREAT le tla phetheloa',
                valueType: 'DATE',
                firstDate: firstDate,
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'AxtahhoHcXV',
                name: 'HEALTH',
                translatedName: 'Tšebeletso ea  HEALTH',
                valueType: 'TRUE_ONLY',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'G6GkSeccLmB',
                name: '(HEALTH) Name of responsible internal person',
                translatedName: 'Motho ea ikarabellang ka hare ho HEALTH',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'GULhHDCXRvz',
                name: '(HEALTH) Name of responsible external person',
                translatedName: 'Motho ea ikarabellang ka ntle ho HEALTH',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'ugZKkd3UMNF',
                allowFuturePeriod: true,
                name: '(HEALTH) Projected date for completion',
                translatedName: 'Letsatsi la HEALTH le tla phetheloa',
                valueType: 'DATE',
                firstDate: firstDate,
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'dTFLFtUUeEK',
                name: 'SAIDS',
                translatedName: 'Tšebeletso ea  SAIDS',
                valueType: 'TRUE_ONLY',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'emAJOTWYHVq',
                name: '(SAIDS) Name of responsible internal person',
                translatedName: 'Motho ea ikarabellang ka hare ho SAIDS',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'lwa1qFrFISz',
                name: '(SAIDS) Name of responsible external person',
                translatedName: 'Motho ea ikarabellang ka ntle ho SAIDS',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'jlu7TDN7khJ',
                allowFuturePeriod: true,
                name: '(SAIDS) Projected date for completion',
                translatedName: 'Letsatsi la SAIDS le tla phetheloa',
                valueType: 'DATE',
                firstDate: firstDate,
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'EaJTFrklMo5',
                name: 'FOOD SUPPORT',
                translatedName: 'Tšebeletso ea  FOOD SUPPORT',
                valueType: 'TRUE_ONLY',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'rHgxOKM91wi',
                name: '(FOOD SUPPORT) Name of responsible internal person',
                translatedName: 'Motho ea ikarabellang ka hare ho FOOD SUPPORT',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'v00dsDvhCRu',
                name: '(FOOD SUPPORT) Name of responsible external person',
                translatedName: 'Motho ea ikarabellang ka ntle ho FOOD SUPPORT',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'WAq2HJHXZYS',
                allowFuturePeriod: true,
                name: '(FOOD SUPPORT) Projected date for completion',
                translatedName: 'Letsatsi la FOOD SUPPORT le tla phetheloa',
                valueType: 'DATE',
                firstDate: firstDate,
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'Hvq9oisH7Gt',
                name: 'WASH MESSAGING',
                translatedName: 'Tšebeletso ea  WASH MESSAGING',
                valueType: 'TRUE_ONLY',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'ue6xLPEURqt',
                name: '(WASH MESSAGING) Name of responsible internal person',
                translatedName:
                    'Motho ea ikarabellang ka hare ho WASH MESSAGING',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'vIbKIUgzBU4',
                name: '(WASH MESSAGING) Name of responsible external person',
                translatedName:
                    'Motho ea ikarabellang ka ntle ho WASH MESSAGING',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'tQ3pKyJ0X9d',
                allowFuturePeriod: true,
                name: '(WASH MESSAGING) Projected date for completion',
                translatedName: 'Letsatsi la WASH MESSAGING le tla phetheloa',
                valueType: 'DATE',
                firstDate: firstDate,
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'qTf8VSoojJ2',
                name: 'SOACKAGE PIT',
                translatedName: 'Tšebeletso ea  SOACKAGE PIT',
                valueType: 'TRUE_ONLY',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'ontonbgTJ8k',
                name: '(SOACKAGE PIT) Name of responsible internal person',
                translatedName: 'Motho ea ikarabellang ka hare ho SOACKAGE PIT',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'AjYKLfIQPtT',
                name: '(SOACKAGE PIT) Name of responsible external person',
                translatedName: 'Motho ea ikarabellang ka ntle ho SOACKAGE PIT',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'M2Aqvn027cd',
                allowFuturePeriod: true,
                name: '(SOACKAGE PIT) Projected date for completion',
                translatedName: 'Letsatsi la SOACKAGE PIT le tla phetheloa',
                valueType: 'DATE',
                firstDate: firstDate,
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'DQxqyncQtwm',
                name: 'TIPPY TAP',
                valueType: 'TRUE_ONLY',
                translatedName: 'Tšebeletso ea  TIPPY TAP',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'P4I6rK6Xqxw',
                name: '(TIPPY TAP) Name of responsible internal person',
                translatedName: 'Motho ea ikarabellang ka hare ho TIPPY TAP',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'WFKe1YpH1uK',
                name: '(TIPPY TAP) Name of responsible external person',
                translatedName: 'Motho ea ikarabellang ka ntle ho TIPPY TAP',
                valueType: 'TEXT',
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'YJXb5rSVP0L',
                allowFuturePeriod: true,
                name: '(TIPPY TAP) Projected date for completion',
                translatedName: 'Letsatsi la TIPPY TAP le tla phetheloa',
                valueType: 'DATE',
                firstDate: firstDate,
                inputColor: const Color(0xFF4D9E49),
                labelColor: const Color(0xFF737373))
          ]),
      FormSection(
          id: 'Stable',
          name: 'DOMAIN STABLE',
          translatedName: 'BOTSITSO',
          color: const Color(0xFF0000FF),
          borderColor: const Color(0xFF0000FF),
          inputFields: [
            InputField(
                id: 'e6NV2ZAzFEh',
                name: 'SILC',
                valueType: 'TRUE_ONLY',
                translatedName: 'Tšebeletso ea  SILC',
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'JtfKB58MvNK',
                name: '(SILC) Name of responsible internal person',
                translatedName: 'Motho ea ikarabellang ka hare ho SILC',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'MMjndp2xsoQ',
                name: '(SILC) Name of responsible external person',
                translatedName: 'Motho ea ikarabellang ka ntle ho SILC',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'Hdf3EtTGfAb',
                allowFuturePeriod: true,
                name: '(SILC) Projected date for completion',
                translatedName: 'Letsatsi la SILC le tla phetheloa',
                valueType: 'DATE',
                firstDate: firstDate,
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'WrjNxZBVHCL',
                name: 'K/TPLOTS',
                valueType: 'TRUE_ONLY',
                translatedName: 'Tšebeletso ea  K/TPLOTS',
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'NWBZilCPutW',
                name: '(K/TPLOTS) Name of responsible internal person',
                translatedName: 'Motho ea ikarabellang ka hare ho K/TPLOTS',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'boUUP8UeWDL',
                name: '(K/TPLOTS) Name of responsible external person',
                translatedName: 'Motho ea ikarabellang ka ntle ho K/TPLOTS',
                valueType: 'TEXT',
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373)),
            InputField(
                id: 'd3k97F0fS2y',
                allowFuturePeriod: true,
                name: '(K/TPLOTS) Projected date for completion',
                translatedName: 'Letsatsi la K/TPLOTS le tla phetheloa',
                valueType: 'DATE',
                firstDate: firstDate,
                inputColor: const Color(0xFF0000FF),
                labelColor: const Color(0xFF737373)),
          ]),
      FormSection(
        id: 'Safe',
        name: 'DOMAIN SAFE',
        translatedName: 'TSIRELETSO',
        color: const Color(0xFF0F9587),
        borderColor: const Color(0xFF0F9587),
        inputFields: [
          InputField(
              id: 'WdZ3PnW5yV6',
              name: 'LEGAL PROTECTION',
              translatedName: "TS'IRELETSO EA MOLAO",
              valueType: 'TRUE_ONLY',
              inputColor: const Color(0xFF0F9587),
              labelColor: const Color(0xFF737373)),
          InputField(
              id: 'dJR6GJyHCTr',
              name: '(LEGAL PROTECTION) Name of responsible internal person',
              translatedName:
                  'Motho ea ikarabellang ka hare ho  LEGAL PROTECTION',
              valueType: 'TEXT',
              inputColor: const Color(0xFF0F9587),
              labelColor: const Color(0xFF737373)),
          InputField(
              id: 'cu1UkUUTbME',
              name: '(LEGAL PROTECTION) Name of responsible external person',
              translatedName:
                  'Motho ea ikarabellang ka ntle ho  LEGAL PROTECTION',
              valueType: 'TEXT',
              inputColor: const Color(0xFF0F9587),
              labelColor: const Color(0xFF737373)),
          InputField(
              id: 'OIw6D3I6BmY',
              allowFuturePeriod: true,
              name: '(LEGAL PROTECTION) Projected date for completion',
              valueType: 'DATE',
              firstDate: firstDate,
              inputColor: const Color(0xFF0F9587),
              labelColor: const Color(0xFF737373)),
          InputField(
              id: 'hS7aONLz2cq',
              name: 'BIRTHCERT',
              valueType: 'TRUE_ONLY',
              inputColor: const Color(0xFF0F9587),
              labelColor: const Color(0xFF737373)),
          InputField(
              id: 'LDH3TLjHUYK',
              name: '(BIRTHCERT) Name of responsible internal person',
              translatedName: 'Motho ea ikarabellang ka hare ho BIRTHCERT',
              valueType: 'TEXT',
              inputColor: const Color(0xFF0F9587),
              labelColor: const Color(0xFF737373)),
          InputField(
              id: 'Pd5CyDu2Z54',
              name: '(BIRTHCERT) Name of responsible external person',
              translatedName: 'Motho ea ikarabellang ka ntle ho BIRTHCERT',
              valueType: 'TEXT',
              inputColor: const Color(0xFF0F9587),
              labelColor: const Color(0xFF737373)),
          InputField(
              id: 'SvkvfRNqyh2',
              allowFuturePeriod: true,
              name: '(BIRTHCERT) Projected date for completion',
              valueType: 'DATE',
              firstDate: firstDate,
              inputColor: const Color(0xFF0F9587),
              labelColor: const Color(0xFF737373))
        ],
      ),
    ];
  }
}
