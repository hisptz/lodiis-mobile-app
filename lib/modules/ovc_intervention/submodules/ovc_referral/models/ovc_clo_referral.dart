import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class OvcCLOReferral {
  static List<FormSection> getFormSections() {
    return [
      FormSection(
          name: 'Service Referral',
          color: Color(0xFF1B3519),
          subSections: [
            FormSection(
              name: 'Referral Service Delivery Mode',
              color: Color(0xFF737373),
              inputFields: [
                InputField(
                    id: 'qAed23reDPP',
                    name: 'Services Referred for at',
                    valueType: 'TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                    options: [
                      InputFieldOption(code: 'Facility', name: 'Facility'),
                      InputFieldOption(code: 'Community', name: 'Community'),
                    ])
              ],
            ),
            FormSection(
              id: 'SeRefoCo',
                name: 'Service referred for at Community',
                color: Color(0xFF1B3519),
                inputFields: [
                  InputField(
                      id: 'LLWTHwhnch0',
                      name: 'Service Category at community',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
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
                      labelColor: Color(0xFF737373),
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
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'WHktsYoFqat',
                    name: 'Comments on referral at community',
                    valueType: 'LONG_TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                ]),
            FormSection(
              id: 'SeRefoFa',
                name: 'Service referred for at Facility',
                color: Color(0xFF1B3519),
                inputFields: [
                  InputField(
                      id: 'AuCryxQYmrk',
                      name: 'Service Category at facility',
                      valueType: 'TEXT',
                      inputColor: Color(0xFF4B9F46),
                      labelColor: Color(0xFF737373),
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
                      labelColor: Color(0xFF737373),
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
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'iifSkIcBZz2',
                    name: 'Comments on referral at facility',
                    valueType: 'LONG_TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                ]),
            FormSection(
              id: 'CoReOr',
                name: 'Completed by the Referring Organization',
                color: Color(0xFF1B3519),
                inputFields: [
                  InputField(
                    id: 'tRvDAZxam3P',
                    name: 'Name of next of kin',
                    valueType: 'TEXT',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                  InputField(
                    id: 'qCu2f4kEfzW',
                    name: 'Phone Number of next of kin',
                    valueType: 'PHONE_NUMBER',
                    inputColor: Color(0xFF4B9F46),
                    labelColor: Color(0xFF737373),
                  ),
                ]),
          ]),

FormSection(name: "CLO Referrals", color:Color(0xFF1B3519),
subSections: [
  FormSection(name: "", color: Colors.transparent ,
  inputFields: [

  InputField(
                id: 'NbQGlx6QZpK_clo_type',
                name: 'Type of CLO Referral',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'NbQGlx6QZpK_OnGoing', name: 'CLO Outgoing Referrals'),
                  InputFieldOption(code: 'NbQGlx6QZpK_Received', name: 'CLO Received Referrals'),                 
                ]),
  ]
  ),

    FormSection(
          name: 'CLO Received Referrals',
          color: Color(0xFF1B3519),
          id: "OIUDljKyNgy_clo_received",
          inputFields: [
            InputField(
              id: 'OIUDljKyNgy',
              name: 'Date of referral',
              valueType: 'DATE',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'BelCZxo1ge9',
              name: 'Date of Service',
              valueType: 'DATE',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373)),
            InputField(
                id: 'NbQGlx6QZpK',
                name: 'Referred by',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'CMW', name: 'CMW'),
                  InputFieldOption(code: 'YM', name: 'YM'),
                  InputFieldOption(code: 'PE', name: 'PE'),
                  InputFieldOption(code: 'SCMW', name: 'SCMW'),
                  InputFieldOption(code: 'Paralegals', name: 'Paralegals'),
                  InputFieldOption(code: 'CLO', name: 'CLO'),
                ]),
            InputField(
                id: 'RiNop7mvTRW',
                name: 'Community Partner',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'LENEPHWA', name: 'LENEPHWA'),
                  InputFieldOption(code: 'WLSA', name: 'WLSA'),
                  InputFieldOption(code: 'CBA', name: 'CBA'),
                  InputFieldOption(code: 'CIL', name: 'CIL'),
                  InputFieldOption(code: 'LIRAC', name: 'LIRAC'),
                  InputFieldOption(code: 'SENTEBALE', name: 'SENTEBALE'),
                  InputFieldOption(code: 'SWAALES', name: 'SWAALES'),
                ]),
            InputField(
                id: 'rWIw1JHPiTo',
                name: 'Referred for',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'HTS', name: 'HTS'),
                  InputFieldOption(code: 'ART', name: 'ART'),
                  InputFieldOption(code: 'SAB', name: 'SAB'),
                  InputFieldOption(code: 'Parenting', name: 'Parenting'),
                  InputFieldOption(code: 'Stepping Stone', name: 'Stepping Stone'),
                  InputFieldOption(code: 'VAC', name: 'VAC'),
                  InputFieldOption(code: 'Singing to the Lion', name: 'Singing to the Lion'),
                  InputFieldOption(code: 'Other', name: 'Other')
                ]),
            InputField(
              id: 'pdUklLmaauR',
              name: 'Outcome Status',
              valueType: 'TEXT',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373))
          ]),

           FormSection(
          name: 'CLO Outgoing Referrals',
          color: Color(0xFF1B3519),
          id: "g6J1vZ2kDXB_clo_outgoing",
          inputFields: [
            InputField(
              id: 'g6J1vZ2kDXB',
              name: 'Viral Load Results (for CLHIV)',
              valueType: 'TEXT',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373),
            ),
            InputField(
              id: 'Cwg16RorxzK',
              name: 'Multi-Month Despensing (MMD)',
              valueType: 'TEXT',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373)),
            InputField(
              id: 'vEeBBzeQrQU',
              name: 'Referred to (Name and Surname of Community Cadre)',
              valueType: 'TEXT',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373)),
            InputField(
                id: 'RiNop7mvTRW',
                name: 'Community Partner',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'LENEPHWA', name: 'LENEPHWA'),
                  InputFieldOption(code: 'WLSA', name: 'WLSA'),
                  InputFieldOption(code: 'CBA', name: 'CBA'),
                  InputFieldOption(code: 'CIL', name: 'CIL'),
                  InputFieldOption(code: 'LIRAC', name: 'LIRAC'),
                  InputFieldOption(code: 'SENTEBALE', name: 'SENTEBALE'),
                  InputFieldOption(code: 'SWAALES', name: 'SWAALES'),
                ]),
            InputField(
              id: 'OIUDljKyNgy',
              name: 'Date of referral',
              valueType: 'DATE',
              inputColor: Color(0xFF4B9F46),
              labelColor: Color(0xFF737373)),
           InputField(
                id: 'pdUklLmaauR',
                name: 'Outcome Status',
                valueType: 'TEXT',
                inputColor: Color(0xFF4B9F46),
                labelColor: Color(0xFF737373),
                options: [
                  InputFieldOption(code: 'Complete', name: 'Complete'),
                  InputFieldOption(code: 'Not complete', name: 'Not complete')
                ]),
          ])
]
)

    ];
  }
}

