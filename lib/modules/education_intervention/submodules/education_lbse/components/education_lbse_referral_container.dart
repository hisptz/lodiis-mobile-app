import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/components/education_lbse_referral_body.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/components/education_lbse_referral_header.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/components/education_lbse_referral_outcome_container.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_event.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_outcome_event.dart';
import 'package:provider/provider.dart';

class EducationLbseReferralContainer extends StatelessWidget {
  const EducationLbseReferralContainer({
    Key? key,
    required this.referralIndex,
    required this.lbseReferral,
    this.onView,
    this.onEdit,
  }) : super(key: key);

  final int referralIndex;
  final LbseReferralEvent lbseReferral;

  final VoidCallback? onView;
  final VoidCallback? onEdit;

  bool _canEditLbseReferral(BuildContext context) {
    List<String> programStageIds = [
      LbseInterventionConstant.referralOutcomeProgamStage
    ];
    Map<String?, List<Events>> eventListByProgramStage =
        Provider.of<ServiceEventDataState>(context, listen: false)
            .eventListByProgramStage;
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
            eventListByProgramStage, programStageIds);
    List<LbseReferralOutcomeEvent> referralOutcomeEvents = events
        .map((Events eventData) =>
            LbseReferralOutcomeEvent().fromTeiModel(eventData))
        .toList()
        .where((LbseReferralOutcomeEvent referralOutcomeEvent) =>
            referralOutcomeEvent.referralToReferralOutcomeLinkage ==
            lbseReferral.referralToReferralOutcomeLinkage)
        .toList();
    return referralOutcomeEvents.isEmpty &&
        lbseReferral.enrollmentOuAccessible!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15.0,
      ),
      child: MaterialCard(
        body: Column(
          children: [
            EducationLbseReferralHeader(
              referralIndex: referralIndex,
              canEdit: _canEditLbseReferral(context),
              onEdit: onEdit,
              onView: onView,
            ),
            EducationLbseReferralBody(
              lbseReferral: lbseReferral,
            ),
            EducationLbseReferralOutComeContainer(
              lbseReferral: lbseReferral,
            )
          ],
        ),
      ),
    );
  }
}
