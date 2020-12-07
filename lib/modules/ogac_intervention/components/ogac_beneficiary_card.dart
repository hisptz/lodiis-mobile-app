import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/ogac_beneficiary.dart';
import 'package:provider/provider.dart';

class OgacBeneficiaryCard extends StatelessWidget {
  const OgacBeneficiaryCard({
    Key key,
    @required this.ogacBeneficary,
    this.onViewBeneficiary,
    this.onEditBeneficiary,
  }) : super(key: key);

  final OgacBeneficiary ogacBeneficary;
  final VoidCallback onViewBeneficiary;
  final VoidCallback onEditBeneficiary;

  @override
  Widget build(BuildContext context) {
    double iconHeight = 20;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 15.0,
      ),
      child: MaterialCard(
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        ogacBeneficary.toString(),
                        style: TextStyle().copyWith(
                          color: Color(0xFF651900),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: onViewBeneficiary,
                        child: Container(
                          height: iconHeight,
                          width: iconHeight,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: SvgPicture.asset(
                            'assets/icons/expand_icon.svg',
                            color: Color(0xFFF05A2A),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: onEditBeneficiary,
                        child: Container(
                          height: iconHeight,
                          width: iconHeight,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: SvgPicture.asset(
                            'assets/icons/edit-icon.svg',
                            color: Color(0xFFF05A2A),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: LineSeperator(
                  color: Color(0xFFF05A2A).withOpacity(0.4),
                ),
              ),
              Container(
                child: Consumer<LanguageTranslationState>(
                  builder: (context, languageTranslationState, child) {
                    String currentLanguage =
                        languageTranslationState.currentLanguage;
                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Beneficiary Id',
                                    style: TextStyle().copyWith(
                                      color: Color(0xFF651900).withOpacity(0.4),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    ogacBeneficary.benefecaryId,
                                    style: TextStyle().copyWith(
                                      color: Color(0xFF651900).withOpacity(0.8),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    currentLanguage == 'lesotho'
                                        ? 'Lilemo'
                                        : 'Age',
                                    style: TextStyle().copyWith(
                                      color: Color(0xFF651900).withOpacity(0.4),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    ogacBeneficary.age,
                                    style: TextStyle().copyWith(
                                      color: Color(0xFF651900).withOpacity(0.8),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Sex',
                                    style: TextStyle().copyWith(
                                      color: Color(0xFF651900).withOpacity(0.4),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    ogacBeneficary.sex,
                                    style: TextStyle().copyWith(
                                      color: Color(0xFF651900).withOpacity(0.8),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    currentLanguage == 'lesotho'
                                        ? 'Sebaka'
                                        : 'Location',
                                    style: TextStyle().copyWith(
                                      color: Color(0xFF651900).withOpacity(0.4),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    ogacBeneficary.location,
                                    style: TextStyle().copyWith(
                                      color: Color(0xFF651900).withOpacity(0.8),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Created on',
                                    style: TextStyle().copyWith(
                                      color: Color(0xFF651900).withOpacity(0.4),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    ogacBeneficary.createdDate,
                                    style: TextStyle().copyWith(
                                      color: Color(0xFF651900).withOpacity(0.8),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
