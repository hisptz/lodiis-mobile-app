import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/implementing_partner_referral_service_state/implementing_partner_referral_service_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/referral_notification_state/referral_notification_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_card_body_summary.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_card_summary.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/agyw_dreams_common_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/constant/dreams_agyw_referral_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/pages/dream_agyw_referral_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/pages/dream_referral_manage.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/pages/dream_referral_view.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/utils/agyw_dreams_referral_util.dart';
import 'package:provider/provider.dart';

class DreamsAgywReferralPage extends StatefulWidget {
  const DreamsAgywReferralPage({
    Key? key,
    required this.isIncomingReferral,
  }) : super(key: key);

  final bool isIncomingReferral;
  @override
  _DreamsAgywReferralPageState createState() => _DreamsAgywReferralPageState();
}

class _DreamsAgywReferralPageState extends State<DreamsAgywReferralPage> {
  final String label = 'Agyw Referral';
  final List<String> programStageIds = [
    DreamsAgywReferralConstant.programStage
  ];

  void onAddReferral(BuildContext context, AgywDream agywDream) async {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: true);
    CurrentUser? user = await UserService().getCurrentUser();
    await Provider.of<ImplementingPartnerReferralServiceState>(context,
            listen: false)
        .setImplementingPartnerServices();
    String eventId = '';
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywDreamsReferralPage}_${agywDream.id}_$eventId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DreamsAgywAddReferralForm(
            currentUser: user,
          ),
        ),
      );
    }
  }

  void onViewReferral(
    BuildContext context,
    Events eventData,
    int referralIndex,
  ) {
    AgywDreamsReferralUtil.updateViewStatusOfReferralNotification(
        context, eventData);
    FormUtil.updateServiceFormState(context, false, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DreamsReferralView(
          eventData: eventData,
          referralIndex: referralIndex,
          isIncomingReferral: widget.isIncomingReferral,
        ),
      ),
    );
  }

  void onManageReferral(
    BuildContext context,
    Events eventData,
    int referralIndex,
  ) {
    FormUtil.updateServiceFormState(context, false, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DreamsReferralManage(
          eventData: eventData,
          referralIndex: referralIndex,
          isIncomingReferral: widget.isIncomingReferral,
        ),
      ),
    );
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
      body: SubPageBody(
        body: Consumer<DreamsBeneficiarySelectionState>(
          builder: (context, dreamAgywState, child) {
            return Consumer<InterventionBottomNavigationState>(
                builder: (context, interventionBottomNavigationState, child) {
              return Consumer<ReferralNotificationState>(
                builder: (context, referralNotificationState, child) {
                  return Consumer<ServiceEventDataState>(
                    builder: (context, serviceEventDataState, child) {
                      bool isLoading = serviceEventDataState.isLoading;
                      AgywDream? agywDream = dreamAgywState.currentAgywDream;
                      List<Events> events = AgywDreamsReferralUtil
                          .getAgywDreamBeneficiaryReferrals(
                        eventListByProgramStage:
                            serviceEventDataState.eventListByProgramStage,
                        incomingReferrals:
                            referralNotificationState.incomingReferrals ?? [],
                        programStageIds: programStageIds,
                        currentInterventionBottomNavigationId:
                            interventionBottomNavigationState
                                    .currentInterventionBottomNavigationId ??
                                '',
                      );
                      int referralIndex = events.length;
                      return Column(
                        children: [
                          DreamsBeneficiaryTopHeader(
                            agywDream: agywDream,
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
                                                'There is no Beneficiary Referrals at a moment')
                                            : Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 13.0,
                                                ),
                                                child: Column(
                                                  children: events
                                                      .map((Events eventData) {
                                                    int count = referralIndex--;
                                                    return Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                        bottom: 15.0,
                                                      ),
                                                      child:
                                                          ReferralCardSummary(
                                                        borderColor:
                                                            const Color(
                                                          0xFFE9F4FA,
                                                        ),
                                                        buttonLabelColor:
                                                            const Color(
                                                          0xFF1F8ECE,
                                                        ),
                                                        titleColor: const Color(
                                                          0xFF05131B,
                                                        ),
                                                        count: count,
                                                        cardBody:
                                                            ReferralCardBodySummary(
                                                          isIncomingReferral: widget
                                                              .isIncomingReferral,
                                                          labelColor:
                                                              const Color(
                                                            0XFF82898D,
                                                          ),
                                                          valueColor:
                                                              const Color(
                                                            0XFF444E54,
                                                          ),
                                                          referralEvent:
                                                              eventData,
                                                        ),
                                                        onView: () =>
                                                            onViewReferral(
                                                          context,
                                                          eventData,
                                                          count,
                                                        ),
                                                        onManage: () =>
                                                            onManageReferral(
                                                          context,
                                                          eventData,
                                                          count,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                      ),
                                      Visibility(
                                        visible: interventionBottomNavigationState
                                                .currentInterventionBottomNavigationId !=
                                            'incomingReferral',
                                        child: EntryFormSaveButton(
                                          label: 'ADD REFERRAL',
                                          labelColor: Colors.white,
                                          buttonColor: AgywDreamsCommonConstant
                                              .defaultColor,
                                          fontSize: 15.0,
                                          onPressButton: () => onAddReferral(
                                            context,
                                            agywDream!,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                          )
                        ],
                      );
                    },
                  );
                },
              );
            });
          },
        ),
      ),
      bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
    );
  }
}
