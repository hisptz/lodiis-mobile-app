import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/models/clo_referral_event.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:provider/provider.dart';

class CLOReferralCardBodySummary extends StatefulWidget {
  const CLOReferralCardBodySummary({
    Key? key,
    required this.referralEvent,
    required this.labelColor,
    required this.valueColor,
  }) : super(key: key);

  final Events referralEvent;
  final Color labelColor;
  final Color valueColor;

  @override
  State<CLOReferralCardBodySummary> createState() =>
      _CLOReferralCardBodySummaryState();
}

class _CLOReferralCardBodySummaryState
    extends State<CLOReferralCardBodySummary> {
  CLOReferralEvent? ovcCLOReferralCard;

  @override
  void initState() {
    super.initState();
    ovcCLOReferralCard = CLOReferralEvent().fromTeiModel(widget.referralEvent);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
      String? currentLanguage = languageTranslationState.currentLanguage;
      return Visibility(
        visible: ovcCLOReferralCard != null,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        currentLanguage == 'lesotho' ? 'Letsatsi' : 'Date',
                        style: const TextStyle().copyWith(
                            fontSize: 14.0,
                            color: widget.labelColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        ovcCLOReferralCard!.referralDate!,
                        style: const TextStyle().copyWith(
                            fontSize: 14.0,
                            color: widget.valueColor,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Referral for',
                        style: const TextStyle().copyWith(
                            fontSize: 14.0,
                            color: widget.labelColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        ovcCLOReferralCard!.referralFor!,
                        style: const TextStyle().copyWith(
                            fontSize: 14.0,
                            color: widget.valueColor,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Outcome Status ',
                        style: const TextStyle().copyWith(
                            fontSize: 14.0,
                            color: widget.labelColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        ovcCLOReferralCard!.outComeStatus!,
                        style: const TextStyle().copyWith(
                            fontSize: 14.0,
                            color: widget.valueColor,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Community Partner',
                          style: const TextStyle().copyWith(
                              fontSize: 14.0,
                              color: widget.labelColor,
                              fontWeight: FontWeight.w500),
                        )),
                    Expanded(
                      flex: 2,
                      child: Text(
                        ovcCLOReferralCard!.communityPartner!,
                        style: const TextStyle().copyWith(
                          fontSize: 14.0,
                          color: widget.valueColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
