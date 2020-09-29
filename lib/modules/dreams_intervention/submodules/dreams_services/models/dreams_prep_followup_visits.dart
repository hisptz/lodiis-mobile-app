import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class EnrollmentFormSection {
  static List<FormSection> getFormSections() {
    return [
            FormSection(
               name: 'PrEP Visits',
               color: Color(0xFF05131B),
               inputFields: [
                  InputField(
                      id: 'Dl8JvQuOkAd',
                      name: 'Duration in weeks since starting PrEP',
                      valueType: 'NUMBER',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'gCvMVscBNfk',
                      name: 'Weight',
                      valueType: 'NUMBER',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                   InputField(
                      id: '',
                      name: 'HIV rapid test result',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B),
                      options: [
                        InputFieldOption(code: 'Positive', name: 'Positive'),
                        InputFieldOption(code: 'Negative', name: 'Negative'),
                        InputFieldOption(code: 'Indeterminate', name: 'Indeterminate'),
                        InputFieldOption(code: 'Didn\'t collect', name: 'Didn\'t collect')
                      ]),
                  InputField(
                      id: 'm0G5RLlWR9W',
                      name: 'Date of test',
                      valueType: 'DATE',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'zjTq55mgupV',
                      name: 'Creatinine',
                      valueType: 'NUMBER',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'AhmIGuxYRSY',
                      name: 'Cr Clearance',
                      valueType: 'NUMBER',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                   InputField(
                      id: 'sg1onDJ89ze',
                      name: 'STI Screening(PrEP)',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B),
                       options: [
                        InputFieldOption(code: 'No signs or symptoms', name: 'No signs or symptoms'),
                        InputFieldOption(code: 'Signs or symptoms', name: 'Signs or symptoms')
                      ]),
                   InputField(
                      id: 'EcoA0KLZ4rL',
                      name: 'STI Treatment(PrEP)',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B),
                       options: [
                        InputFieldOption(code: 'Treated for STI', name: 'Treated for STI'),
                        InputFieldOption(code: 'Not treated for STI', name: 'Not treated for STI')
                      ]),
                  InputField(
                      id: 'sdgj99xGuv3',
                      name: 'Number of condoms provided',
                      valueType: 'NUMBER',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'JVuPPJbsj4T',
                      name: 'Type of condom',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B),
                       options: [
                        InputFieldOption(code: 'Male', name: 'Male'),
                        InputFieldOption(code: 'Female', name: 'Female')
                      ]),
                  InputField(
                      id: 'wBG1kmHK6kJ',
                      name: 'Visit outcome',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B),
                      options: [
                        InputFieldOption(code: 'Continued same PrEP regimen', name: 'Continued same PrEP regimen'),
                        InputFieldOption(code: 'Continued PrEP but PrEP regimen changed', name: 'Continued PrEP but PrEP regimen changed'),
                        InputFieldOption(code: 'PrEP stopped due to patient\'s decision', name: 'PrEP stopped due to patient\'s decision'),
                        InputFieldOption(code: 'PrEP stopped due to poor adherence', name: 'PrEP stopped due to poor adherence'),
                        InputFieldOption(code: 'PrEP stopped due to new HIV diagnosis', name: 'PrEP stopped due to new HIV diagnosis'),
                        InputFieldOption(code: 'PrEP stopped due to patient no longer at risk', name: 'PrEP stopped due to patient no longer at risk'),
                        InputFieldOption(code: 'Other', name: 'Other')
                      ]),
                   InputField(
                      id: 'QsE306jJj60',
                      name: 'PrEP Regimens',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B),
                      options: [
                        InputFieldOption(code: 'TDF3TC', name: 'TDF3TC'),
                        InputFieldOption(code: 'TDFFTC', name: 'TDFFTC'),
                        InputFieldOption(code: 'TDF', name: 'TDF'),
                        InputFieldOption(code: 'Other', name: 'Other')
                      ])
                ]),
          FormSection(
               name: 'Case Transfer',
               color: Color(0xFF05131B),
               inputFields: [
                  InputField(
                      id: 'MelgOQY7mDx',
                      name: 'Transfer date',
                      valueType: 'DATE',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'Uou4yDFVQcH',
                      name: 'Where to',
                      valueType: 'ORGANISATION_UNIT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'WJOfRtIYU2p',
                      name: 'Comment',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B))
                ]),
           FormSection(
               name: 'Stopping PrEP',
               color: Color(0xFF05131B),
               inputFields: [
                  InputField(
                      id: 'UL0xa3Sz9ML',
                      name: 'Date PrEP stopped',
                      valueType: 'DATE',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'A8SPsd6PF41',
                      name: 'PrEP stopped due to patient\'s decision?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'KxFYGVirFWF',
                      name: 'PrEP stopped due to poor adherence(clinician decision)?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'qe6l3Iml00L',
                      name: 'PrEP stopped due to new HIV diagnosis?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                   InputField(
                      id: 'QInz3UAj6zC',
                      name: 'Date initiated on ART?',
                      valueType: 'DATE',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                  InputField(
                      id: 'R63XVONUFeG',
                      name: 'Unique ART Number',
                      valueType: 'NUMBER',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                    InputField(
                      id: 'jjPOLtS5Kw8',
                      name: 'PrEP stopped due to patient no longer being at high risk for HIV infection(clinician decision)?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                    InputField(
                      id: 'xxOuRNqolik',
                      name: 'PrEP stopped due to significant side effects(clinician decision)?',
                      valueType: 'BOOLEAN',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B)),
                    InputField(
                      id: 'y7lRj3QSDkn',
                      name: 'Other reason for stopping PrEP',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF258DCC),
                      labelColor: Color(0xFF05131B))
               ])
    ];
  }
}
