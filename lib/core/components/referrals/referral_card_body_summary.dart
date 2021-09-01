import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/referral_event.dart';
import 'package:provider/provider.dart';

class ReferralCardBodySummary extends StatefulWidget {
  ReferralCardBodySummary({
    Key? key,
    required this.referralEvent,
    required this.labelColor,
    required this.valueColor,
  }) : super(key: key);

  final Events referralEvent;
  final Color labelColor;
  final Color valueColor;

  @override
  _ReferralCardBodySummaryState createState() =>
      _ReferralCardBodySummaryState();
}

class _ReferralCardBodySummaryState extends State<ReferralCardBodySummary> {
  ReferralEvent? ovcReferralCard;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getAndAssignReferralData();
  }

  void getAndAssignReferralData() async {
    ovcReferralCard = await ReferralEvent().fromTeiModel(widget.referralEvent);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading
          ? Container(
              child: Center(
              child: CircularProcessLoader(
                color: Colors.blueGrey,
              ),
            ))
          : Container(
              child: Consumer<LanguageTranslationState>(
                builder: (context, languageTranslationState, child) {
                  String? currentLanguage =
                      languageTranslationState.currentLanguage;
                  return Visibility(
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
                                    ovcReferralCard!.date!,
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
                                    ovcReferralCard!.serviceMode!,
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
                                    ovcReferralCard!.category!,
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
                            margin: EdgeInsets.symmetric(vertical: 2.0),
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
                                    ovcReferralCard!.type!,
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
                                      ovcReferralCard!.status!,
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
                  );
                },
              ),
            ),
    );
  }
}
