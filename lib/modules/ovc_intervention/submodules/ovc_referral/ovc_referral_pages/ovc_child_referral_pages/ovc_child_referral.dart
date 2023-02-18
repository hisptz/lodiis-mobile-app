import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/referrals_old/referral_card_summary.dart';
import 'package:kb_mobile_app/core/components/referrals_old/referral_card_body_summary.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/constants/ovc_routes_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/constants/ovc_child_referral_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/pages/ovc_child_referral_add_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/pages/ovc_child_referral_manage.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/pages/ovc_child_referral_view.dart';
import 'package:provider/provider.dart';

class OvcChildReferral extends StatefulWidget {
  const OvcChildReferral({
    Key? key,
    required this.isIncomingReferral,
  }) : super(key: key);

  final bool isIncomingReferral;

  @override
  State<OvcChildReferral> createState() => _OvcChildReferralState();
}

class _OvcChildReferralState extends State<OvcChildReferral> {
  final List<String> programStageIds = [OvcChildReferralConstant.referralStage];

  void onAddReferral(BuildContext context, OvcHouseholdChild? child) async {
    FormUtil.updateServiceFormState(context, true, null);
    String? beneficiaryId = child!.id;
    String eventId = '';
    String formAutoSaveId =
        '${OvcRoutesConstant.ovcReferralFormPage}_${beneficiaryId}_$eventId';

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
          builder: (context) => const OvcChildReferralAddForm(),
        ),
      );
    }
  }

  void onViewChildReferral(
    BuildContext context,
    Events eventData,
    int referralIndex,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcChildReferralView(
          eventData: eventData,
          referralIndex: referralIndex,
          isIncomingReferral: widget.isIncomingReferral,
        ),
      ),
    );
  }

  void onManageChildReferral(
    BuildContext context,
    Events eventData,
    int referralIndex,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcChildReferralManage(
          eventData: eventData,
          referralIndex: referralIndex,
          isIncomingReferral: widget.isIncomingReferral,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageTranslationState>(
      builder: (context, languageTranslationState, child) {
        String? currentLanguage = languageTranslationState.currentLanguage;
        return Consumer<OvcHouseholdCurrentSelectionState>(
          builder: (context, ovcHouseholdCurrentSelectionState, child) {
            return Consumer<ServiceEventDataState>(
              builder: (context, serviceEventDataState, child) {
                OvcHouseholdChild? currentOvcHouseholdChild =
                    ovcHouseholdCurrentSelectionState.currentOvcHouseholdChild;
                bool isLoading = serviceEventDataState.isLoading;
                Map<String?, List<Events>> eventListByProgramStage =
                    serviceEventDataState.eventListByProgramStage;
                List<Events> events = TrackedEntityInstanceUtil
                    .getAllEventListFromServiceDataStateByProgramStages(
                        eventListByProgramStage, programStageIds);
                int referralIndex = events.length;
                return Column(
                  children: [
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
                                      ? Text(
                                          currentLanguage == 'lesotho'
                                              ? 'Ha ho ngoana ea seng a referiloe'
                                              : 'There is no Child Referrals at a moment',
                                        )
                                      : Container(
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 5.0,
                                            horizontal: 13.0,
                                          ),
                                          child: Column(
                                            children:
                                                events.map((Events eventData) {
                                              int count = referralIndex--;
                                              return Container(
                                                margin: const EdgeInsets.only(
                                                  bottom: 15.0,
                                                ),
                                                child: ReferralCardSummary(
                                                  borderColor:
                                                      const Color(0xFFEDF5EC),
                                                  buttonLabelColor:
                                                      const Color(0xFF4B9F46),
                                                  titleColor:
                                                      const Color(0xFF1B3518),
                                                  count: count,
                                                  cardBody:
                                                      ReferralCardBodySummary(
                                                    isIncomingReferral: widget
                                                        .isIncomingReferral,
                                                    labelColor:
                                                        const Color(0XFF92A791),
                                                    valueColor:
                                                        const Color(0XFF536852),
                                                    referralEvent: eventData,
                                                  ),
                                                  onView: () =>
                                                      onViewChildReferral(
                                                    context,
                                                    eventData,
                                                    count,
                                                  ),
                                                  onManage: () =>
                                                      onManageChildReferral(
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
                                  visible: currentOvcHouseholdChild!
                                      .enrollmentOuAccessible!,
                                  child: EntryFormSaveButton(
                                    label: currentLanguage == 'lesotho'
                                        ? 'Kenya Referral'.toUpperCase()
                                        : 'ADD REFERRAL',
                                    labelColor: Colors.white,
                                    buttonColor: const Color(0xFF4B9F46),
                                    fontSize: 15.0,
                                    onPressButton: () => onAddReferral(
                                      context,
                                      currentOvcHouseholdChild,
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
      },
    );
  }
}
