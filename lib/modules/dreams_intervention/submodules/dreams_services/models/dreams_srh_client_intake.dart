import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamsSrhClientIntake {
  static List<FormSection> getFormSections() {
    return [
      FormSection(name: 'DEMOGRAPHICS', color: Color(0xFF737373), inputFields: [
        InputField(
            id: 'xQs4XlNTEO2',
            name: 'Channel',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'New Start site', name: 'New Start site'),
              InputFieldOption(code: 'Mobile', name: 'Mobile')
            ]),
        InputField(
            id: 'fyW1eycV9D6',
            name: 'Parity',
            valueType: 'NUMBER',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'QketZOZxXXQ',
            name: 'Alive',
            valueType: 'NUMBER',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'ab9BzpP0VjW',
            name: 'SRH Marital Status',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Married', name: 'Married'),
              InputFieldOption(code: 'Ever Married', name: 'Ever Married'),
              InputFieldOption(code: 'Never Married', name: 'Never Married')
            ]),
        InputField(
            id: 'QAA0dXmH0Oh',
            name: 'Currently working',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Employment or Self employmed',
                  name: 'Employment or Self employmed'),
              InputFieldOption(code: 'Student', name: 'Student'),
              InputFieldOption(code: 'Unemployed', name: 'Unemployed')
            ]),
        InputField(
            id: 'qtGhnXe7UFk',
            name: 'Factory/ex-factory',
            valueType: 'BOOLEAN',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373)),
        InputField(
            id: 'BvEsLzWsL3Z',
            name: 'What level of education are you now?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'None', name: 'None'),
              InputFieldOption(code: 'Primary', name: 'Primary'),
              InputFieldOption(
                  code: 'High school', name: 'High school'),
              InputFieldOption(code: 'Tertiary', name: 'Tertiary')
            ]),
        InputField(
            id: 'ukzLG0l63tw',
            name: 'What made you decide to get FP services today?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'PSI staff', name: 'PSI staff'),
              InputFieldOption(code: 'Radio or TV', name: 'Radio or TV'),
              InputFieldOption(code: 'Billboardeng', name: 'Billboardeng'),
              InputFieldOption(
                  code: 'Friends or Family members',
                  name: 'Friends or Family members'),
              InputFieldOption(code: 'Other', name: 'Other')
            ]),
               InputField(
            id: 'uLV0xy0iihA',
            name: 'Specify other reasons to decide getting Fp services',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            )
      ]),
      FormSection(
          name: 'PREVIOUS HIV TEST & TREATMENT HISTORY',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'qjMmrl5bpCx',
                name: 'Have you ever been tested for HIV?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'XZBP09HGzqn',
                name: 'when was the last time you tested?',
                valueType: 'DATE',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'kV6uCz4uLLR',
                name: 'What was the result of the most recent test?',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Positive', name: 'Positive'),
                  InputFieldOption(code: 'Negative', name: 'Negative'),
                  InputFieldOption(
                      code: 'Indeterminate', name: 'Indeterminate'),
                  InputFieldOption(code: 'Unknown', name: 'Unknown')
                ]),
            InputField(
                id: 'rE25suIpzDK',
                name: 'Are you currently on treatment (ARVs)?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UZxZebenwuv',
                name: 'HIV test provided today?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aHpvyQyfyBM',
                name: 'HIV results',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Positive', name: 'Positive'),
                  InputFieldOption(code: 'Negative', name: 'Negative')
                ]),
            InputField(
                id: 'XdF6espdxoH',
                name: 'If on treatment, which regimen',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'EKVxsIYImj6',
                name: 'Have you ever been treated for STI?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ePI1QpCOK7z',
                name: 'When was the last time?',
                valueType: 'DATE',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ny2UH7CAZQB',
                name: 'How many times have you treated STIs?',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'lGiv42qkZGL',
                name: 'Is there any burning when passing urine?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'G0B0f9YgXVR',
                name: 'Is there any itchiness of vulva?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'plr05QCyK2X',
                name: 'Is there any abnormal vaginal discharge?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'sr2fiMwz7AH',
                name: 'Are there any genital sores or rashes?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'chITH7WG2lB',
                name: 'Do you have lower abdominal pains?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          name: 'NON-COMMUNICABLE DISEASES',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'gCvMVscBNfk',
                name: 'Weight',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'x7Jzm67o0Ng',
                name: 'Height (m)',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'WeaVsrFcWne',
                name: 'Blood Pressure Systolic (mmHg)',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'RqWMrqUcDqv',
                name: 'Blood PressureDiastolic (mmHg)',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          name: 'PREVIOUS CONTRACEPTIVE METHOD USED',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'ggadxoRB4Jz',
                name: 'Family Planning counseling done?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'FvVhGwq6IjS',
                name: 'Is this your first time coming for FP services?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rZzdAKVWuRk',
                name: 'Which last method did you use?',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rmVoHRhHgXR',
                name: 'When was the last time you used that method?',
                valueType: 'DATE',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'BXW4IP4Lfe7',
                name: 'What was the reason for you to stop using that method?',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(
                      code: 'Side effect or health concerns',
                      name: 'Side effect or health concerns'),
                  InputFieldOption(
                      code: 'Desire to become pregnant',
                      name: 'Desire to become pregnant'),
                  InputFieldOption(
                      code: 'Complication or adverse Event',
                      name: 'Complication or adverse Event'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ]),
            InputField(
                id: 'Sj45q8zEcqx',
                name: 'Specify other reasons',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(
          name: 'CURRENT CONTRACEPTIVE METHOD PROVIDED',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'qhPJ02QhfaZ',
                name: 'Amount of Emergency Contraceptive pill dispensed',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'DucY6CIwUut',
                name: 'Amount of Progestin-only pills dispensed',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'EtnWra2SumZ',
                name: 'Amount of Combined Oral contraceptive Pills dispensed',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'HWBUZRghzTL',
                name: 'Amount of Injectable 1 month dispensed',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Gddy5yDkhkL',
                name: 'Amount of Injectable 2 months dispensed',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'bjvIGHq2bvc',
                name: 'Amount of Injectable 3 months dispensed',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'nAJSNqFjoPj',
                name: 'Amount of Male condom dispensed',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Uger7u9MK2k',
                name: 'Amount of Female condom dispensed',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'iGSiav4nte8',
                name: 'Amount of Lubricant dispensed',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'BvqB6eW3m1H',
                name: 'Amount of IUD 10 years dispensed',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'BBGz59Zz3on',
                name: 'Amount of Implant 3 years dispensed',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'NzCARZyHDxM',
                name: 'Amount of Implant 5 years dispensed',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'j8aQ98mYb8i',
                name: 'Specify Other contraceptive methods dispensed',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'm9nfHIBCMQr',
                name: 'TB screening conducted?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'eoJeYxA00Yk',
                name: 'TB suspected?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'C2k7GxU3P5C',
                name: 'Client referred?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aYeHcF3793X',
                name: 'Reasons for referral',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373))
          ]),
      FormSection(
          name: 'METHOD PROVISION',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
                id: 'fPNCS47GeqT',
                name: 'Method provision by occasion',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Interval', name: 'Interval'),
                  InputFieldOption(code: 'Post-partum', name: 'Post-partum'),
                  InputFieldOption(
                      code: 'Post-abortion', name: 'Post-abortion'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ])
          ])
    ];
  }
}
