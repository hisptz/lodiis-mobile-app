import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/components/education_lbse_referral_outcome_following_up_modal.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/components/education_lbse_referral_outcome_modal.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/education_lbse_referral_outcome_follow_up_form.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/education_lbse_referral_outcome_form.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_event.dart';
import 'package:provider/provider.dart';

class EducationLbseReferralOutComeContainer extends StatelessWidget {
  const EducationLbseReferralOutComeContainer({
    Key? key,
    required this.lbseReferral,
  }) : super(key: key);

  final LbseReferralEvent lbseReferral;

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    Events? eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.event);
      for (Map dataValue in eventData.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
  }

  void onAddOrEditOutcome(
    BuildContext context,
    bool isEditableMode,
    Events? eventData,
  ) async {
    updateFormState(context, isEditableMode, eventData);
    Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
        LbseInterventionConstant.referralToReferralOutcomeLinkage,
        lbseReferral.referralToReferralOutcomeLinkage);
    List<FormSection> formSections =
        EducationLbseReferralOutcomeForm.getFormSections();
    Widget modal = EducationLbseRefferalOutcomeModal(
      formSections: formSections,
    );
    Map dataObject = await AppUtil.showPopUpModal(
      context,
      modal,
      true,
      title: 'Referral Ourcome',
    );
    if (dataObject.keys.length > 0 && isEditableMode) {
      print(dataObject);
    }
  }

  void onAddOrEditOutcomeFollowingUp(
    BuildContext context,
    bool isEditableMode,
    Events? eventData,
  ) async {
    updateFormState(context, isEditableMode, eventData);
    //@TODO adding linkeage to referral outcome following ups
    // Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
    //     LbseInterventionConstant.referralToReferralOutcomeLinkage,
    //     lbseReferral.referralToReferralOutcomeLinkage);
    List<FormSection> formSections =
        EducationLbseReferralOutcomeFollowUpForm.getFormSections();
    Widget modal = EducationLbseRefferalOutcomeFollowingUpModal(
      formSections: formSections,
    );
    Map dataObject = await AppUtil.showPopUpModal(
      context,
      modal,
      true,
      title: 'Referral Ourcome',
    );
    if (dataObject.keys.length > 0 && isEditableMode) {
      print(dataObject);
    }
  }

  void onAddingOutcome(BuildContext context) {
    bool isEditableMode = true;
    onAddOrEditOutcome(context, isEditableMode, null);
  }

  void onEditOutcome(BuildContext context) {
    bool isEditableMode = true;
    //@TODO adding event for edited  outcome
    onAddOrEditOutcome(context, isEditableMode, null);
  }

  void onAddOutComeFollowingUps(BuildContext context) {
    bool isEditableMode = true;
    onAddOrEditOutcomeFollowingUp(context, isEditableMode, null);
  }

  void onEditOutComeFollowingUps(BuildContext context) {
    bool isEditableMode = true;
    //@TODO adding event for edited  outcome following up
    onAddOrEditOutcomeFollowingUp(context, isEditableMode, null);
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
