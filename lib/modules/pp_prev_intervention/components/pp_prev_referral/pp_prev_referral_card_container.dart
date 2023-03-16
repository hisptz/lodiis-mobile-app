import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/components/referrals/beneficiary_referral_card_button.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_referral/pp_prev_referral_card_body.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_referral/pp_prev_referral_outcome_container.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/models/pp_prev_referral_event.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/models/pp_prev_referral_outcome_event.dart';
import 'package:provider/provider.dart';

class PpPrevReferralCardContainer extends StatefulWidget {
  const PpPrevReferralCardContainer({
    Key? key,
    required this.referralIndex,
    required this.themeColor,
    required this.titleColor,
    required this.labelColor,
    required this.valueColor,
    required this.referralEventData,
    required this.beneficiary,
    required this.enrollmentOuAccessible,
    required this.referralProgram,
    required this.referralOutcomeProgramStage,
    required this.referralOutcomeLinkage,
    this.isOnView = false,
    this.isOnManage = false,
    this.canEdit = false,
    this.prefixReferralTitle = 'Referral',
    required this.onManage,
    required this.onView,
    required this.onEditReferral,
  }) : super(key: key);

  final Events referralEventData;
  final bool enrollmentOuAccessible;
  final PpPrevBeneficiary beneficiary;
  final String referralProgram;
  final String referralOutcomeProgramStage;
  final String referralOutcomeLinkage;
  final String prefixReferralTitle;
  final Color themeColor;
  final Color titleColor;
  final Color labelColor;
  final Color valueColor;
  final int referralIndex;
  final bool isOnView;
  final bool isOnManage;
  final bool canEdit;

  final VoidCallback onView;
  final VoidCallback onManage;
  final VoidCallback onEditReferral;

  @override
  State<PpPrevReferralCardContainer> createState() =>
      _PpPrevReferralCardContainerState();
}

class _PpPrevReferralCardContainerState
    extends State<PpPrevReferralCardContainer> {
  bool _isLoading = true;
  late PpPrevReferralEvent referralEvent;

  @override
  void initState() {
    super.initState();
    setReferralEventDataModel();
  }

  void setReferralEventDataModel() async {
    referralEvent =
        await PpPrevReferralEvent().fromEventModel(widget.referralEventData);
    _isLoading = false;
    Timer(const Duration(milliseconds: 100), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15.0,
      ),
      child: _isLoading
          ? Container(
              margin: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: const CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            )
          : MaterialCard(
              body: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 15.0,
                          ),
                          child: Text(
                            '${widget.prefixReferralTitle} ${widget.referralIndex}',
                            style: const TextStyle().copyWith(
                              color: widget.titleColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      Consumer<ServiceEventDataState>(
                          builder: (context, serviceEventDataState, child) {
                        var isReferralHavingOutcome = TrackedEntityInstanceUtil
                            .getAllEventListFromServiceDataStateByProgramStages(
                          serviceEventDataState.eventListByProgramStage,
                          [widget.referralOutcomeProgramStage],
                          shouldSortByDate: true,
                        ).any((Events eventData) {
                          PpPrevReferralOutcomeEvent referralOutComeEvent =
                              PpPrevReferralOutcomeEvent().fromEventModel(
                            eventData: eventData,
                            referralToOutcomeReference:
                                widget.referralOutcomeLinkage,
                          );
                          return referralOutComeEvent.referralReference ==
                              referralEvent.id;
                        });
                        return Visibility(
                          visible: widget.canEdit && !isReferralHavingOutcome,
                          child: InkWell(
                            onTap: widget.onEditReferral,
                            child: Container(
                              height: 20.0,
                              width: 20.0,
                              margin: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/edit-icon.svg',
                                color: widget.themeColor,
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                  LineSeparator(
                    color: widget.themeColor.withOpacity(0.2),
                    height: 2.0,
                  ),
                  PpPrevReferralCardBody(
                    referralEvent: referralEvent,
                    labelColor: widget.labelColor,
                    valueColor: widget.valueColor,
                  ),
                  Visibility(
                    visible: widget.isOnManage,
                    child: PpPrevReferralOutcomeContainer(
                      enrollmentOuAccessible: widget.enrollmentOuAccessible,
                      beneficiary: widget.beneficiary,
                      referralProgram: widget.referralProgram,
                      referralOutcomeProgramStage:
                          widget.referralOutcomeProgramStage,
                      referralOutcomeLinkage: widget.referralOutcomeLinkage,
                      referralEvent: referralEvent,
                      labelColor: widget.themeColor,
                      valueColor: widget.valueColor,
                      canAddViewOutcome: referralEvent.id != null,
                    ),
                  ),
                  Visibility(
                    visible: !(widget.isOnView || widget.isOnManage),
                    child: BeneficiaryReferralCardButton(
                      themeColor: widget.themeColor,
                      onManage: widget.onManage,
                      onView: widget.onView,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
