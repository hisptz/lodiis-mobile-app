import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_event.dart';
import 'package:provider/provider.dart';

class EducationLbseReferralOutComeContainer extends StatelessWidget {
  const EducationLbseReferralOutComeContainer({
    Key? key,
    required this.lbseReferral,
  }) : super(key: key);

  final LbseReferralEvent lbseReferral;

  void onAddingOutcome(BuildContext context) {
    print("On add outcome");
  }

  void onEditOutcome(BuildContext context) {
    print("On edit outcome");
  }

  void onAddOutComeFollowingUps(BuildContext context) {
    print("On add outcome following ups");
  }

  void onEditOutComeFollowingUps(BuildContext context) {
    print("On edit outcome following ups");
  }

  Container _getActionButton({
    required Color backgroundColor,
    required String label,
    required Color labelColor,
    required VoidCallback onTap,
  }) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
        child: Container(
          width: double.infinity,
          color: backgroundColor,
          child: Container(
            child: InkWell(
              onTap: onTap,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 15.0,
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle().copyWith(
                      color: labelColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> programStageIds = [
      LbseInterventionConstant.referralOutcomeProgamStage
    ];

    return Container(
      child: Container(
        child: Column(
          children: [
            Container(
              child: LineSeparator(
                color: Color(0xFF009688).withOpacity(0.3),
              ),
            ),
            Container(
              child: Consumer<ServiceEventDataState>(
                  builder: (context, serviceFormState, child) {
                bool isLoading = serviceFormState.isLoading;
                Map<String?, List<Events>> eventListByProgramStage =
                    serviceFormState.eventListByProgramStage;
                List<Events> events = TrackedEntityInstanceUtil
                    .getAllEventListFromServiceDataStateByProgramStages(
                        eventListByProgramStage, programStageIds);
                bool shouldAddOutcome = events.length == 0;
                return isLoading
                    ? Container(
                        child: CircularProcessLoader(
                          color: Colors.blueGrey,
                        ),
                      )
                    : Container(
                        child: shouldAddOutcome
                            ? _getActionButton(
                                backgroundColor:
                                    Color(0xFF009688).withOpacity(0.1),
                                label: 'ADD OUTCOME',
                                labelColor: Color(0xFF009688),
                                onTap: () => onAddingOutcome(context),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 15.0,
                                ),
                                child: Column(
                                  children: events
                                      .map(
                                        (e) => Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: 15.0,
                                            horizontal: 15.0,
                                          ),
                                          child: Text('Listi of outcome'),
                                        ),
                                      )
                                      .toList()
                                    ..add(Container(
                                      child: Visibility(
                                        child: _getActionButton(
                                          backgroundColor: Color(0xFF009688),
                                          label: 'ADD FOLLOW UP',
                                          labelColor: Colors.white,
                                          onTap: () =>
                                              onAddOutComeFollowingUps(context),
                                        ),
                                      ),
                                    )),
                                ),
                              ),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
