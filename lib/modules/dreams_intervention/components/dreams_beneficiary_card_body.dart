import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card_service_summary.dart';
import 'package:provider/provider.dart';

class DreamsBeneficiaryCardBody extends StatelessWidget {
  const DreamsBeneficiaryCardBody(
      {Key? key,
      required this.isVerticalLayout,
      required this.agywBeneficiary,
      this.canViewServiceCategory = false})
      : super(key: key);

  final bool isVerticalLayout;
  final bool canViewServiceCategory;
  final Color labelColor = const Color(0xFF8FBAD3);
  final Color valueColor = const Color(0xFF444E54);
  final AgywDream agywBeneficiary;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String? currentLanguage = languageTranslationState.currentLanguage;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 20.0),
            child: isVerticalLayout
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: VerticalRowCardData(
                          label: 'Created',
                          value: agywBeneficiary.createdDate,
                          labelColor: labelColor,
                          valueColor: valueColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: VerticalRowCardData(
                          label: 'Primary UIC',
                          value: agywBeneficiary.primaryUIC,
                          labelColor: labelColor,
                          valueColor: valueColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: VerticalRowCardData(
                          label:
                              currentLanguage == 'lesotho' ? 'Lilemo' : 'Age',
                          value: agywBeneficiary.age.toString(),
                          labelColor: labelColor,
                          valueColor: valueColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: VerticalRowCardData(
                          label: 'Age band',
                          value: agywBeneficiary.ageBand,
                          labelColor: labelColor,
                          valueColor: valueColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: VerticalRowCardData(
                          label:
                              currentLanguage == 'lesotho' ? 'Boleng' : 'Sex',
                          value: agywBeneficiary.sex,
                          labelColor: labelColor,
                          valueColor: valueColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: VerticalRowCardData(
                          label: 'Enrolled Organisation unit',
                          value: agywBeneficiary.enrolledOrganisation,
                          labelColor: labelColor,
                          valueColor: valueColor,
                        ),
                      ),
                      Visibility(
                          visible: agywBeneficiary.beneficiaryType != '',
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: VerticalRowCardData(
                              label: 'PrEP beneficiary type',
                              value: agywBeneficiary.beneficiaryType,
                              labelColor: labelColor,
                              valueColor: valueColor,
                            ),
                          )),
                      Visibility(
                        visible: canViewServiceCategory,
                        child: Container(
                          child: DreamsBeneficiaryCardServiceSummary(
                            services: getServices(),
                            labelColor: valueColor,
                          ),
                        ),
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Table(
                                  children: [
                                    TableRow(
                                      children: [
                                        TableCell(
                                          child: Row(
                                            children: [
                                              HorizontalRowCardData(
                                                labelColor: labelColor,
                                                valueColor: valueColor,
                                                label:
                                                    currentLanguage == 'lesotho'
                                                        ? 'Lilemo'
                                                        : 'Age',
                                                value: agywBeneficiary.age
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TableCell(
                                          child: Row(
                                            children: [
                                              HorizontalRowCardData(
                                                labelColor: labelColor,
                                                valueColor: valueColor,
                                                label:
                                                    currentLanguage == 'lesotho'
                                                        ? 'Boleng'
                                                        : 'Sex',
                                                value: agywBeneficiary.sex,
                                              ),
                                            ],
                                          ),
                                        ),
                                        TableCell(
                                          child: Row(
                                            children: [
                                              HorizontalRowCardData(
                                                labelColor: labelColor,
                                                valueColor: valueColor,
                                                label: 'En Org',
                                                value: agywBeneficiary
                                                    .enrolledOrganisation,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }

  List<List<Map>> getServices() {
    return [
      [
        {
          'name': 'HTS',
          'programStage': ['QNdBI9U7rnV', 'vAMc8n0YB6m']
        },
        {
          'name': 'ART RE-FILL',
          'programStage': ['Gk494qKQP8B']
        },
        {
          'name': 'GBV Messaging',
          'programStage': ['bDJq2JWVTbC']
        },
      ],
      [
        {
          'name': 'PEP',
          'programStage': ['CEyIqiOZOwx']
        },
        {
          'name': 'HIV MESSAGING',
          'programStage': ['PGFt6IwdZLM']
        },
        {
          'name': 'PARENTING',
          'programStage': ['bDJq2JWVTbC']
        },
      ],
      [
        {
          'name': 'PREP',
          'programStage': ['mMjGlK1W0Xo', 'Qw8c20q5V0w']
        },
        {
          'name': 'CONDOMS',
          'programStage': ['NXsIkG9Q1BA']
        },
        {
          'name': '(ES) Economic Strengthening',
          'programStage': ['bDJq2JWVTbC']
        },
      ],
      [
        {
          'name': 'ANC',
          'programStage': ['wA5y7RU83lF']
        },
        {
          'name': 'CONTRACEPTIVES',
          'programStage': ['A7Tl3vML6as']
        },
        {
          'name': '(SAB) Social Assets Building',
          'programStage': ['bDJq2JWVTbC']
        },
      ],
      [
        {
          'name': 'VAC Messaging',
          'programStage': ['bDJq2JWVTbC']
        },
        {
          'name': 'VAC LEGAL MESSAGING',
          'programStage': ['bDJq2JWVTbC']
        },
        {
          'name': 'HIV & VIOLENCE PREVENTION',
          'programStage': ['bDJq2JWVTbC']
        },
      ],
      [
        {
          'name': 'GBV LEGAL MESSAGING',
          'programStage': ['bDJq2JWVTbC']
        },
        {'name': ''},
        {'name': ''},
      ]
    ];
  }
}

class HorizontalRowCardData extends StatelessWidget {
  const HorizontalRowCardData({
    Key? key,
    required this.labelColor,
    required this.valueColor,
    required this.label,
    required this.value,
  }) : super(key: key);

  final Color labelColor;
  final Color valueColor;
  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: RichText(
          text: TextSpan(
              text: '$label   ',
              style: TextStyle().copyWith(
                  color: labelColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: value,
                  style: TextStyle().copyWith(
                      color: valueColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                )
              ]),
        ),
      ),
    );
  }
}

class VerticalRowCardData extends StatelessWidget {
  const VerticalRowCardData({
    Key? key,
    required this.labelColor,
    required this.valueColor,
    required this.label,
    required this.value,
  }) : super(key: key);

  final Color labelColor;
  final Color valueColor;
  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: Text(
          label,
          style: TextStyle().copyWith(
              color: labelColor, fontSize: 14.0, fontWeight: FontWeight.w500),
        )),
        Expanded(
            child: Text(
          value!,
          style: TextStyle().copyWith(
              color: valueColor, fontSize: 14.0, fontWeight: FontWeight.w500),
        ))
      ],
    );
  }
}
