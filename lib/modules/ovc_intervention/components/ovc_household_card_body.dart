import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:provider/provider.dart';

class OvcHouseholdCardBody extends StatelessWidget {
  OvcHouseholdCardBody({
    Key? key,
    required this.ovcHousehold,
  }) : super(key: key);

  final OvcHousehold ovcHousehold;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String? currentLanguage = languageTranslationState.currentLanguage;
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: 13.0,
              vertical: 10.0,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 2.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          currentLanguage == 'lesotho'
                              ? 'Mohlokomeli'
                              : 'Caregiver',
                          style: TextStyle().copyWith(
                            fontSize: 14.0,
                            color: Color(0XFF92A791),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          ovcHousehold.toString(),
                          style: TextStyle().copyWith(
                            fontSize: 14.0,
                            color: Color(0XFF536852),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 2.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Created',
                          style: TextStyle().copyWith(
                            fontSize: 14.0,
                            color: Color(0XFF92A791),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          ovcHousehold.createdDate!,
                          style: TextStyle().copyWith(
                            fontSize: 14.0,
                            color: Color(0XFF536852),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 2.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          currentLanguage == 'lesotho' ? 'Sebaka' : 'Location',
                          style: TextStyle().copyWith(
                            fontSize: 14.0,
                            color: Color(0XFF92A791),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          ovcHousehold.location!,
                          style: TextStyle().copyWith(
                            fontSize: 14.0,
                            color: Color(0XFF536852),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 2.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          '# of OVC',
                          style: TextStyle().copyWith(
                            fontSize: 14.0,
                            color: Color(0XFF92A791),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                currentLanguage == 'lesotho'
                                    ? 'Mosali - ${ovcHousehold.ovcFemaleCount}'
                                    : 'Female - ${ovcHousehold.ovcFemaleCount}',
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: Color(0XFF536852),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              height: 14.0,
                              margin: EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xFFC9E2C7),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                currentLanguage == 'lesotho'
                                    ? 'Monna - ${ovcHousehold.ovcMaleCount}'
                                    : 'Male - ${ovcHousehold.ovcMaleCount}',
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: Color(0XFF536852),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
