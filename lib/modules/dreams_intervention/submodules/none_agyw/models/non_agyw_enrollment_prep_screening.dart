import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class NonAgywEnrollmentPrepScreening {

 static List<String> getMandatoryField() {
    return [
      'w16L3KidzUp',
      'sa81lAvBb7Y',
      'nLLHqOGTQK9',
       ];
  }


  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'PrEP Screening for Substantial Risk and Eligibility',
          color: Color(0xFF05131B),
          subSections: [
            FormSection(
              name: 'Facility Information', 
              color: Color(0xFF258DCC), 
              inputFields: [
               InputField(
                      id: 'YDxOvZTdzAc',
                      name: 'Facility Name',
                      valueType: 'ORGANISATION_UNIT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'yuOiCMwlOlb',
                      name: 'Entry point /Reason for visiting facility',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'w16L3KidzUp',
                      name: 'Date of initial client visit',
                      valueType: 'DATE',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
            ]),

             FormSection(
              name: 'Recent Exposure to HIV.  Ask, “In the last 30 days”…', 
              color: Color(0xFF258DCC), 
              inputFields: [
               InputField(
                      id: 'HIsG7OjQfqo',
                      name: 'Have you had sex without a condom with someone living with HIV who is not on treatment',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B),
                      options: [
                        InputFieldOption(code: 'Yes', name: 'Yes'),
                        InputFieldOption(code: 'No', name: 'No'),
                        InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
                      ]),
            ]),
             FormSection(
              name: 'Assessment for acute HIV syndrome', 
              color: Color(0xFF258DCC), 
              inputFields: [
                 InputField(
                      id: 'wg43kJ09Up5',
                      name: 'Have you had condom-less sex or other high risk HIV exposure in the past 2 – 6 weeks',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B),
                        options: [
                        InputFieldOption(code: 'Yes', name: 'Yes'),
                        InputFieldOption(code: 'No', name: 'No'),
                        InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
                      ]),
                  InputField(
                      id: 'DCXxIRxPse3',
                      name: 'Have you had a “cold” or “flu”, runny nose, fatigue, malaise, headache, sore throat, mouth sores, lymphadenopathy, skin rash, myalgia( muscle pain), arthralgia(joint pain)?',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B),
                        options: [
                        InputFieldOption(code: 'Yes', name: 'Yes'),
                        InputFieldOption(code: 'No', name: 'No'),
                        InputFieldOption(code: 'Don\'t Know', name: 'Don\'t Know')
                      ]),
            ]),
            FormSection(
              name: 'Contraindications for PrEP',
              description: 'If any of the contraindications are present do not offer PrEP', 
              color: Color(0xFF258DCC), 
              inputFields: [
                InputField(
                      id: 'Ufy2ZT9yphQ',
                      name: 'Is the client currently taking nephrotoxic drugs. Refer to creatinine clearance job aid for list of nephrotoxic drugs. Consult doctor about alternative medication/management before initiating PrEP?',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'nLLHqOGTQK9',
                      name: 'Has creatinine clearance (eGFR) <60 ml/min',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                     InputField(
                      id: 'sa81lAvBb7Y',
                      name: 'Weight below 35kg',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'wJ0ctEtFyzS',
                      name: 'Allergy or contraindication to any medicine in the PrEP regimen',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
            ]),
             FormSection(
              name: 'PrEP Eligibility', 
              description: 'Clients are eligible if they fulfill ALL the criteria below:',
              color: Color(0xFF258DCC), 
              inputFields: [
                 InputField(
                      id: 'dQBja8nUr18',
                      name: 'HIV-negative',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'ACcf4Jyy30c',
                      name: 'At substantial risk of HIV',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'wNIvEyH95EU',
                      name: 'Has no signs/symptoms of acute HIV infection',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'z7eAqo0LMqi',
                      name: 'Has creatinine clearance (eGFR) >60 ml/min or patient has no risk factors for renal disease and the creatinine result is pending (see Creatinine clearance job aid for risk factors)',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
            ]),
             FormSection(
              name: '', 
              description: 'Question prompts for providers:',
              color: Color(0xFF258DCC), 
              inputFields: [
                 InputField(
                      id: 'oZPPEMZ0hXt',
                      name: 'Date tested',
                      valueType: 'DATE',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'uBJeTLcoAKM',
                      name: 'Type of test used',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'OLaa0ZiGMVu',
                      name: 'Other type of test used',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'zGAjwEL0yL5',
                      name: 'eGFR Result',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                    InputField(
                      id: 'fufd2D8sYc3',
                      name: 'Date of eGFR results',
                      valueType: 'DATE',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                    InputField(
                      id: 'fchWv2MSmaS',
                      name: 'Creatinine clearance (calculated)',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                    InputField(
                      id: 'heT7TrQQAA1',
                      name: 'Date Creatinine clearance (calculated)',
                      valueType: 'DATE',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B))
            ]),
             FormSection(
              name: 'Services Received by Client', 
              color: Color(0xFF258DCC), 
              inputFields: [
                 InputField(
                      id: 'mdpVjiigyEe',
                      name: 'PrEP initiated',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'QTHDGaiEgMk',
                      name: 'Initiated on PEP',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'wSnrfl8u3Kw',
                      name: 'To start PrEP after completing PEP',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'pcS3AkmRGnq',
                      name: 'PCR/HIV Ag test or follow-up HIV re-testing (if suspicion of acute HIV infection)',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'ycrnvO8Am4c',
                      name: 'Client declined PrEP',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'eOy1XwiYC8H',
                      name: 'Referred for PrEP at another facility',
                      valueType: 'TRUE_ONLY',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'X2m9v2E5WaI',
                      name: 'Name of facility PrEP referred',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
            ]),
          ]),
      ];
  }
}
