// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
// import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
// import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
// import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
// import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
// import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
// import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
// import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
// import 'package:kb_mobile_app/core/components/sup_page_body.dart';
// import 'package:kb_mobile_app/core/utils/app_util.dart';
// import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
// import 'package:kb_mobile_app/models/agyw_dream.dart';
// import 'package:kb_mobile_app/models/form_section.dart';
// import 'package:kb_mobile_app/models/intervention_card.dart';
// import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
// import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/dreams_srh_client_intake.dart';
// import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
// import 'package:provider/provider.dart';

// import 'constant/srh_client_intake_constant.dart';

// class DreamSrhPage extends StatefulWidget {
//   DreamSrhPage({Key key}) : super(key: key);

//   @override
//   _DreamSrhPageState createState() => _DreamSrhPageState();
// }

// class _DreamSrhPageState extends State<DreamSrhPage> {
//   final String label = 'SRH Service';
//   List<FormSection> formSections;
//   bool isFormReady = false;
//   bool isSaving = false;

//   @override
//   void initState() {
//     super.initState();
//     formSections = DreamsSrhClientIntake.getFormSections();
//     Timer(Duration(seconds: 1), () {
//       setState(() {
//         isFormReady = true;
//       });
//     });
//   }

//   void onInputValueChange(String id, dynamic value) {
//     Provider.of<ServiceFormState>(context, listen: false)
//         .setFormFieldState(id, value);
//   }

//   void onSaveForm(
//       BuildContext context, Map dataObject, AgywDream agywDream) async {
//     if (dataObject.keys.length > 0) {
//       setState(() {
//         isSaving = true;
//       });
//       String eventDate = dataObject['eventDate'];
//       String eventId = dataObject['eventId'];
//       print(dataObject);
//       List<String> hiddenFields = [];
//       try {
//         await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
//             HivPrepClientIntakeConstant.program,
//             HivPrepClientIntakeConstant.programStage,
//             agywDream.orgUnit,
//             formSections,
//             dataObject,
//             eventDate,
//             agywDream.id,
//             eventId,
//             hiddenFields);
//         Provider.of<ServiveEventDataState>(context, listen: false)
//             .resetServiceEventDataState(agywDream.id);
//         Timer(Duration(seconds: 1), () {
//           setState(() {
//             AppUtil.showToastMessage(
//                 message: 'Form has been saved successfully',
//                 position: ToastGravity.TOP);
//             Navigator.pop(context);
//           });
//         });
//       } catch (e) {
//         Timer(Duration(seconds: 1), () {
//           setState(() {
//             AppUtil.showToastMessage(
//                 message: e.toString(), position: ToastGravity.BOTTOM);
//           });
//         });
//       }
//     } else {
//       AppUtil.showToastMessage(
//           message: 'Please fill at least one form field',
//           position: ToastGravity.TOP);
//       Navigator.pop(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(65.0),
//           child: Consumer<IntervetionCardState>(
//             builder: (context, intervetionCardState, child) {
//               InterventionCard activeInterventionProgram =
//                   intervetionCardState.currentIntervetionProgram;
//               return SubPageAppBar(
//                 label: label,
//                 activeInterventionProgram: activeInterventionProgram,
//               );
//             },
//           ),
//         ),
//         body: SubPageBody(
//           body: Container(child: Consumer<DreamBenefeciarySelectionState>(
//             builder: (context, nonAgywState, child) {
//               AgywDream agywDream = nonAgywState.currentAgywDream;
//               return Consumer<ServiceFormState>(
//                 builder: (context, serviceFormState, child) {
//                   return Container(
//                     child: Column(
//                       children: [
//                         DreamBenefeciaryTopHeader(
//                           agywDream: agywDream,
//                         ),
//                         !isFormReady
//                             ? Container(
//                                 child: CircularProcessLoader(
//                                   color: Colors.blueGrey,
//                                 ),
//                               )
//                             : Column(
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(
//                                       top: 10.0,
//                                       left: 13.0,
//                                       right: 13.0,
//                                     ),
//                                     child: EntryFormContainer(
//                                       formSections: formSections,
//                                       mandatoryFieldObject: Map(),
//                                       isEditableMode:
//                                           serviceFormState.isEditableMode,
//                                       dataObject: serviceFormState.formState,
//                                       onInputValueChange: onInputValueChange,
//                                     ),
//                                   ),
//                                   Visibility(
//                                     visible: serviceFormState.isEditableMode,
//                                     child: OvcEnrollmentFormSaveButton(
//                                       label: isSaving ? 'Saving ...' : 'Save',
//                                       labelColor: Colors.white,
//                                       buttonColor: Color(0xFF258DCC),
//                                       fontSize: 15.0,
//                                       onPressButton: () => onSaveForm(
//                                           context,
//                                           serviceFormState.formState,
//                                           agywDream),
//                                     ),
//                                   )
//                                 ],
//                               )
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//           )),
//         ),
//         bottomNavigationBar: InterventionBottomNavigationBarContainer());
//   }
// }


//  final String label = 'HIV Register';
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
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/prep_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/non_agyw/component/prep_visit_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:provider/provider.dart';

import 'constant/srh_client_intake_constant.dart';
import 'enrol_srh_page.dart';



class DreamSRHService extends StatefulWidget {
  DreamSRHService({Key key}) : super(key: key);

  @override
  _DreamSRHServiceState createState() => _DreamSRHServiceState();
}

class _DreamSRHServiceState extends State<DreamSRHService> {
  final String label = 'Prep-AGYW';
  List<String> programStageids = [ HivPrepClientIntakeConstant.program,HivPrepClientIntakeConstant.programStage];
  @override
  void initState() {
    super.initState();
    Provider.of<ServiveEventDataState>(context, listen: false)
        .resetServiceEventDataState(
            Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
                .currentAgywDream
                .id);
  }

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    Events eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.event);
      for (Map datavalue in eventData.dataValues) {
        if (datavalue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(datavalue['dataElement'], datavalue['value']);
        }
      }
    }
  }

  void onAddPrep(BuildContext context, AgywDream agywDream) {
    updateFormState(context, true, null);
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywDream);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DreamSrhPage()));
  }

  void onViewPrep(BuildContext context, Events eventdata) {
    updateFormState(context, false, eventdata);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DreamSrhPage()));
  }

  void onEditPrep(BuildContext context, Events eventdata) {
    updateFormState(context, true, eventdata);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DreamSrhPage()));
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
              builder: (context, dreamBenefeciarySelectionState, child) {
                return Consumer<ServiveEventDataState>(
                  builder: (context, serviceFormState, child) {
                    AgywDream agywDream =
                        dreamBenefeciarySelectionState.currentAgywDream;
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
                                                'There is no HIV Reg at a moment')
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
                                                      child:
                                                          NOnAgywPrepListCard(
                                                            visitName: "SRH Reg",
                                                        onEditPrep: () =>
                                                            onEditPrep(context,
                                                                eventData),
                                                        onViewPrep: () =>
                                                            onViewPrep(context,
                                                                eventData),
                                                        eventData: eventData,
                                                        visitCount:
                                                            referralIndex,
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                      ),
                                      OvcEnrollmentFormSaveButton(
                                          label: 'ADD SRH REG',
                                          labelColor: Colors.white,
                                          buttonColor: Color(0xFF1F8ECE),
                                          fontSize: 15.0,
                                          onPressButton: () =>
                                              onAddPrep(context, agywDream))
                                    ],
                                  ),
                          ),
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

