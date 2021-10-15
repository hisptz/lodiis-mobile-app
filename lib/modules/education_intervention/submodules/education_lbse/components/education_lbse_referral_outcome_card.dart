import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_outcome_event.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_outcome_follow_up_event.dart';
import 'package:provider/provider.dart';

class EducationLbseReferralOutcomeCard extends StatelessWidget {
  const EducationLbseReferralOutcomeCard({
    Key? key,
    required this.referralOutcomeEvent,
    this.onEditReferralOutcome,
  }) : super(key: key);

  final LbseReferralOutcomeEvent referralOutcomeEvent;
  final VoidCallback? onEditReferralOutcome;

  final double iconHeight = 18.0;
  final String svgIcon = 'assets/icons/edit-icon.svg';
  final Color labelColor = const Color(0xFF009688);
  final Color valueColor = const Color(0xFF82898D);

  Container _getReferralOutcomeDetailData({
    required Color labelColor,
    required Color valueColor,
    required String label,
    String? value,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 5.0,
            ),
            child: Text(
              label,
              style: TextStyle().copyWith(
                color: labelColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            child: Text(
              value!,
              style: TextStyle().copyWith(
                color: valueColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> programStageIds = [
      LbseInterventionConstant.referralOutcomeFollowUpProgamStage
    ];
    return Consumer<ServiceEventDataState>(
        builder: (context, serviceEventDataState, child) {
      Map<String?, List<Events>> eventListByProgramStage =
          serviceEventDataState.eventListByProgramStage;
      List<Events> events = TrackedEntityInstanceUtil
          .getAllEventListFromServiceDataStateByProgramStages(
              eventListByProgramStage, programStageIds);
      List<LbseReferralOutcomeFollowUpEvent> referralOutcomeFollowUps = events
          .map((Events eventData) =>
              LbseReferralOutcomeFollowUpEvent().fromTeiModel(eventData))
          .toList()
          .where(
              (LbseReferralOutcomeFollowUpEvent referralOutcomeFollowUpEvent) =>
                  referralOutcomeFollowUpEvent
                      .referralOutcomeToReferralOutComeFollowingUpLinkage ==
                  referralOutcomeEvent
                      .referralOutcomeToReferralOutComeFollowingUpLinkage)
          .toList();
      bool hasOutccomeHasFollowUps = referralOutcomeFollowUps.length > 0;
      return Consumer<LanguageTranslationState>(
          builder: (context, languageTranslationState, child) {
        String? currentLanguage = languageTranslationState.currentLanguage;
        return Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 15.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      currentLanguage == 'lesotho' ? 'Outcome' : 'Outcome',
                      style: TextStyle().copyWith(
                        color: Color(0xFFB2B7B9),
                      ),
                    ),
                  ),
                  Container(
                    child: Visibility(
                      visible: !hasOutccomeHasFollowUps,
                      child: InkWell(
                        onTap: onEditReferralOutcome,
                        child: Container(
                          height: iconHeight,
                          width: iconHeight,
                          margin: EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 5.0,
                          ),
                          child: SvgPicture.asset(
                            svgIcon,
                            color: Color(0xFF009688),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            LineSeparator(
              color: Color(0xFFB2B7B9),
              height: 1.0,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10.0,
                left: 15.0,
                right: 15.0,
              ),
              child: Column(
                children: [
                  _getReferralOutcomeDetailData(
                    labelColor: labelColor,
                    valueColor: valueColor,
                    label: currentLanguage == 'lesotho'
                        ? 'Date service was provided'
                        : 'Date service was provided',
                    value: referralOutcomeEvent.dateOfServiceProvided,
                  ),
                  _getReferralOutcomeDetailData(
                    labelColor: labelColor,
                    valueColor: valueColor,
                    label: currentLanguage == 'lesotho'
                        ? 'Comments or next steps'
                        : 'Comments or next steps',
                    value: referralOutcomeEvent.comments,
                  ),
                ],
              ),
            )
          ],
        );
      });
    });
  }
}
