import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_card_body_summary.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_card_summary.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/constant/dream_agyw_referral_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/pages/dream_agyw_referral_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/pages/dream_referral_manage.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/pages/dream_referral_view.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class DreamAgywReferralPage extends StatefulWidget {
  DreamAgywReferralPage({Key key}) : super(key: key);
  @override
  _DreamAgywReferralPageState createState() => _DreamAgywReferralPageState();
}

class _DreamAgywReferralPageState extends State<DreamAgywReferralPage> {
  final String label = 'Agyw Referral';
  final List<String> programStageids = [DreamAgywReferralConstant.programStage];
  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    Events eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      if (eventData != null) {
        Provider.of<ServiceFormState>(context, listen: false)
            .setFormFieldState('eventDate', eventData.eventDate);
        Provider.of<ServiceFormState>(context, listen: false)
            .setFormFieldState('eventId', eventData.event);
        for (Map datavalue in eventData.dataValues) {
          if (datavalue['value'] != '') {
            Provider.of<ServiceFormState>(context, listen: false)
                .setFormFieldState(
                    datavalue['dataElement'], datavalue['value']);
          }
        }
      }
    }
  }

  void onAddRefferal(BuildContext context, AgywDream agywDream) {
    updateFormState(context, true, null);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DreamAgywAddReferralForm(),
      ),
    );
  }

  void onViewChildReferral(
    BuildContext context,
    Events eventData,
    int referralIndex,
  ) {
    updateFormState(context, false, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DreamReferralView(
          eventData: eventData,
          referralIndex: referralIndex,
        ),
      ),
    );
  }

  void onManageChildReferral(
    BuildContext context,
    Events eventData,
    int referralIndex,
  ) {
    updateFormState(context, false, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DreamReferralManage(
          eventData: eventData,
          referralIndex: referralIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<IntervetionCardState>(
            builder: (context, intervetionCardState, child) {
              InterventionCard activeInterventionProgram =
                  intervetionCardState.currentIntervetionProgram;
              return SubPageAppBar(
                label: label,
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SubPageBody(
          body: Container(
            child: Consumer<DreamBenefeciarySelectionState>(
              builder: (context, dreamAgywState, child) {
                return Consumer<ServiveEventDataState>(
                  builder: (context, serviceFormState, child) {
                    AgywDream agywDream = dreamAgywState.currentAgywDream;
                    bool isLoading = serviceFormState.isLoading;
                    Map<String, List<Events>> eventListByProgramStage =
                        serviceFormState.eventListByProgramStage;
                    List<Events> events = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataStateByProgramStages(
                            eventListByProgramStage, programStageids);
                    int referralIndex = events.length;
                    return Container(
                      child: Column(
                        children: [
                          DreamBenefeciaryTopHeader(
                            agywDream: agywDream,
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
                                                'There is no Benefeciary Referrals at a moment')
                                            : Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 13.0,
                                                ),
                                                child: Column(
                                                  children: events
                                                      .map((Events eventData) {
                                                    int count = referralIndex--;
                                                    return Container(
                                                      margin: EdgeInsets.only(
                                                        bottom: 15.0,
                                                      ),
                                                      child:
                                                          ReferralCardSummary(
                                                        borderColor:
                                                            Color(0xFFE9F4FA),
                                                        buttonLabelColor:
                                                            Color(0xFF1F8ECE),
                                                        titleColor:
                                                            Color(0xFF05131B),
                                                        count: count,
                                                        cardBody:
                                                            ReferralCardBodySummary(
                                                          labelColor:
                                                              Color(0XFF82898D),
                                                          valueColor:
                                                              Color(0XFF444E54),
                                                          referralEvent:
                                                              eventData,
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
                                      EntryFormSaveButton(
                                          label: 'ADD REFERRAL',
                                          labelColor: Colors.white,
                                          buttonColor: Color(0xFF1F8ECE),
                                          fontSize: 15.0,
                                          onPressButton: () =>
                                              onAddRefferal(context, agywDream))
                                    ],
                                  ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
