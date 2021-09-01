import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_card_data.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/referral_event.dart';
import 'package:provider/provider.dart';

class ReferralCardBodySummary extends StatefulWidget {
  ReferralCardBodySummary({
    Key? key,
    required this.referralEvent,
    required this.labelColor,
    required this.valueColor,
    required this.isIncommingReferral,
  }) : super(key: key);

  final Events referralEvent;
  final Color labelColor;
  final Color valueColor;
  final bool isIncommingReferral;

  @override
  _ReferralCardBodySummaryState createState() =>
      _ReferralCardBodySummaryState();
}

class _ReferralCardBodySummaryState extends State<ReferralCardBodySummary> {
  ReferralEvent? referralDataCard;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    print("isIncommingReferral=>${widget.isIncommingReferral}");
    getAndAssignReferralCardData();
  }

  void getAndAssignReferralCardData() async {
    referralDataCard = await ReferralEvent().fromTeiModel(widget.referralEvent);
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
              ),
            )
          : Container(
              child: Consumer<LanguageTranslationState>(
                builder: (context, languageTranslationState, child) {
                  String? currentLanguage =
                      languageTranslationState.currentLanguage;
                  return Visibility(
                    visible: referralDataCard != null,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 13.0,
                        vertical: 10.0,
                      ),
                      child: ReferralCardData(
                        currentLanguage: currentLanguage!,
                        labelColor: widget.labelColor,
                        valueColor: widget.valueColor,
                        referralDataCard: referralDataCard!,
                        isIncommingReferral: widget.isIncommingReferral,
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
