import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/referrals/clo_referral_card_body_summary.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_card_summary.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/constants/ovc_child_clo_referral_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/pages/ovc_child_clo_referral_add_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/pages/ovc_child_referral_manage.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/pages/ovc_child_referral_view.dart';
import 'package:provider/provider.dart';

class OvcChildCLOReferral extends StatefulWidget {
  OvcChildCLOReferral({Key? key}) : super(key: key);
  @override
  _OvcChildCLOReferralState createState() => _OvcChildCLOReferralState();
}

class _OvcChildCLOReferralState extends State<OvcChildCLOReferral> {
  final String label = 'Child Referral';
  final List<String> programStageIds = [
    OvcChildCLOReferralConstant.referralCLOOutGoingStage,
    OvcChildCLOReferralConstant.referralCLOOutReceivedStage
  ];

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    Events? eventData,
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
        for (Map dataValue in eventData.dataValues) {
          if (dataValue['value'] != '') {
            Provider.of<ServiceFormState>(context, listen: false)
                .setFormFieldState(
                    dataValue['dataElement'], dataValue['value']);
          }
        }
      }
    }
  }

  void onAddReferral(BuildContext context, OvcHouseholdChild? child) {
    updateFormState(context, true, null);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcChildCLOReferralAddForm()));
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
                )));
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
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<OvcHouseholdCurrentSelectionState>(
        builder: (context, ovcHouseholdCurrentSelectionState, child) {
          return Consumer<ServiceEventDataState>(
            builder: (context, serviceFormState, child) {
              OvcHouseholdChild? currentOvcHouseholdChild =
                  ovcHouseholdCurrentSelectionState.currentOvcHouseholdChild;
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
                                          'There is no Child CLO Referrals at a moment')
                                      : Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: 5.0,
                                            horizontal: 13.0,
                                          ),
                                          child: Column(
                                            children:
                                                events.map((Events eventData) {
                                              int count = referralIndex--;
                                              return Container(
                                                margin: EdgeInsets.only(
                                                  bottom: 15.0,
                                                ),
                                                child: ReferralCardSummary(
                                                  isCLOReferral: true,
                                                  isOutgoingCLOReferral: eventData
                                                              .programStage ==
                                                          OvcChildCLOReferralConstant
                                                              .referralCLOOutGoingStage
                                                      ? true
                                                      : false,
                                                  borderColor:
                                                      Color(0xFFEDF5EC),
                                                  buttonLabelColor:
                                                      Color(0xFF4B9F46),
                                                  titleColor: Color(0xFF1B3518),
                                                  count: count,
                                                  cardBody:
                                                      CLOReferralCardBodySummary(
                                                    labelColor:
                                                        Color(0XFF92A791),
                                                    valueColor:
                                                        Color(0XFF536852),
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
                                EntryFormSaveButton(
                                    label: 'ADD CLO REFERRAL',
                                    labelColor: Colors.white,
                                    buttonColor: Color(0xFF4B9F46),
                                    fontSize: 15.0,
                                    onPressButton: () => onAddReferral(
                                        context, currentOvcHouseholdChild))
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
    );
  }
}
