import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_card_summary.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_card_body_summary.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_house_referral_pages/constants/ovc_household_referral_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_house_referral_pages/pages/ovc_household_referral_manage.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_house_referral_pages/pages/ovc_household_referral_view.dart';
import 'package:provider/provider.dart';
import 'pages/ovc_household_add_referral_form.dart';

class OvcHouseholdReferralHome extends StatefulWidget {
  OvcHouseholdReferralHome({
    Key? key,
    required this.isIncommingReferral,
  }) : super(key: key);

  final bool isIncommingReferral;

  @override
  _OvcHouseholdReferralHomeState createState() =>
      _OvcHouseholdReferralHomeState();
}

class _OvcHouseholdReferralHomeState extends State<OvcHouseholdReferralHome> {
  final String label = 'Household Referral';
  List<String> programStageIds = [OvcHouseholdReferralConstant.referralStage];

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

  void onAddReferral(BuildContext context, OvcHousehold? child) {
    updateFormState(context, true, null);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcHouseholdAddReferralForm()));
  }

  void onViewHouseholdReferral(
    BuildContext context,
    Events eventData,
    int referralIndex,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcHouseholdReferralView(
          eventData: eventData,
          referralIndex: referralIndex,
          isIncommingReferral: widget.isIncommingReferral,
        ),
      ),
    );
  }

  void onManageHouseholdReferral(
    BuildContext context,
    Events eventData,
    referralIndex,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcHouseholdReferralManage(
          eventData: eventData,
          referralIndex: referralIndex,
          isIncommingReferral: widget.isIncommingReferral,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
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
        body: Container(
          child: Consumer<LanguageTranslationState>(
            builder: (context, languageTranslationState, child) {
              String? currentLanguage =
                  languageTranslationState.currentLanguage;
              return Consumer<OvcHouseholdCurrentSelectionState>(
                builder: (context, ovcHouseholdCurrentSelectionState, child) {
                  return Consumer<ServiceEventDataState>(
                    builder: (context, serviceFormState, child) {
                      OvcHousehold? currentOvcHousehold =
                          ovcHouseholdCurrentSelectionState.currentOvcHousehold;
                      bool isLoading = serviceFormState.isLoading;
                      Map<String?, List<Events>> eventListByProgramStage =
                          serviceFormState.eventListByProgramStage;
                      List<Events> events = TrackedEntityInstanceUtil
                          .getAllEventListFromServiceDataStateByProgramStages(
                              eventListByProgramStage, programStageIds);
                      int referralIndex = events.length;
                      return Container(
                        child: Column(
                          children: [
                            OvcHouseholdInfoTopHeader(
                              currentOvcHousehold: currentOvcHousehold,
                            ),
                            Container(
                              child: isLoading
                                  ? CircularProcessLoader(
                                      color: Colors.blueGrey,
                                    )
                                  : Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: 10.0,
                                          ),
                                          child: events.length == 0
                                              ? Text(
                                                  currentLanguage == 'lesotho'
                                                      ? 'Ha hona lelapa le lereferioeng ha hajoale'
                                                      : 'There is no Household Referral at a moment',
                                                )
                                              : Container(
                                                  margin: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 13.0,
                                                  ),
                                                  child: Column(
                                                    children: events.map(
                                                        (Events eventData) {
                                                      int count =
                                                          referralIndex--;
                                                      return Container(
                                                        margin: EdgeInsets.only(
                                                          bottom: 15.0,
                                                        ),
                                                        child:
                                                            ReferralCardSummary(
                                                          borderColor:
                                                              Color(0xFFEDF5EC),
                                                          buttonLabelColor:
                                                              Color(0xFF4B9F46),
                                                          titleColor:
                                                              Color(0xFF1B3518),
                                                          count: count,
                                                          cardBody:
                                                              ReferralCardBodySummary(
                                                            isIncommingReferral:
                                                                false,
                                                            labelColor: Color(
                                                                0XFF92A791),
                                                            valueColor: Color(
                                                                0XFF536852),
                                                            referralEvent:
                                                                eventData,
                                                          ),
                                                          onView: () =>
                                                              onViewHouseholdReferral(
                                                            context,
                                                            eventData,
                                                            count,
                                                          ),
                                                          onManage: () =>
                                                              onManageHouseholdReferral(
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
                                        EntryFormSaveButton(
                                          label: currentLanguage == 'lesotho'
                                              ? 'Kenya Referral'.toUpperCase()
                                              : 'ADD REFERRAL',
                                          labelColor: Colors.white,
                                          buttonColor: Color(0xFF4B9F46),
                                          fontSize: 15.0,
                                          onPressButton: () => onAddReferral(
                                            context,
                                            currentOvcHousehold,
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: InterventionBottomNavigationBarContainer(),
    );
  }
}
