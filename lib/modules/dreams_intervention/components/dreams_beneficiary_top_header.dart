import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:provider/provider.dart';

class DreamsBeneficiaryTopHeader extends StatelessWidget {
  const DreamsBeneficiaryTopHeader({
    @required this.agywDream,
    Key key,
  }) : super(key: key);

  final AgywDream agywDream;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String currentLanguage = languageTranslationState.currentLanguage;
          return Material(
            type: MaterialType.card,
            elevation: 1.0,
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                agywDream.toString(),
                                style: TextStyle().copyWith(
                                    color: Color(0xFF05131B),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                agywDream.primaryUIC,
                                style: TextStyle().copyWith(
                                    color: Color(0xFF05131B),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: LineSeparator(color: Color(0XFFE9F4FA)),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 10.0,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text: currentLanguage == 'lesotho'
                                        ? 'Boleng  '
                                        : 'Sex  ',
                                    style: TextStyle().copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF82898D),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: agywDream.sex,
                                        style: TextStyle().copyWith(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF1F8ECE),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text: currentLanguage == 'lesotho'
                                        ? 'Lilemo  '
                                        : 'Age  ',
                                    style: TextStyle().copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF82898D),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: agywDream.age,
                                        style: TextStyle().copyWith(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF1F8ECE),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Status  ',
                                    style: TextStyle().copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF82898D),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: agywDream.programStatus,
                                        style: TextStyle().copyWith(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF1F8ECE),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]))
                  ],
                )),
          );
        },
      ),
    );
  }
}
