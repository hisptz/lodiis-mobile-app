import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/components/education_bursary_referral_body.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/components/education_bursary_referral_header.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/components/education_bursary_referral_outcome_container.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/models/bursary_referral_event.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/models/bursary_referral_outcome_event.dart';
import 'package:provider/provider.dart';

class EducationBursaryReferralContainer extends StatelessWidget {
  const EducationBursaryReferralContainer({
    Key? key,
    required this.referralIndex,
    required this.bursaryReferral,
    this.onView,
    this.onEdit,
  }) : super(key: key);

  final int referralIndex;
  final BursaryReferralEvent bursaryReferral;

  final VoidCallback? onView;
  final VoidCallback? onEdit;

  bool _canEditLbseReferral(BuildContext context) {
    List<String> programStageIds = [
      BursaryInterventionConstant.clubAttendanceReferralOutcomeProgamStage
    ];
    Map<String?, List<Events>> eventListByProgramStage =
        Provider.of<ServiceEventDataState>(context, listen: false)
            .eventListByProgramStage;
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
            eventListByProgramStage, programStageIds);
    List<BursaryReferralOutcomeEvent> referralOutcomeEvents = events
        .map((Events eventData) =>
            BursaryReferralOutcomeEvent().fromTeiModel(eventData))
        .toList()
        .where((BursaryReferralOutcomeEvent referralOutcomeEvent) =>
            referralOutcomeEvent.referralToReferralOutcomeLinkage ==
            bursaryReferral.referralToReferralOutcomeLinkage)
        .toList();
    return referralOutcomeEvents.isEmpty &&
        bursaryReferral.enrollmentOuAccessible!;
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
            EducationBursaryReferralHeader(
              referralIndex: referralIndex,
              canEdit: _canEditLbseReferral(context),
              onEdit: onEdit,
              onView: onView,
            ),
            EducationBursaryReferralBody(
              bursaryReferral: bursaryReferral,
            ),
            EducationBursaryReferralOutComeContainer(
              bursaryReferral: bursaryReferral,
            )
          ],
        ),
      ),
    );
  }
}
