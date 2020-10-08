// import 'package:flutter/material.dart';
// import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
// import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
// import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
// import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
// import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
// import 'package:kb_mobile_app/models/agyw_dream.dart';
// import 'package:kb_mobile_app/models/ovc_house_hold.dart';
// import 'package:kb_mobile_app/modules/dreams_intervention/components/referal_card/r1.dart';
// import 'package:kb_mobile_app/modules/dreams_intervention/components/referal_card/r2.dart';
// import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card.dart';
// import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_body.dart';
// import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_botton_content.dart';
// import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_house_referral_pages/ovc_house_hold_referral_home.dart';
// import 'package:provider/provider.dart';

// class DreamAgywReferralPage extends StatefulWidget {
//   const DreamAgywReferralPage({Key key}) : super(key: key);

//   @override
//   _DreamAgywReferralPageState createState() => _DreamAgywReferralPageState();
// }

// class _DreamAgywReferralPageState extends State<DreamAgywReferralPage> {
//   final bool canEdit = false;
//   final bool canView = false;
//   final bool canExpand = true;
//   final bool canAddChild = false;
//   final bool canViewChildInfo = false;
//   final bool canEditChildInfo = false;
//   final bool canViewChildService = false;
//   final bool canViewChildReferral = true;
//   final bool canViewChildExit = false;

//   String toggleCardId = '';
//   bool isDreamAgyw = true;

//   void onCardToogle(String cardId) {
//     setState(() {
//       toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
//     });
//   }

//   void setOvcHouseHoldCurrentSelection(
//       BuildContext context, OvcHouseHold ovcHouseHold) {
//     Provider.of<OvcHouseHoldCurrentSelectionState>(context, listen: false)
//         .setCurrentHouseHold(ovcHouseHold);
//     Provider.of<ServiveEventDataState>(context, listen: false)
//         .resetServiceEventDataState(ovcHouseHold.id);
//   }

//   void onViewRerral(BuildContext context,  AgywDream agywDream) {

//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => OvcHouseHoldReferralHome()));

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffedf4ed),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Row(
//           children: [
//             SizedBox(
//               width: 23,
//             ),
//             Text(
//               'HOUSE HOLD LIST',
//               style: TextStyle(
//                   color: Colors.black45,
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Consumer<DreamsInterventionListState>(
//           builder: (context, dreamInterventionListState, child) {
//             bool isLoading = dreamInterventionListState.isLoading;
//             List<AgywDream> agywDream =
//                 dreamInterventionListState.agywDreamsInterventionList;
//             return isLoading
//                 ? Container(
//                     margin: EdgeInsets.only(top: 20.0),
//                     child: Center(
//                       child: CircularProcessLoader(color: Colors.blueGrey),
//                     ),
//                   )
//                 : Container(
//                     margin: EdgeInsets.only(top: 16.0),
//                     child: agywDream.length == 0
//                         ? Center(
//                             child: Text(
//                                 'There is no household enrolled at moment'))
//                         : Column(
//                             children: agywDream
//                                 .map(
//                                   (AgywDream agywDream) => DreamAgywCard(
//                                     agywDream: agywDream,
//                                     canEdit: canEdit,
//                                     canExpand: canExpand,
//                                     canView: canView,

//                                     isExpanded: agywDream.id == toggleCardId,
//                                     onCardToogle: () {
//                                       onCardToogle(agywDream.id);
//                                     },
//                                     cardBody: Container(),
//                                     cardBottonActions: ClipRRect(
//                                       borderRadius: agywDream.id ==
//                                               toggleCardId
//                                           ? BorderRadius.zero
//                                           : BorderRadius.only(
//                                               bottomLeft: Radius.circular(12.0),
//                                               bottomRight:
//                                                   Radius.circular(12.0),
//                                             ),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             color: Color(0XFFF6FAF6)),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Container(
//                                               child: FlatButton(
//                                                   onPressed: () => onViewRerral(
//                                                       context, agywDream),
//                                                   child: Text(
//                                                     'REFERRAL',
//                                                     style: TextStyle().copyWith(
//                                                       fontSize: 12.0,
//                                                       color: Color(0xFF4B9F46),
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                     ),
//                                                   )),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ), cardBottonContent: Container(),

//                                   ),
//                                 )
//                                 .toList(),
//                           ));
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/components/ovc_referral_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/components/ovc_referral_card_body.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/constants/ovc_child_referral_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/pages/ovc_child_referral_add_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/pages/ovc_child_referral_manage.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/pages/ovc_child_referral_view.dart';
import 'package:provider/provider.dart';
import 'constant/dream_agyw_referral_constant.dart';

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
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcChildReferralAddForm()));
  }

  void onViewChildReferral(BuildContext context, Events eventData) {
    updateFormState(context, false, eventData);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcChildReferralView()));
  }

  void onManageChildReferral(BuildContext context, Events eventData) {
    updateFormState(context, false, eventData);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcChildReferralManage()));
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
                    AgywDream currentAgyDream = dreamAgywState.currentAgywDream;
                    bool isLoading = serviceFormState.isLoading;
                    Map<String, List<Events>> eventListByProgramStage =
                        serviceFormState.eventListByProgramStage;
                    List<Events> events = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataState(
                            eventListByProgramStage, programStageids);
                    int referralIndex = events.length + 1;
                    return Container(
                      child: Column(
                        children: [
                          OvcChildInfoTopHeader(),
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
                                                'There is no Child Referrals at a moment')
                                            : Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 13.0,
                                                ),
                                                child: Column(
                                                  children: events
                                                      .map((Events eventData) {
                                                    referralIndex--;
                                                    return Container(
                                                      margin: EdgeInsets.only(
                                                        bottom: 15.0,
                                                      ),
                                                      child: OvcReferralCard(
                                                        count: referralIndex,
                                                        cardBody:
                                                            OvcReferralCardBody(
                                                          referralEvent:
                                                              eventData,
                                                        ),
                                                        onView: () =>
                                                            onViewChildReferral(
                                                                context,
                                                                eventData),
                                                        onManage: () =>
                                                            onManageChildReferral(
                                                                context,
                                                                eventData),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                      ),
                                      OvcEnrollmentFormSaveButton(
                                          label: 'ADD REFFERAL',
                                          labelColor: Colors.white,
                                          buttonColor: Color(0xFF4B9F46),
                                          fontSize: 15.0,
                                          onPressButton: () => onAddRefferal(
                                              context, currentAgyDream))
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
