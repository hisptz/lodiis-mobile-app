import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/pp_prev_intervention_state/pp_prev_intervention_current_selection_state.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_referral/pp_prev_referral_card_container.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/constants/pp_prev_intervention_constant.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/constants/pp_prev_routes_constant.dart';
import 'package:provider/provider.dart';

import 'pp_prev_intervention_referral_form.dart';

class PpPrevInterventionReferralManage extends StatelessWidget {
  const PpPrevInterventionReferralManage({
    Key? key,
    required this.eventData,
    required this.referralIndex,
  }) : super(key: key);

  final Events eventData;
  final int referralIndex;

  final String label = 'Manage PP Prev Referral';

  void onEditPpPrevReferral(
    BuildContext context,
    PpPrevBeneficiary ppPrevBeneficiary,
    Events eventData,
  ) async {
    bool isEditableMode = true;
    String? beneficiaryId = ppPrevBeneficiary.id;
    String eventId = eventData.event ?? '';
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
          FormUtil.updateServiceFormState(context, isEditableMode, eventData);
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
    return Scaffold(
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
      body: Consumer<InterventionCardState>(
        builder: (context, interventionCardState, child) {
          InterventionCard activeInterventionProgram =
              interventionCardState.currentInterventionProgram;
          return Consumer<PpPrevInterventionCurrentSelectionState>(
            builder: (context, pPrevBeneficiarySelectionState, child) {
              var ppPrevBeneficiary =
                  pPrevBeneficiarySelectionState.currentPpPrev;
              return Container(
                decoration: BoxDecoration(
                  color: activeInterventionProgram.background,
                ),
                child: Column(
                  children: [
                    PpPrevBeneficiaryTopHeader(
                      ppPrevBeneficiary: ppPrevBeneficiary!,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 13.0,
                      ),
                      child: PpPrevReferralCardContainer(
                        referralIndex: referralIndex,
                        titleColor:
                            PpPrevInterventionConstant.referralCardTitleColor,
                        labelColor: PpPrevInterventionConstant.labelColor,
                        valueColor:
                            PpPrevInterventionConstant.referralCardValueColor,
                        themeColor: PpPrevInterventionConstant.inputColor,
                        referralEventData: eventData,
                        referralOutcomeProgramStage: PpPrevInterventionConstant
                            .referralOutcomeProgramStage,
                        referralOutcomeLinkage:
                            PpPrevInterventionConstant.referralOutcomeLinkage,
                        beneficiary: ppPrevBeneficiary,
                        enrollmentOuAccessible:
                            ppPrevBeneficiary.enrollmentOuAccessible!,
                        referralProgram: PpPrevInterventionConstant.program,
                        canEdit: true,
                        isOnManage: true,
                        isOnView: false,
                        onManage: () {},
                        onView: () => {},
                        onEditReferral: () => onEditPpPrevReferral(
                          context,
                          ppPrevBeneficiary,
                          eventData,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
