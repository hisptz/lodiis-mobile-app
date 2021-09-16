import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamsServicePrepIntakeInfo {
  static List<String> getCheckboxInputFieldOptions(
      List<FormSection> formSections) {
    List<String> inputFieldOptions = [];
    for (FormSection section in formSections) {
      for (InputField field in section.inputFields!) {
        if (field.valueType == 'CHECK_BOX') {
          for (InputFieldOption option in field.options!) {
            inputFieldOptions.add(option.code);
          }
        }
      }
    }
    return inputFieldOptions;
  }

  static List<String> getMandatoryField() {
    const excludedFields = [
      'UL0xa3Sz9ML',
      'de4zcWiZB5j',
      'XfB60ruQI3I',
      'W8LTmGz13QM',
      'Ihu2PjZMh8B'
    ];
    List<String> inputFields = FormUtil.getFormFieldIds(getFormSections());
    List<String> optionalFields =
        getCheckboxInputFieldOptions(getFormSections());
    inputFields = inputFields
        .where((field) => optionalFields.indexOf(field) < 0)
        .toList()
        .where((field) => excludedFields.indexOf(field) < 0)
        .toList();
    return inputFields;
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          id: 'PeSfSRaE',
          name: '1. Facility Information',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'BrcTtRhrxXp',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                allowedSelectedLevels: [4],
                name: 'Facility Name',
                showCountryLevelTree: true,
                valueType: 'ORGANISATION_UNIT'),
            InputField(
                id: 'uHrSSJghmTS',
                name: 'Entry point /Reason for visiting facility',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                valueType: 'TEXT'),
            InputField(
              id: 'rprU5DII5Aw',
              allowFuturePeriod: true,
              name: 'Date of initial client visit',
              valueType: 'DATE',
              inputColor: Color(0xFF1F8ECE),
              labelColor: Color(0xFF737373),
            ),
          ]),
      FormSection(
          id: 'PeSfSRaE',
          name: '3. Client Demographics',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'kK8Gt6LA8QM',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Current gender',
                options: [
                  InputFieldOption(code: 'Male', name: 'Male'),
                  InputFieldOption(code: 'Female', name: 'Female'),
                  InputFieldOption(
                      code: 'Transgender (male to female)',
                      name: 'Transgender (male to female)'),
                  InputFieldOption(
                      code: 'Transgender (female to male)',
                      name: 'Transgender (female to male)'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ],
                valueType: 'TEXT'),
            InputField(
                id: 'gufQ1ELVqcS',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Other current gender',
                valueType: 'TEXT'),
            InputField(
                id: 'gCvMVscBNfk',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Weight',
                suffixLabel: 'Kg',
                valueType: 'NUMBER'),
            InputField(
                id: 'WeaVsrFcWne',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Blood Pressure Systolic (mmHg)',
                suffixLabel: 'mmHg',
                valueType: 'NUMBER'),
            InputField(
                id: 'RqWMrqUcDqv',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Blood Pressure Diastolic (mmHg)',
                suffixLabel: 'mmHg',
                valueType: 'NUMBER'),
            InputField(
                id: 'd3zHELPzSaH',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Temperature',
                valueType: 'TEXT'),
          ]),
      FormSection(
          id: 'PeSfSRaE',
          name: '4. Recent Exposure to HIV. Ask, "In the last 30 days"...',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'YQI32r1MQxA',
                description:
                    '*If ONLY reporting sex without a condom, consider post-exposure prophylaxis (PEP). Refer to ART guidelines for management.',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: "Don't Know", name: "Don't Know"),
                ],
                name:
                    'Have you had sex without a condom with someone living with HIV who is not on treatment',
                valueType: 'TEXT'),
          ]),
      FormSection(
          id: 'PeSfSRaE',
          name: '5. Assessment for acute HIV syndrome',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'pQaAQdJnE1w',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: "Don't Know", name: "Don't Know"),
                ],
                name:
                    'Have you had condom-less sex or other high risk HIV exposure in the past 2  6 weeks',
                valueType: 'TEXT'),
            InputField(
                id: 'DobfAIMBOvy',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                description:
                    'If reporting sex without a condom in the past 2 to 6 weeks and  has flu-like symptoms, an acute HIV infection might be suspected and further investigation is required; \n DO NOT offer PrEP or PEP and conduct further HIV testingIf a more sensitive test e.g. \n DNA PCR is available with results available within 2 weeks conduct the more sensitive test.If more sensitive test e.g. \n DNA PCR is not available, ask the client to come back after 4 weeks for repeat rapid HIV test.',
                options: [
                  InputFieldOption(code: 'Yes', name: 'Yes'),
                  InputFieldOption(code: 'No', name: 'No'),
                  InputFieldOption(code: "Don't Know", name: "Don't Know"),
                ],
                name:
                    'Have you had a cold or flu, runny nose, fatigue, malaise, headache, sore throat, mouth sores, lymphadenopathy, skin rash, myalgia( muscle pain), arthralgia(joint pain)',
                valueType: 'TEXT'),
          ]),
      FormSection(
          id: 'PeSfSRaE',
          name:
              '6. Contraindications for PrEP. If any of the contraindications are present do not offer PrEP',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'jpbLNWRjUJK',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Is the client currently taking nephrotoxic drugs. Refer to creatinine clearance job aid for list of nephrotoxic drugs. Consult doctor about alternative medication/management before initiating PrEP',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'bH9DpJOIutM',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Has creatinine clearance (eGFR) <60 ml/min',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'h0P6UfkUvLP',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Weight below 35kg',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'POaEWdS7Lw5',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Allergy or contraindication to any medicine in the PrEP regimen',
                valueType: 'BOOLEAN'),
          ]),
      FormSection(
          id: 'PeSfSRaE',
          name: '7. PrEP Eligibility',
          description: 'If all answers in this section are yes, offer PrEP.',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'veoA322323t',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'HIV-negative',
                isReadOnly: true,
                valueType: 'BOOLEAN'),
            InputField(
                id: 'vMR9VtzuH3R',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Date tested',
                valueType: 'DATE'),
            InputField(
                id: 'qgNIIJBeMBT',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Type of test used',
                options: [
                  InputFieldOption(code: 'Determine', name: 'Determine'),
                  InputFieldOption(code: 'Unigold', name: 'Unigold'),
                  InputFieldOption(code: 'Elisa', name: 'Elisa'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ],
                valueType: 'TEXT'),
            InputField(
                id: 'gDlQ3IThgzH',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Other type of test used',
                valueType: 'TEXT'),
            InputField(
                id: 'AkuZ9MSPfZ4',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'At substantial risk of HIV',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'qibwngZ6fd5',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Has no signs/symptoms of acute HIV infection',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'JBmwR9pBO4I',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'Has creatinine clearance (eGFR) >60 ml/min or patient has no risk factors for renal disease and the creatinine result is pending (see Creatinine clearance job aid for risk factors)',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'Ihu2PjZMh8B',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'eGFR Result',
                valueType: 'TEXT'),
            InputField(
                id: 'W8LTmGz13QM',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Creatinine clearance (calculated)',
                valueType: 'TEXT'),
            InputField(
                id: 'XfB60ruQI3I',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Date Creatinine clearance (calculated)',
                valueType: 'DATE'),
          ]),
      FormSection(
          id: 'PeSfSRaE',
          name: '8. Services Received by Client',
          color: Color(0xFF1F8ECE),
          inputFields: [
            InputField(
                id: 'D0tq5I6jgLk',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'PrEP initiated',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'q9dpokR3G1q',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Initiated on PEP',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'rZov68n0pzv',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'To start PrEP after completing PEP',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'kqDlnMhTKTd',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name:
                    'PCR/HIV Ag test or follow-up HIV re-testing (if suspicion of acute HIV infection)',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'B8jihEQnoJG',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Client declined PrEP',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'ov7UEdiyjJA',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Referred for PrEP at another facility',
                valueType: 'BOOLEAN'),
            InputField(
                id: 'dpfubDzhwhX',
                inputColor: Color(0xFF1F8ECE),
                labelColor: Color(0xFF737373),
                name: 'Name of facility PrEP referred',
                allowedSelectedLevels: [4],
                showCountryLevelTree: true,
                valueType: 'ORGANISATION_UNIT'),
          ]),
      // FormSection(
      //     id: 'BsLnIfmtn',
      //     name: ' Baseline Information',
      //     color: Color(0xFF1F8ECE),
      //     inputFields: [
      //       InputField(
      //           id: 'tNPOFcRu6Uj',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'PrEP Patient Number',
      //           valueType: 'NUMBER'),
      //       InputField(
      //           id: 'NpeW9958TcF',
      //           name: 'Entry point for PrEP(community)',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           options: [
      //             InputFieldOption(
      //                 code: 'Health facility outreach',
      //                 name: 'Health facility outreach'),
      //             InputFieldOption(
      //                 code: 'Community program',
      //                 name: 'Community program (Specify)'),
      //           ],
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'GqTYUcdyFv0',
      //           name: 'Entry point for PrEP(Health facility)',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           options: [
      //             InputFieldOption(
      //                 code: 'Adolescent corner/clinic',
      //                 name: 'Adolescent corner/clinic'),
      //             InputFieldOption(code: 'ART', name: 'ART'),
      //             InputFieldOption(code: 'OPD', name: 'OPD'),
      //             InputFieldOption(code: 'Other', name: 'Other'),
      //           ],
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'uPpYQM3rAZ2',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Other entry point for PrEP',
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'BFTG6ilADjd',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name:
      //               'Date of most recent negative HIV test before PrEP initiation',
      //           valueType: 'DATE'),
      //       InputField(
      //           id: 'mSUNOhSO4c4',
      //           allowFuturePeriod: true,
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Date of PrEP initiation',
      //           valueType: 'DATE'),
      //       InputField(
      //           id: 'qMaqhDQAoGj',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Baseline creatinine',
      //           valueType: 'NUMBER'),
      //       InputField(
      //           id: 'OmMTgtlqlYQ',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'CrCL',
      //           valueType: 'NUMBER'),
      //       InputField(
      //           id: 'OlDYLVf0bRA',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Indication for starting PrEP',
      //           options: [
      //             InputFieldOption(
      //                 code: 'Currently exchanges sex for money',
      //                 name: 'Currently exchanges sex for money'),
      //             InputFieldOption(
      //                 code: 'Currently pays for sex',
      //                 name: 'Currently pays for sex'),
      //             InputFieldOption(
      //                 code: 'Man who has sex with men',
      //                 name: 'Man who has sex with men'),
      //             InputFieldOption(
      //                 code: 'Transgender individual',
      //                 name: 'Transgender individual'),
      //             InputFieldOption(
      //                 code: 'Individual who injects drugs',
      //                 name: 'Individual who injects drugs'),
      //             InputFieldOption(
      //                 code:
      //                     'In a serodiscordant relationship and HIV-positive partner is not on ART or has been on ART for < 12 months',
      //                 name:
      //                     'In a serodiscordant relationship and HIV-positive partner is not on ART or has been on ART for < 12 months'),
      //             InputFieldOption(
      //                 code:
      //                     "In a serodiscordant relationship and HIV-positive partner's last viral load is >= 1000 copies/ml OR viral load is not known but partner's ART adherence is believed to be poor",
      //                 name:
      //                     "In a serodiscordant relationship and HIV-positive partner's last viral load is >= 1000 copies/ml OR viral load is not known but partner's ART adherence is believed to be poor"),
      //             InputFieldOption(
      //                 code: 'Has multiple concurrent sexual partners',
      //                 name: 'Has multiple concurrent sexual partners'),
      //             InputFieldOption(
      //                 code:
      //                     'Individual believes their partner has multiple other concurrent sexual partners',
      //                 name:
      //                     'Individual believes their partner has multiple other concurrent sexual partners'),
      //             InputFieldOption(
      //                 code:
      //                     'Individual at high risk of being forced to have sex',
      //                 name:
      //                     'Individual at high risk of being forced to have sex'),
      //             InputFieldOption(code: 'Other', name: 'Other (Specify)'),
      //           ],
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'UL1Pq6sgvr2',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Other reason for starting PrEP',
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'vNyGPa7FbQm',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Ever been on PrEP',
      //           valueType: 'BOOLEAN'),
      //       InputField(
      //           id: 'UL0xa3Sz9ML',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Date PrEP stopped',
      //           valueType: 'DATE'),
      //       InputField(
      //           id: 'de4zcWiZB5j',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Indication for stopping PrEP',
      //           options: [
      //             InputFieldOption(
      //                 code: 'Patient decision', name: 'Patient decision'),
      //             InputFieldOption(
      //                 code: 'Poor adherence',
      //                 name: 'Poor adherence (clinician decision)'),
      //             InputFieldOption(
      //                 code: 'New HIV diagnosis', name: 'New HIV diagnosis'),
      //             InputFieldOption(
      //                 code: 'Patient no longer at high risk for HIV infection',
      //                 name:
      //                     'Patient no longer at high risk for HIV infection (clinician decision)'),
      //             InputFieldOption(code: 'Other', name: 'Other (Specify)'),
      //           ],
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'y7lRj3QSDkn',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Other reason for stopping PrEP',
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'QInz3UAj6zC',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Date initiated on ART',
      //           valueType: 'DATE'),
      //       InputField(
      //           id: 'R63XVONUFeG',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Unique ART Number',
      //           valueType: 'NUMBER'),
      //       InputField(
      //           id: 'mPLGZsuyrvb',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Pregnancy Test',
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'd9UoOBO2BWi',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Hepatitis B Screening',
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'GMGpCj6Nkvd',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'RPR/VDRL  Screening',
      //           valueType: 'TEXT'),
      //       InputField(
      //           id: 'NIZZ0Bj3XPU',
      //           inputColor: Color(0xFF1F8ECE),
      //           labelColor: Color(0xFF737373),
      //           name: 'Date of initial visit',
      //           valueType: 'DATE'),
      //     ])
    ];
  }
}
