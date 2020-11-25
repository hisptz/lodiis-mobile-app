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
            InputField(
                id: 'qTZtbRWe1Hb',
                name:
                    'Are you currently enrolled in school or a vocation program?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'TJ5KB6GfZX4',
                name: 'Which one',
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
                    'Would you prefer re-enrolment in either school or vocational training?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'EQHcFozjbP0',
                name: 'Have you ever had to drop-out then been readmitted?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Z7PTcgqwCLu',
                name: 'Are you an orphan?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'FuYyLjYxxkg',
                name: 'Are you single or double orphan?',
                valueType: 'TEXT',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),
                 options: [
              InputFieldOption(code: 'double', name: 'double'),
              InputFieldOption(code: 'single', name: 'single')            
                ]
                
                
                
                ),
            InputField(
                id: 'ODBeRytTLHm',
                name: 'Are you living within a child-headed household?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'OQS3C6pUiWH',
                name:
                    'In the past 6 months, has anyone in your household had consistent formal or informal Work that generated money for the household?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'uBx2mRzZoRh',
                name:
                    'In the past 4 weeks/30 days, was there ever no food to eat of any kind in your house because of lack of resources to get food?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'aIJoCMWUqBs',
                name:
                    'In the past 4 weeks/30 days, did you or any household member go to sleep at night hungry because there was not enough food?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'zowQOCZivv8',
                name:
                    'In the past 4 weeks/30 days, did you or any household member go a whole day AND night without eating anything at all because there was not enough food?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rsi08hlOFm8',
                name: 'Have you ever or are you currently using alcohol?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yU4tNjFpQIq',
                name:
                    'During the past three months, has your use of alcohol led to health, social, legal or financial problems?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'zsivYH5qkho',
                name: 'Do you ever forget things you did while using alcohol?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fSQY2z3L0lp',
                name: 'Have you ever had sex?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'GwVHeyOqTv2',
                name: 'Do you have any sexual partner?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'T3i6bQ3tCaA',
                name: 'Are you involved in any sexual activity?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'UzQ533pOnvt',
                name: 'How old were you when you had sex for the first time?',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'q8qPtzanSTU',
                name:
                    'How many sexual partners have you had in the last 12 months?',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ojCwZf1iHOE',
                name: 'Do you have a current sexual partner?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fyIUCi5EUtp',
                name: 'Have you ever been diagnosed with any STIs?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'x9CWVcy9CZ2',
                name: 'Were they treated?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VsqV6prIfm9',
                name:
                    'Did you ever have someone touch you on your private parts?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'r0rKJA911ma',
                name: 'Did you ever have forced sex?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'S4yWgL2zp2I',
                name:
                    'Did you ever have forced unprotected sex while you wanted protected sex?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'LNaNh7kvh4X',
                name: 'Have you ever been or are you currently pregnant?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'wGFmu7DhNGV',
                name: 'Do you have any children?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'G1s75wng5DY',
                name: 'How many children do you have',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'bkpG276xEk9',
                name: 'Do you use condoms regularly?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'afatGR9sy5Q',
                name: 'Do you know where to get condoms?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'yCmbCOTbH3R',
                name: 'Did you use a condom during your last sexual activity?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'VomsiFza9mn',
                name: 'Are you currently taking any contraceptives?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'NhBs8uAiRPt',
                name:
                    'Do you engage in sexual activities in exchange for money or any material things (including staying in a relationship for material or financial support)?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Dclkscej6HW',
                name: 'Have you ever experienced sexual violence (lifetime)?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'fVJfCtBVjan',
                name:
                    'Experience of physical or emotional violence (within the last year)?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'IokYFEUtSuc',
                name: 'Has your partner ever hit or hurt you in any way?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'lo645exmnYG',
                name: 'Has your partner ever threatened to hurt you?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'DBFA8dHsErO',
                name:
                    'Do you generally feel unsafe in your current relationship with your partner?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'MeKao21EPyi',
                name: 'Do/did you feel afraid of your partner in any ways?',
                valueType: 'BOOLEAN',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373))
          ])
    ];
  }
}
