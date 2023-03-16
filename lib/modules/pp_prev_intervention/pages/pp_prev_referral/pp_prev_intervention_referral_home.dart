import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/pp_prev_intervention_state/pp_prev_intervention_current_selection_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_referral/pp_prev_referral_card_container.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/constants/pp_prev_intervention_constant.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/constants/pp_prev_routes_constant.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/pages/pp_prev_referral/pp_prev_intervention_referral_form.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/pages/pp_prev_referral/pp_prev_intervention_referral_manage.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/pages/pp_prev_referral/pp_prev_intervention_referral_view.dart';
import 'package:provider/provider.dart';

class PpPrevInterventionReferralHome extends StatelessWidget {
  const PpPrevInterventionReferralHome({Key? key}) : super(key: key);

  final String title = 'PP Prev Referral';

  void redirectToPpPrevReferral(BuildContext context) {}

  void onManageReferral(
    BuildContext context,
    Events eventData,
    int referralIndex,
  ) {
    FormUtil.updateServiceFormState(context, false, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PpPrevInterventionReferralManage(
            eventData: eventData,
            referralIndex: referralIndex,
          );
        },
      ),
    );
  }

  void onViewReferral(
    BuildContext context,
    Events eventData,
    int referralIndex,
  ) {
    FormUtil.updateServiceFormState(context, false, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PpPrevInterventionReferralView(
            eventData: eventData,
            referralIndex: referralIndex,
          );
        },
      ),
    );
  }

  void onAddPpPrevReferral(
      BuildContext context, PpPrevBeneficiary ppPrevBeneficiary) async {
    bool isEditableMode = true;
    String? beneficiaryId = ppPrevBeneficiary.id;
    String eventId = '';
    String formAutoSaveId =
        "${PpPrevRoutesConstant.referralFormPageModule}_${beneficiaryId}_$eventId";
    await FormAutoSaveOfflineService()
        .getSavedFormAutoData(formAutoSaveId)
        .then((formAutoSave) {
      AppResumeRoute()
          .shouldResumeWithUnSavedChanges(context, formAutoSave,
              beneficiaryName: ppPrevBeneficiary.toString())
          .then((shouldResumeWithUnSavedChanges) {
        if (shouldResumeWithUnSavedChanges) {
          AppResumeRoute().redirectToPages(context, formAutoSave);
        } else {
          FormUtil.updateServiceFormState(context, isEditableMode, null);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const PpPrevInterventionReferralForm();
              },
            ),
          );
        }
      });
    }).catchError((error) {
      AppUtil.showToastMessage(
          message: error.toString(), position: ToastGravity.BOTTOM);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> programStageIds = [
      PpPrevInterventionConstant.referralProgramStage,
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
                label: title,
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SubPageBody(
          body: Consumer<PpPrevInterventionCurrentSelectionState>(
            builder: (context, pPrevBeneficiarySelectionState, child) {
              return Consumer<ServiceEventDataState>(
                builder: (context, serviceEventDataState, child) {
                  PpPrevBeneficiary? ppPrevBeneficiary =
                      pPrevBeneficiarySelectionState.currentPpPrev;
                  bool isLoading = serviceEventDataState.isLoading;
                  Map<String?, List<Events>> eventListByProgramStage =
                      serviceEventDataState.eventListByProgramStage;
                  List<Events> events = TrackedEntityInstanceUtil
                      .getAllEventListFromServiceDataStateByProgramStages(
                          eventListByProgramStage, programStageIds,
                          shouldSortByDate: true);
                  int serviceIndex = events.length + 1;
                  return Column(
                    children: [
                      PpPrevBeneficiaryTopHeader(
                        ppPrevBeneficiary: ppPrevBeneficiary!,
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
                                            'There is no referral service at a moment',
                                          )
                                        : Container(
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 5.0,
                                              horizontal: 13.0,
                                            ),
                                            child: Column(
                                              children: events.map(
                                                  (Events referralEventData) {
                                                serviceIndex--;
                                                return PpPrevReferralCardContainer(
                                                  referralIndex: serviceIndex,
                                                  titleColor:
                                                      PpPrevInterventionConstant
                                                          .referralCardTitleColor,
                                                  labelColor:
                                                      PpPrevInterventionConstant
                                                          .labelColor,
                                                  valueColor:
                                                      PpPrevInterventionConstant
                                                          .referralCardValueColor,
                                                  themeColor:
                                                      PpPrevInterventionConstant
                                                          .inputColor,
                                                  referralEventData:
                                                      referralEventData,
                                                  referralOutcomeProgramStage:
                                                      PpPrevInterventionConstant
                                                          .referralOutcomeProgramStage,
                                                  referralOutcomeLinkage:
                                                      PpPrevInterventionConstant
                                                          .referralOutcomeLinkage,
                                                  beneficiary:
                                                      ppPrevBeneficiary,
                                                  enrollmentOuAccessible:
                                                      ppPrevBeneficiary
                                                          .enrollmentOuAccessible!,
                                                  referralProgram:
                                                      PpPrevInterventionConstant
                                                          .program,
                                                  onManage: () =>
                                                      onManageReferral(
                                                    context,
                                                    referralEventData,
                                                    serviceIndex,
                                                  ),
                                                  onView: () => onViewReferral(
                                                    context,
                                                    referralEventData,
                                                    serviceIndex,
                                                  ),
                                                  onEditReferral: () {},
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                  ),
                                  EntryFormSaveButton(
                                    label: 'ADD Referral',
                                    labelColor: Colors.white,
                                    buttonColor: const Color(0xFF9B2BAE),
                                    fontSize: 15.0,
                                    onPressButton: () => onAddPpPrevReferral(
                                        context, ppPrevBeneficiary),
                                  )
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
