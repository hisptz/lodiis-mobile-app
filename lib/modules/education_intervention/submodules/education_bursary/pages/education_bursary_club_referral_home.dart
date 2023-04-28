import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/education_intervention_state/education_intervention_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/education_intervention/components/education_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/components/education_bursary_referral_container.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_routes_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/models/bursary_referral_event.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/pages/education_bursary_club_referral_form_page.dart';
import 'package:provider/provider.dart';

class EducationBursaryClubReferralHome extends StatelessWidget {
  const EducationBursaryClubReferralHome({Key? key}) : super(key: key);

  final String label = 'Bursary Referral';

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
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('location', eventData.orgUnit);
      for (Map dataValue in eventData.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
  }

  void redirectToReferralForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const EducationBursaryReferralFormPage();
        },
      ),
    );
  }

  onViewReferral(
    BuildContext context,
    Events eventData,
  ) {
    bool isEditableMode = false;
    updateFormState(context, isEditableMode, eventData);
    redirectToReferralForm(context);
  }

  onEditReferral(
    BuildContext context,
    EducationBeneficiary bursaryBeneficiary,
    Events eventData,
  ) async {
    bool isEditableMode = true;
    String? beneficiaryId = bursaryBeneficiary.id;
    String eventId = eventData.event!;
    String formAutoSaveId =
        '${BursaryRoutesConstant.clubReferralPageModule}_${beneficiaryId}_$eventId';
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave,
            beneficiaryName: bursaryBeneficiary.toString());
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      updateFormState(context, isEditableMode, eventData);
      redirectToReferralForm(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> programStageIds = [
      BursaryInterventionConstant.clubAttendanceReferralProgamStage
    ];
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: Consumer<InterventionCardState>(
            builder: (context, interventionCardState, child) {
              InterventionCard activeInterventionProgram =
                  interventionCardState.currentInterventionProgram;
              return SubPageAppBar(
                label: label,
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SubPageBody(
          body: Consumer<EducationInterventionCurrentSelectionState>(
            builder:
                (context, educationInterventionCurrentSelectionState, child) {
              return Consumer<ServiceEventDataState>(
                builder: (context, serviceEventDataState, child) {
                  EducationBeneficiary? bursaryBeneficiary =
                      educationInterventionCurrentSelectionState
                          .currentBeneficiciary;
                  bool isLoading = serviceEventDataState.isLoading;
                  Map<String?, List<Events>> eventListByProgramStage =
                      serviceEventDataState.eventListByProgramStage;
                  List<Events> events = TrackedEntityInstanceUtil
                      .getAllEventListFromServiceDataStateByProgramStages(
                          eventListByProgramStage, programStageIds);
                  List<BursaryReferralEvent> lbseReferrals = events
                      .map((Events eventData) =>
                          BursaryReferralEvent().fromTeiModel(eventData))
                      .toList()
                    ..sort((b, a) => a.date!.compareTo(b.date!));
                  int referralIndex = lbseReferrals.length + 1;
                  return Column(
                    children: [
                      EducationBeneficiaryTopHeader(
                        educationBeneficiary: bursaryBeneficiary!,
                      ),
                      Container(
                        child: isLoading
                            ? const CircularProcessLoader(
                                color: Colors.blueGrey,
                              )
                            : Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                    ),
                                    child: events.isEmpty
                                        ? const Text(
                                            'There is no referral at a moment',
                                          )
                                        : Container(
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 5.0,
                                              horizontal: 13.0,
                                            ),
                                            child: Column(
                                              children: lbseReferrals.map(
                                                  (BursaryReferralEvent
                                                      bursaryReferral) {
                                                referralIndex--;
                                                return EducationBursaryReferralContainer(
                                                  bursaryReferral:
                                                      bursaryReferral,
                                                  referralIndex: referralIndex,
                                                  onView: () => onViewReferral(
                                                      context,
                                                      bursaryReferral
                                                          .eventData!),
                                                  onEdit: () => onEditReferral(
                                                      context,
                                                      bursaryBeneficiary,
                                                      bursaryReferral
                                                          .eventData!),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
