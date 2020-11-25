import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class AgywEnrollmentRiskAssessment {
  static List<String> getMandatoryField() {
    return [
      'WTZ7GLTrE8Q',
      'rSP9c21JsfC',
      'qZP982qpSPS',
      'VJiWumvINR6',
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Household Information',
          color: Color(0xFF258DCC),
          inputFields: [
            InputField(
                id: 'YQ9G0ww2cDN',
                name: 'AGYW’s father given name',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'auPInwvDZjF',
                name: 'AGYW’s mother given name',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'NrYoz8RewxV',
                name:
                    'If the AGYW comes from child headed family,Name of the Sister/Brother',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'tNdoR0jYr7R',
                name: 'Phone number',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
          ]),
      FormSection(
          name: 'Demographic Information',
          color: Color(0xFF258DCC),
          inputFields: [
            InputField(
                id: 'WTZ7GLTrE8Q',
                name: 'First Name',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 's1HaiT6OllL',
                name: 'Middle Name',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rSP9c21JsfC',
                name: 'Surname',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'qZP982qpSPS',
                name: 'Date of Birth',
                valueType: 'DATE',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ls9hlz2tyol',
                name: 'Age',
                isReadOnly: true,
                valueType: 'NUMBER',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VJiWumvINR6',
                name: 'Sex',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Male', name: 'Male'),
                  InputFieldOption(code: 'Female', name: 'Female'),
                  InputFieldOption(code: 'Transgender (male to female)', name: 'Transgender (male to female)'),
                  InputFieldOption(code: 'Transgender (female to male)', name: 'Transgender (female to male)'),
                ]),
            InputField(
                id: 's1eRvsL2Ly4',
                name: 'Marital Status.',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Married', name: 'Married'),
                  InputFieldOption(code: 'Single', name: 'Single'),
                  InputFieldOption(code: 'Widowed', name: 'Widowed'),
                  InputFieldOption(
                      code: 'Divorced/separated', name: 'Divorced/separated'),
                  InputFieldOption(code: 'Cohabiting', name: 'Cohabiting')
                ]),
            InputField(
                id: '',
                name: 'Have you been a member of',
                valueType: 'CHECK_BOX',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                renderAsRadio: true,
                options: [
                  InputFieldOption(
                      code: 'dH0hCyp67mE',
                      name: 'Parenting DREAMS intervention?'),
                  InputFieldOption(
                      code: 'auHaVN3ynaC',
                      name:
                          'Social Assessts building (Go Girls/Orgac/Aflateen/Aflatoun/PTS DREAMS intervention?'),
                  InputFieldOption(
                      code: 'EJIDVrxGMUB',
                      name: 'SILC (Socio- Economic) DREAMS intervention?'),
                  InputFieldOption(
                      code: 'g5Vyffx2vQL',
                      name: 'Steeping Stone DREAMS intervention?'),
                  InputFieldOption(
                      code: 'yNl9YGbd3ps',
                      name:
                          'Condom Promotion and Provision DREAMS intervention?'),
                  InputFieldOption(
                      code: 'F7s1XFNiEEx',
                      name: 'Contraceptive Mix DREAMS intervention?'),
                  InputFieldOption(
                      code: 'etOufdeoXVG',
                      name:
                          'HIV and Violence Prevention (LBSE) DREAMS intervention?'),
                  InputFieldOption(
                      code: 'O6aTNTaFqHx', name: 'HTS DREAMS intervention?'),
                  InputFieldOption(
                      code: 'Q0BCuDsN52v', name: 'PrEP DREAMS intervention?'),
                  InputFieldOption(
                      code: 'Ve9tcZoPoQk',
                      name: 'Post-Violence Care DREAMS intervention?'),
                  InputFieldOption(
                      code: 'IYhZVmA0ED1',
                      name:
                          'HIV Risk Assessment Messaging DREAMS intervention?'),
                  InputFieldOption(
                      code: 'PdP87EJdp8D', name: 'VMMC DREAMS intervention?'),
                  InputFieldOption(
                      code: 'uzfQwO4ypIP', name: 'ART DREAMS intervention?'),
                ])
          ]),
      FormSection(
          name: 'Risk Assessment',
          color: Color(0xFF258DCC),
          inputFields: [ 
          ],
          subSections: [
            FormSection(
              id: '1_E_H_S',
              name: '1. Ever had sex', 
              color: Color(0xFF258DCC),
              inputFields: [
                InputField(
                  id: 'fSQY2z3L0lp',
                  name: 'a. Have you ever had sex?',
                  valueType: 'BOOLEAN',
                  inputColor: Color(0xFF258DCC),
                  labelColor: Color(0xFF737373)),
                InputField(
                  id: 'UzQ533pOnvt',
                  name: 'b. How old were you when you had sex for the first time?',
                  valueType: 'TEXT',
                  inputColor: Color(0xFF258DCC),
                  labelColor: Color(0xFF737373),
                  options: [
                    InputFieldOption(code: '9-14', name: '9-14'),
                    InputFieldOption(code: '15-19', name: '15-19'),
                    InputFieldOption(code: '20-24', name: '20-24'),
                  ]),
                InputField(
                  id: 'GwVHeyOqTv2',
                  name: 'c. Do you have any sexual partner?',
                  valueType: 'BOOLEAN',
                  inputColor: Color(0xFF258DCC),
                  labelColor: Color(0xFF737373)),
                InputField(
                  id: 'T3i6bQ3tCaA',
                  name: 'd. Are you involved in any sexual activity?',
                  valueType: 'BOOLEAN',
                  inputColor: Color(0xFF258DCC),
                  labelColor: Color(0xFF737373)),
                InputField(
                    id: 'q8qPtzanSTU',
                    name:
                        'e. How many sexual partners have you had in the last 12 months?',
                    valueType: 'NUMBER',
                    inputColor: Color(0xFF258DCC),
                    labelColor: Color(0xFF737373)),
                InputField(
                    id: 'ojCwZf1iHOE',
                    name: 'f. Do you have a current sexual partner?',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF258DCC),
                    labelColor: Color(0xFF737373)),
              ]),
              FormSection(
                id: '1_M_S_P',
                name: '1. Multiple sexual patners (in the last year)', 
                color: Color(0xFF258DCC),
                inputFields: [
                  InputField(
                    id: 'fSQY2z3L0lp',
                    name: 'a. Have you ever had sex?',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF258DCC),
                    labelColor: Color(0xFF737373)),
                  InputField(
                    id: 'UzQ533pOnvt',
                    name: 'b. How old were you when you had sex for the first time?',
                    valueType: 'TEXT',
                    inputColor: Color(0xFF258DCC),
                    labelColor: Color(0xFF737373),
                    options: [
                      InputFieldOption(code: '9-14', name: '9-14'),
                      InputFieldOption(code: '15-19', name: '15-19'),
                      InputFieldOption(code: '20-24', name: '20-24'),
                    ]),
                   InputField(
                    id: 'GwVHeyOqTv2',
                    name: 'c. Do you have any sexual partner?',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF258DCC),
                    labelColor: Color(0xFF737373)),
                  InputField(
                    id: 'T3i6bQ3tCaA',
                    name: 'd. Are you involved in any sexual activity?',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF258DCC),
                    labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'q8qPtzanSTU',
                      name:
                          'e. How many sexual partners have you had in the last 12 months?',
                      valueType: 'NUMBER',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                  InputField(
                      id: 'ojCwZf1iHOE',
                      name: 'f. Do you have a current sexual partner?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
              ]),
              FormSection(
                id: '2_H_O_P',
                name: '2. History of pregnancy', 
                color: Color(0xFF258DCC),
                inputFields: [
                  InputField(
                    id: 'LNaNh7kvh4X',
                    name: 'a. Have you ever been or are you currently pregnant?',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF258DCC),
                    labelColor: Color(0xFF737373)),
                  InputField(
                    id: 'wGFmu7DhNGV',
                    name: 'b. Do you have any children?',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF258DCC),
                    labelColor: Color(0xFF737373)),
                  InputField(
                    id: 'G1s75wng5DY',
                    name: 'c. How many children do you have',
                    valueType: 'NUMBER',
                    inputColor: Color(0xFF258DCC),
                    labelColor: Color(0xFF737373)),
                ]),
                FormSection(
                  id: '3_STI',
                  name: '3. STI (diagnosed or treated)', 
                  color: Color(0xFF258DCC),
                  inputFields: [
                    InputField(
                      id: 'fyIUCi5EUtp',
                      name: 'a. Have you ever been diagnosed with any STIs?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'x9CWVcy9CZ2',
                      name: 'b. Were they treated?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                  ]),
                FormSection(
                  id: '4_N_O_I_C_U',
                  name: '4. No or irregular condom use', 
                  color: Color(0xFF258DCC),
                  inputFields: [
                    InputField(
                      id: 'bkpG276xEk9',
                      name: 'a. Do you use condoms regularly?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'afatGR9sy5Q',
                      name: 'b. Do you know where to get condoms?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'yCmbCOTbH3R',
                      name: 'c. Did you use a condom during your last sexual activity?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'VomsiFza9mn',
                      name: 'd. Are you currently taking any contraceptives?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                  ]),
                FormSection(
                  id: '4_E_O_S_V',
                  name: '4. Experience of sexual violence (lifetime)', 
                  color: Color(0xFF258DCC),
                  inputFields: [
                    InputField(
                    id: 'Dclkscej6HW',
                    name: 'a. Have you ever experienced sexual violence (lifetime)?',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF258DCC),
                    labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'VsqV6prIfm9',
                      name:
                          'b. Did you ever have someone touch you on your private parts without your concern?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'r0rKJA911ma',
                      name: 'c. Did you ever have forced sex?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'S4yWgL2zp2I',
                      name:
                          'd. Did you ever have forced unprotected sex while you wanted protected sex?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                  ]),
                FormSection(
                  id: '5_T_S',
                  name: '5. Transactional sex (including staying in a relationship for material or financial support)', 
                  color: Color(0xFF258DCC), 
                  inputFields: [   
                    InputField(
                      id: 'NhBs8uAiRPt',
                      name:
                          'a. Do you engage in sexual activities in exchange for money or any material things (including staying in a relationship for material or financial support)?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                  ]),
                FormSection(
                  id: '5_E_O_P_E_V',
                  name: '5. Experience of physical or emotional violence (Currently or within the past twelve months)', 
                  color: Color(0xFF258DCC),
                  inputFields: [
                    InputField(
                      id: 'fVJfCtBVjan',
                      name:
                          'a. Experience of physical or emotional violence (within the last year)?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)), 
                    InputField(
                      id: 'IokYFEUtSuc',
                      name: 'b. Has your partner ever hit or hurt you in any way?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'lo645exmnYG',
                      name: 'c. Has your partner ever threatened to hurt you?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'DBFA8dHsErO',
                      name:
                          'd. Do you generally feel unsafe in your current relationship with your partner?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'MeKao21EPyi',
                      name: 'e. Do/did you feel afraid of your partner in any ways?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373))
                ]),
                FormSection(
                  id: '6_E_O_S_V',
                  name: '6. Experience of sexual violence (lifetime)', 
                  color: Color(0xFF258DCC),
                  inputFields: [
                    InputField(
                    id: 'Dclkscej6HW',
                    name: 'a. Have you ever experienced sexual violence (lifetime)?',
                    valueType: 'BOOLEAN',
                    inputColor: Color(0xFF258DCC),
                    labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'fVJfCtBVjan',
                      name:
                          'b. Experience of physical or emotional violence (within the last year)?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)), 
                    InputField(
                      id: 'IokYFEUtSuc',
                      name: 'c. Has your partner ever hit or hurt you in any way?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'lo645exmnYG',
                      name: 'd. Has your partner ever threatened to hurt you?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'DBFA8dHsErO',
                      name:
                          'e. Do you generally feel unsafe in your current relationship with your partner?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'MeKao21EPyi',
                      name: 'f. Do/did you feel afraid of your partner in any ways?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373))
                  ]),
                FormSection(
                  id: '6_A_U',
                  name: '6. Alcohol use', 
                  color: Color(0xFF258DCC),
                  inputFields: [
                    InputField(
                      id: 'rsi08hlOFm8',
                      name: 'a. Have you ever or are you currently using alcohol?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'yU4tNjFpQIq',
                      name:
                          'b. During the past three months, has your use of alcohol led to health, social, legal or financial problems?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'zsivYH5qkho',
                      name: 'c. Do you ever forget things you did while using alcohol?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                  ]),
                FormSection(
                  id: '7_A_U',
                  name: '7. Alcohol use', 
                  color: Color(0xFF258DCC),
                  inputFields: [
                    InputField(
                      id: 'rsi08hlOFm8',
                      name: 'a. Have you ever or are you currently using alcohol?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'yU4tNjFpQIq',
                      name:
                          'b. During the past three months, has your use of alcohol led to health, social, legal or financial problems?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'zsivYH5qkho',
                      name: 'c. Do you ever forget things you did while using alcohol?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                  ]),
                FormSection(
                  id: '7_A_M',
                  name: '7. Alcohol misuse', 
                  color: Color(0xFF258DCC),
                  inputFields: [
                    InputField(
                      id: 'rsi08hlOFm8',
                      name: 'a. Have you ever or are you currently using alcohol?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'yU4tNjFpQIq',
                      name:
                          'b. During the past three months, has your use of alcohol led to health, social, legal or financial problems?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'zsivYH5qkho',
                      name: 'c. Do you ever forget things you did while using alcohol?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                  ]),
                FormSection(
                  id: '7_O_S',
                  name: '7. Out of school', 
                  color: Color(0xFF258DCC),
                  inputFields: [
                    InputField(
                      id: 'qTZtbRWe1Hb',
                      name:
                          'a. Are you currently enrolled in school or a vocation program?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'TJ5KB6GfZX4',
                      name: 'b. Which one',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373),
                      options: [
                        InputFieldOption(code: 'School', name: 'School'),
                        InputFieldOption(code: 'Vocational', name: 'Vocational')
                      ]),
                    InputField(
                      id: 'OA1dR8a4UWu',
                      name:
                          'c. Would you prefer re-enrolment in either school or vocational training?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                    InputField(
                      id: 'EQHcFozjbP0',
                      name: 'd. Have you ever had to drop-out then been readmitted?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF737373)),
                  ]),
                  FormSection(
                    id: '8_O_O_S',
                    name: '8. Out of school', 
                    color: Color(0xFF258DCC),
                    inputFields: [
                      InputField(
                        id: 'qTZtbRWe1Hb',
                        name:
                            'a. Are you currently enrolled in school or a vocation program?',
                        valueType: 'BOOLEAN',
                        inputColor: Color(0xFF258DCC),
                        labelColor: Color(0xFF737373)),
                      InputField(
                        id: 'TJ5KB6GfZX4',
                        name: 'b. Which one',
                        valueType: 'TEXT',
                        inputColor: Color(0xFF258DCC),
                        labelColor: Color(0xFF737373),
                        options: [
                          InputFieldOption(code: 'School', name: 'School'),
                          InputFieldOption(code: 'Vocational', name: 'Vocational')
                        ]),
                      InputField(
                        id: 'OA1dR8a4UWu',
                        name:
                            'c. Would you prefer re-enrolment in either school or vocational training?',
                        valueType: 'BOOLEAN',
                        inputColor: Color(0xFF258DCC),
                        labelColor: Color(0xFF737373)),
                      InputField(
                        id: 'EQHcFozjbP0',
                        name: 'd. Have you ever had to drop-out then been readmitted?',
                        valueType: 'BOOLEAN',
                        inputColor: Color(0xFF258DCC),
                        labelColor: Color(0xFF737373)),
                  ]),
                  FormSection(
                    id: '8_O_H',
                    name: '8. Orphanhood', 
                    color: Color(0xFF258DCC),
                    inputFields: [
                      InputField(
                            id: 'Z7PTcgqwCLu',
                            name: 'a. Are you an orphan?',
                            valueType: 'BOOLEAN',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373)),
                        InputField(
                            id: 'FuYyLjYxxkg',
                            name: 'b. Are you single or double orphan?',
                            valueType: 'TEXT',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373),
                            options: [
                          InputFieldOption(code: 'double', name: 'double'),
                          InputFieldOption(code: 'single', name: 'single')            
                            ]),
                        InputField(
                            id: 'ODBeRytTLHm',
                            name: 'c. Are you living within a child-headed household?',
                            valueType: 'BOOLEAN',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373)),
                        InputField(
                            id: 'OQS3C6pUiWH',
                            name:
                                'd. In the past 6 months, has anyone in your household had consistent formal or informal Work that generated money for the household?',
                            valueType: 'BOOLEAN',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373)),
                        InputField(
                            id: 'uBx2mRzZoRh',
                            name:
                                'e. In the past 4 weeks/30 days, was there ever no food to eat of any kind in your house because of lack of resources to get food?',
                            valueType: 'BOOLEAN',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373)),
                        InputField(
                            id: 'aIJoCMWUqBs',
                            name:
                                'f. In the past 4 weeks/30 days, did you or any household member go to sleep at night hungry because there was not enough food?',
                            valueType: 'BOOLEAN',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373)),
                        InputField(
                            id: 'zowQOCZivv8',
                            name:
                                'g. In the past 4 weeks/30 days, did you or any household member go a whole day AND night without eating anything at all because there was not enough food?',
                            valueType: 'BOOLEAN',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373)),
                    ]),
                    FormSection(
                      id: '9_O_H',
                      name: '9. Orphanhood', 
                      color: Color(0xFF258DCC),
                      inputFields: [
                        InputField(
                            id: 'Z7PTcgqwCLu',
                            name: 'a. Are you an orphan?',
                            valueType: 'BOOLEAN',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373)),
                        InputField(
                            id: 'FuYyLjYxxkg',
                            name: 'b. Are you single or double orphan?',
                            valueType: 'TEXT',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373),
                            options: [
                          InputFieldOption(code: 'double', name: 'double'),
                          InputFieldOption(code: 'single', name: 'single')            
                            ]),
                        InputField(
                            id: 'ODBeRytTLHm',
                            name: 'c. Are you living within a child-headed household?',
                            valueType: 'BOOLEAN',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373)),
                        InputField(
                            id: 'OQS3C6pUiWH',
                            name:
                                'd. In the past 6 months, has anyone in your household had consistent formal or informal Work that generated money for the household?',
                            valueType: 'BOOLEAN',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373)),
                        InputField(
                            id: 'uBx2mRzZoRh',
                            name:
                                'e. In the past 4 weeks/30 days, was there ever no food to eat of any kind in your house because of lack of resources to get food?',
                            valueType: 'BOOLEAN',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373)),
                        InputField(
                            id: 'aIJoCMWUqBs',
                            name:
                                'f. In the past 4 weeks/30 days, did you or any household member go to sleep at night hungry because there was not enough food?',
                            valueType: 'BOOLEAN',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373)),
                        InputField(
                            id: 'zowQOCZivv8',
                            name:
                                'g. In the past 4 weeks/30 days, did you or any household member go a whole day AND night without eating anything at all because there was not enough food?',
                            valueType: 'BOOLEAN',
                            inputColor: Color(0xFF258DCC),
                            labelColor: Color(0xFF737373)),
                    ]),
          ])
    ];
  }
}
