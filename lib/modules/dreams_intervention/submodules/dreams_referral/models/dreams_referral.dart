import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class DreamsReferral {
  static List<String> getMandatoryFields() {
    return ['qAed23reDPP', 'y0bvausyTyh', 'jOXN2iPhkxj', 'ubB83OWNWsv'];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Service Referral',
          color: const Color(0xFF737373),
          subSections: [
            FormSection(
              name: 'Referral Service Delivery Mode',
              color: const Color(0xFF737373),
              inputFields: [
                InputField(
                    id: 'qAed23reDPP',
                    name: 'Services Referred for at',
                    valueType: 'TEXT',
                    inputColor: const Color(0xFF1F8ECE),
                    labelColor: const Color(0xFF737373),
                    options: [
                      InputFieldOption(code: 'Facility', name: 'Facility'),
                      InputFieldOption(code: 'Community', name: 'Community'),
                    ]),
                InputField(
                    id: 'y0bvausyTyh',
                    name: 'Implementing partner',
                    valueType: 'TEXT',
                    inputColor: const Color(0xFF1F8ECE),
                    labelColor: const Color(0xFF737373),
                    options: [
                      InputFieldOption(code: 'EGPAF', name: 'EGPAF'),
                      InputFieldOption(code: 'JHPIEGO', name: 'JHPIEGO'),
                      InputFieldOption(
                          code: 'KB-AGYW/DREAMS', name: 'KB-AGYW/DREAMS'),
                      InputFieldOption(code: 'PSI', name: 'PSI'),
                    ])
              ],
            ),
            FormSection(
                id: 'SeRefoCo',
                name: 'Service referred for at Community',
                color: const Color(0xFF737373),
                inputFields: [
                  InputField(
                      id: 'LLWTHwhnch0',
                      name: 'Service Category at community',
                      valueType: 'TEXT',
                      inputColor: const Color(0xFF1F8ECE),
                      labelColor: const Color(0xFF737373),
                      options: [
                        InputFieldOption(
                            code: 'Clinical Services',
                            name: 'Clinical Services'),
                        InputFieldOption(
                            code: 'Post abuse case management',
                            name: 'Post abuse case management'),
                        InputFieldOption(
                            code: 'Social Services', name: 'Social Services'),
                      ]),
                  InputField(
                      id: 'rsh5Kvx6qAU',
                      name: 'Type of service at community',
                      valueType: 'TEXT',
                      inputColor: const Color(0xFF1F8ECE),
                      labelColor: const Color(0xFF737373),
                      options: [
                        InputFieldOption(
                            code: 'STI Screening', name: 'STI Screening'),
                        InputFieldOption(
                            code: 'STI Treatment', name: 'STI Treatment'),
                        InputFieldOption(
                            code: 'Evaluation for ARVs/HAART',
                            name: 'Evaluation for ARVs/HAART'),
                        InputFieldOption(
                            code: 'PostAbuseCaseManagement',
                            name: 'Post abuse case management'),
                        InputFieldOption(
                            code: 'ARTInitiation', name: 'ART Initiation'),
                        InputFieldOption(
                            code: 'Cervical Cancer Screening',
                            name: 'Cervical Cancer Screening'),
                        InputFieldOption(
                            code: 'FamilyPlanningSRH',
                            name: 'Family planning/SRH'),
                        InputFieldOption(
                            code: 'CondomEducationProvision',
                            name: 'Condom Education/Provision'),
                        InputFieldOption(
                            code: 'ViolencePreventionEducation',
                            name: 'Violence Prevention Education'),
                        InputFieldOption(
                            code: 'ComprehensiveEconomicStrengthening',
                            name: 'Comprehensive Economic Strengthening'),
                        InputFieldOption(
                            code: 'HIVPreventionEducation',
                            name: 'HIV Prevention Education'),
                        InputFieldOption(
                            code: 'ParentingPregBreastfeeding',
                            name: 'Parenting (Preg & Breastfeeding)'),
                        InputFieldOption(
                            code: 'EducationSubsidiesSupport',
                            name: 'Education Subsidies/support'),
                        InputFieldOption(
                            code: 'TB screening', name: 'TB screening'),
                        InputFieldOption(
                            code: 'TB treatment', name: 'TB treatment'),
                        InputFieldOption(code: 'HTS', name: 'HTS'),
                        InputFieldOption(code: 'ANC', name: 'ANC'),
                        InputFieldOption(code: 'PrEP', name: 'PrEP'),
                        InputFieldOption(code: 'EMTCT', name: 'EMTCT'),
                        InputFieldOption(
                            code: 'Treatment Support (TB/ARV)',
                            name: 'Treatment Support (TB/ARV)'),
                        InputFieldOption(
                            code: 'Youth friendly services',
                            name: 'Youth friendly services'),
                        InputFieldOption(
                            code: 'Gender Based Violence',
                            name: 'Gender Based Violence'),
                        InputFieldOption(
                            code: 'Domestic Violence Support group',
                            name: 'Domestic Violence Support group'),
                        InputFieldOption(
                            code: 'Income generating activity',
                            name: 'Income generating activity'),
                        InputFieldOption(
                            code: 'Orphan Care & Support',
                            name: 'Orphan Care & Support'),
                        InputFieldOption(
                            code: 'Psycho-social Support',
                            name: 'Psycho-social Support'),
                        InputFieldOption(
                            code: 'PLHIV support group',
                            name: 'PLHIV support group'),
                        InputFieldOption(
                            code: 'PostGBVServicesClinical',
                            name: 'Post GBV Services (clinical)'),
                        InputFieldOption(
                            code: 'PostGBVCareLegal',
                            name: 'Post GBV Care (legal)'),
                        InputFieldOption(
                            code: 'Educational and vocational support',
                            name: 'Educational and vocational support'),
                        InputFieldOption(
                            code: 'Social grants', name: 'Social grants'),
                        InputFieldOption(
                            code: 'HIVRiskAssessment',
                            name: 'HIV Risk Assessment'),
                        InputFieldOption(
                            code: 'Aflateen/toun', name: 'Aflateen/toun'),
                        InputFieldOption(code: 'Go Girls', name: 'Go Girls'),
                        InputFieldOption(
                            code: 'PTS 4 NON-GRAD', name: 'PTS 4 NON-GRAD'),
                        InputFieldOption(
                            code: 'PTS 4-GRAD', name: 'PTS 4-GRAD'),
                        InputFieldOption(code: 'SILC', name: 'SILC'),
                        InputFieldOption(code: 'LBSE', name: 'LBSE'),
                        InputFieldOption(
                            code: 'FinancialLiteracyEducation',
                            name: 'Financial Literacy (Education)'),
                        InputFieldOption(
                            code: 'SAVING GROUPS', name: 'SAVING GROUPS'),
                        InputFieldOption(
                            code: 'STEPPING STONES', name: 'STEPPING STONES'),
                        InputFieldOption(code: 'IPC', name: 'IPC'),
                        InputFieldOption(
                            code: 'GBV Legal Protection',
                            name: 'GBV Legal Protection'),
                        InputFieldOption(
                            code: 'GBV Legal Messaging',
                            name: 'GBV Legal Messaging'),
                        InputFieldOption(code: 'Parenting', name: 'Parenting'),
                        InputFieldOption(code: 'VAC Legal', name: 'VAC Legal'),
                        InputFieldOption(
                            code: 'VAC Legal Messaging',
                            name: 'VAC Legal Messaging'),
                      ]),
                  InputField(
                    id: 'ubB83OWNWsv',
                    name: 'Service Provider/Referred Organization at community',
                    valueType: 'ORGANISATION_UNIT',
                    showCountryLevelTree: true,
                    allowedSelectedLevels: [3, 4],
                    inputColor: const Color(0xFF1F8ECE),
                    labelColor: const Color(0xFF737373),
                  ),
                  InputField(
                    id: 'WHktsYoFqat',
                    name: 'Comments on referral at community',
                    valueType: 'LONG_TEXT',
                    inputColor: const Color(0xFF1F8ECE),
                    labelColor: const Color(0xFF737373),
                  ),
                ]),
            FormSection(
                id: 'SeRefoFa',
                name: 'Service referred for at Facility',
                color: const Color(0xFF737373),
                inputFields: [
                  InputField(
                      id: 'AuCryxQYmrk',
                      name: 'Service Category at facility',
                      valueType: 'TEXT',
                      inputColor: const Color(0xFF1F8ECE),
                      labelColor: const Color(0xFF737373),
                      options: [
                        InputFieldOption(
                            code: 'Clinical Services',
                            name: 'Clinical Services'),
                        InputFieldOption(
                            code: 'Post abuse case management',
                            name: 'Post abuse case management'),
                        InputFieldOption(
                            code: 'Social Services', name: 'Social Services'),
                      ]),
                  InputField(
                      id: 'OrC9Bh2bcFz',
                      name: 'Type of service at facility',
                      valueType: 'TEXT',
                      inputColor: const Color(0xFF1F8ECE),
                      labelColor: const Color(0xFF737373),
                      options: [
                        InputFieldOption(
                            code: 'STI Screening', name: 'STI Screening'),
                        InputFieldOption(
                            code: 'STI Treatment', name: 'STI Treatment'),
                        InputFieldOption(
                            code: 'HIV Testing and counselling',
                            name: 'HIV Testing and counselling'),
                        InputFieldOption(
                            code: 'Evaluation for ARVs/HAART',
                            name: 'Evaluation for ARVs/HAART'),
                        InputFieldOption(
                            code: 'PostAbuseCaseManagement',
                            name: 'Post abuse case management'),
                        InputFieldOption(
                            code: 'ARTInitiation', name: 'ART Initiation'),
                        InputFieldOption(
                            code: 'Cervical Cancer Screening',
                            name: 'Cervical Cancer Screening'),
                        InputFieldOption(
                            code: 'FamilyPlanningSRH',
                            name: 'Family planning/SRH'),
                        InputFieldOption(
                            code: 'CondomEducationProvision',
                            name: 'Condom Education/Provision'),
                        InputFieldOption(
                            code: 'ViolencePreventionEducation',
                            name: 'Violence Prevention Education'),
                        InputFieldOption(
                            code: 'ComprehensiveEconomicStrengthening',
                            name: 'Comprehensive Economic Strengthening'),
                        InputFieldOption(
                            code: 'HIVPreventionEducation',
                            name: 'HIV Prevention Education'),
                        InputFieldOption(
                            code: 'ParentingPregBreastfeeding',
                            name: 'Parenting (Preg & Breastfeeding)'),
                        InputFieldOption(
                            code: 'EducationSubsidiesSupport',
                            name: 'Education Subsidies/support'),
                        InputFieldOption(
                            code: 'TB screening', name: 'TB screening'),
                        InputFieldOption(
                            code: 'TB treatment', name: 'TB treatment'),
                        InputFieldOption(code: 'HTS', name: 'HTS'),
                        InputFieldOption(code: 'ANC', name: 'ANC'),
                        InputFieldOption(code: 'PrEP', name: 'PrEP'),
                        InputFieldOption(code: 'EMTCT', name: 'EMTCT'),
                        InputFieldOption(
                            code: 'Treatment Support (TB/ARV)',
                            name: 'Treatment Support (TB/ARV)'),
                        InputFieldOption(
                            code: 'Youth friendly services',
                            name: 'Youth friendly services'),
                        InputFieldOption(
                            code: 'Gender Based Violence',
                            name: 'Gender Based Violence'),
                        InputFieldOption(
                            code: 'Domestic Violence Support group',
                            name: 'Domestic Violence Support group'),
                        InputFieldOption(
                            code: 'Income generating activity',
                            name: 'Income generating activity'),
                        InputFieldOption(
                            code: 'Orphan Care & Support',
                            name: 'Orphan Care & Support'),
                        InputFieldOption(
                            code: 'Psycho-social Support',
                            name: 'Psycho-social Support'),
                        InputFieldOption(
                            code: 'PLHIV support group',
                            name: 'PLHIV support group'),
                        InputFieldOption(
                            code: 'PostGBVServicesClinical',
                            name: 'Post GBV Services (clinical)'),
                        InputFieldOption(
                            code: 'PostGBVCareLegal',
                            name: 'Post GBV Care (legal)'),
                        InputFieldOption(
                            code: 'Educational and vocational support',
                            name: 'Educational and vocational support'),
                        InputFieldOption(
                            code: 'Social grants', name: 'Social grants'),
                        InputFieldOption(
                            code: 'HIVRiskAssessment',
                            name: 'HIV Risk Assessment'),
                        InputFieldOption(
                            code: 'Aflateen/toun', name: 'Aflateen/toun'),
                        InputFieldOption(code: 'Go Girls', name: 'Go Girls'),
                        InputFieldOption(
                            code: 'PTS 4 NON-GRAD', name: 'PTS 4 NON-GRAD'),
                        InputFieldOption(
                            code: 'PTS 4-GRAD', name: 'PTS 4-GRAD'),
                        InputFieldOption(code: 'SILC', name: 'SILC'),
                        InputFieldOption(code: 'LBSE', name: 'LBSE'),
                        InputFieldOption(
                            code: 'FinancialLiteracyEducation',
                            name: 'Financial Literacy (Education)'),
                        InputFieldOption(
                            code: 'SAVING GROUPS', name: 'SAVING GROUPS'),
                        InputFieldOption(
                            code: 'STEPPING STONES', name: 'STEPPING STONES'),
                        InputFieldOption(code: 'IPC', name: 'IPC'),
                        InputFieldOption(
                            code: 'GBV Legal Protection',
                            name: 'GBV Legal Protection'),
                        InputFieldOption(
                            code: 'GBV Legal Messaging',
                            name: 'GBV Legal Messaging'),
                        InputFieldOption(code: 'Parenting', name: 'Parenting'),
                        InputFieldOption(code: 'VAC Legal', name: 'VAC Legal'),
                        InputFieldOption(
                            code: 'VAC Legal Messaging',
                            name: 'VAC Legal Messaging'),
                      ]),
                  InputField(
                    id: 'jOXN2iPhkxj',
                    name: 'Service Provider/Referred Organization at facility',
                    valueType: 'ORGANISATION_UNIT',
                    showCountryLevelTree: true,
                    allowedSelectedLevels: [3, 4],
                    inputColor: const Color(0xFF1F8ECE),
                    labelColor: const Color(0xFF737373),
                  ),
                  InputField(
                    id: 'iifSkIcBZz2',
                    name: 'Comments on referral at facility',
                    valueType: 'LONG_TEXT',
                    inputColor: const Color(0xFF1F8ECE),
                    labelColor: const Color(0xFF737373),
                  ),
                ]),
            FormSection(
                name: 'Completed by the Referring Organization',
                color: const Color(0xFF737373),
                inputFields: [
                  InputField(
                    id: 'tRvDAZxam3P',
                    name: 'Name of next of kin',
                    valueType: 'TEXT',
                    inputColor: const Color(0xFF1F8ECE),
                    labelColor: const Color(0xFF737373),
                  ),
                  InputField(
                    id: 'qCu2f4kEfzW',
                    name: 'Phone Number of next of kin',
                    valueType: 'PHONE_NUMBER',
                    inputColor: const Color(0xFF1F8ECE),
                    labelColor: const Color(0xFF737373),
                  ),
                ])
          ])
    ];
  }
}
