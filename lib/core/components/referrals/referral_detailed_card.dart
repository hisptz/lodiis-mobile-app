import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/referral_event.dart';
import 'package:provider/provider.dart';

class ReferralDetailedCard extends StatefulWidget {
  const ReferralDetailedCard({
    Key key,
    @required this.eventData,
    @required this.referralIndex,
    @required this.borderColor,
    @required this.titleColor,
    @required this.labelColor,
    @required this.valueColor,
  }) : super(key: key);

  final Events eventData;
  final int referralIndex;
  final Color borderColor;
  final Color titleColor;
  final Color valueColor;
  final Color labelColor;

  @override
  _ReferralDetailedCardState createState() => _ReferralDetailedCardState();
}

class _ReferralDetailedCardState extends State<ReferralDetailedCard> {
  ReferralEvent ovcReferralCard;

  @override
  void initState() {
    super.initState();
    ovcReferralCard = ReferralEvent().fromTeiModel(widget.eventData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String currentLanguage = languageTranslationState.currentLanguage;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Referral ${widget.referralIndex.toString()}',
                        style: TextStyle().copyWith(
                          color: widget.titleColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              LineSeperator(
                color: widget.borderColor,
                height: 2,
              ),
              Visibility(
                visible: ovcReferralCard != null,
                child: Container(
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
                              child: Text(
                                currentLanguage == 'lesotho'
                                    ? 'Letsatsi'
                                    : 'Date',
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: widget.labelColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                ovcReferralCard.date,
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: widget.valueColor,
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
                              child: Text(
                                currentLanguage == 'lesotho'
                                    ? 'Tsela ea tsebetso'
                                    : 'Service mode',
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: widget.labelColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                ovcReferralCard.serviceMode,
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: widget.valueColor,
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
                              child: Text(
                                'Category',
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: widget.labelColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                ovcReferralCard.category,
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: widget.valueColor,
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
                              child: Text(
                                currentLanguage == 'lesotho'
                                    ? 'Mofuta'
                                    : 'Type',
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: widget.labelColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                ovcReferralCard.type,
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: widget.valueColor,
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
                              child: Text(
                                'Status',
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: widget.labelColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Text(
                                  ovcReferralCard.status,
                                  style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                    color: widget.valueColor,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                              child: Text(
                                'Comments',
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: widget.labelColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Text(
                                  ovcReferralCard.comments,
                                  style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                    color: widget.valueColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
