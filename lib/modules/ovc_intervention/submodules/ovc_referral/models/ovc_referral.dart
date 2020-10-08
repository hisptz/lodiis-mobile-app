import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcAddReferral {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Service Referral',
          color: Color(0xFF1A3518),
          subSections: [
            FormSection(
              name: 'Referral Service Delivery Mode',
              color: Color(0xFF1A3518),
              inputFields: [
                InputField(
                    id: 'qAed23reDPP',
                    name: 'Services Referred for at',
                    valueType: 'TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF1A3518),
                    options: [
                      InputFieldOption(code: 'Facility', name: 'Facility'),
                      InputFieldOption(code: 'Community', name: 'Community'),
                    ])
              ],
            ),
            FormSection(
                name: 'Service referred for at Community',
                color: Color(0xFF1B3519),
                inputFields: [
                  InputField(
                      id: 'LLWTHwhnch0',
                      name: 'Service Category at community',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF1A3518),
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
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF1A3518),
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
                            code: 'Post abuse case management',
                            name: 'Post abuse case management'),
                        InputFieldOption(
                            code: 'ART and Adherence',
                            name: 'ART and Adherence'),
                        InputFieldOption(
                            code: 'PMTCT Services', name: 'PMTCT Services'),
                        InputFieldOption(
                            code: 'Cervical Cancer Screening',
                            name: 'Cervical Cancer Screening'),
                        InputFieldOption(code: 'ECD', name: 'ECD'),
                        InputFieldOption(
                            code: 'FamilyPlanningSRH',
                            name: 'Family planning/SRH'),
                        InputFieldOption(
                            code: 'Condom supply', name: 'Condom supply'),
                        InputFieldOption(
                            code: 'TB screening', name: 'TB screening'),
                        InputFieldOption(
                            code: 'TB treatment', name: 'TB treatment'),
                        InputFieldOption(code: 'Nutrition', name: 'Nutrition'),
                        InputFieldOption(code: 'HTS', name: 'HTS'),
                        InputFieldOption(code: 'ANC', name: 'ANC'),
                        InputFieldOption(code: 'VMMC', name: 'VMMC'),
                        InputFieldOption(
                            code: 'EID Testing', name: 'EID Testing'),
                        InputFieldOption(code: 'PrEP/PEP', name: 'PrEP/PEP'),
                        InputFieldOption(code: 'PMTCT', name: 'PMTCT'),
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
                            code: 'Referral to post abuse care services',
                            name: 'Referral to post abuse care services'),
                        InputFieldOption(
                            code: 'Violence Against Children',
                            name: 'Violence Against Children'),
                        InputFieldOption(code: 'CAG', name: 'CAG'),
                        InputFieldOption(
                            code: 'Home based care visits',
                            name: 'Home based care visits'),
                        InputFieldOption(
                            code: 'Educational and vocational support',
                            name: 'Educational and vocational support'),
                      ]),
                  InputField(
                    id: 'ubB83OWNWsv',
                    name: 'Service Provider/Referred Organization at community',
                    valueType: 'ORGANISATION_UNIT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF1A3518),
                  ),
                  InputField(
                    id: 'WHktsYoFqat',
                    name: 'Comments on referral at community',
                    valueType: 'LONG_TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF1A3518),
                  ),
                ]),
            FormSection(
                name: 'Service referred for at Facility',
                color: Color(0xFF1B3519),
                inputFields: [
                  InputField(
                      id: 'AuCryxQYmrk',
                      name: 'Service Category at facility',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF1A3518),
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
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF1A3518),
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
                            code: 'Post abuse case management',
                            name: 'Post abuse case management'),
                        InputFieldOption(
                            code: 'ART and Adherence',
                            name: 'ART and Adherence'),
                        InputFieldOption(
                            code: 'PMTCT Services', name: 'PMTCT Services'),
                        InputFieldOption(
                            code: 'Cervical Cancer Screening',
                            name: 'Cervical Cancer Screening'),
                        InputFieldOption(code: 'ECD', name: 'ECD'),
                        InputFieldOption(
                            code: 'FamilyPlanningSRH',
                            name: 'Family planning/SRH'),
                        InputFieldOption(
                            code: 'Condom supply', name: 'Condom supply'),
                        InputFieldOption(
                            code: 'TB screening', name: 'TB screening'),
                        InputFieldOption(
                            code: 'TB treatment', name: 'TB treatment'),
                        InputFieldOption(code: 'Nutrition', name: 'Nutrition'),
                        InputFieldOption(code: 'HTS', name: 'HTS'),
                        InputFieldOption(code: 'ANC', name: 'ANC'),
                        InputFieldOption(code: 'VMMC', name: 'VMMC'),
                        InputFieldOption(
                            code: 'EID Testing', name: 'EID Testing'),
                        InputFieldOption(code: 'PrEP/PEP', name: 'PrEP/PEP'),
                        InputFieldOption(code: 'PMTCT', name: 'PMTCT'),
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
                            code: 'Referral to post abuse care services',
                            name: 'Referral to post abuse care services'),
                        InputFieldOption(
                            code: 'Violence Against Children',
                            name: 'Violence Against Children'),
                        InputFieldOption(code: 'CAG', name: 'CAG'),
                        InputFieldOption(
                            code: 'Home based care visits',
                            name: 'Home based care visits'),
                        InputFieldOption(
                            code: 'Educational and vocational support',
                            name: 'Educational and vocational support'),
                      ]),
                  InputField(
                    id: 'jOXN2iPhkxj',
                    name: 'Service Provider/Referred Organization at facility',
                    valueType: 'ORGANISATION_UNIT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF1A3518),
                  ),
                  InputField(
                    id: 'iifSkIcBZz2',
                    name: 'Comments on referral at facility',
                    valueType: 'LONG_TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF1A3518),
                  ),
                ]),
            FormSection(
                name: 'Completed by the Referring Organization',
                color: Color(0xFF1B3519),
                inputFields: [
                  InputField(
                    id: 'tRvDAZxam3P',
                    name: 'Name of next of kin',
                    valueType: 'TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF1A3518),
                  ),
                  InputField(
                    id: 'qCu2f4kEfzW',
                    name: 'Phone Number of next of kin',
                    valueType: 'PHONE_NUMBER',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF1A3518),
                  ),
                ])
          ])
    ];
  }
}
