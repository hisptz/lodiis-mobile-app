// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
// import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
// import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
// import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
// import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
// import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
// import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
// import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
// import 'package:kb_mobile_app/core/components/sup_page_body.dart';
// import 'package:kb_mobile_app/core/utils/app_util.dart';
// import 'package:kb_mobile_app/models/form_section.dart';
// import 'package:kb_mobile_app/models/intervention_card.dart';
// import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
// import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/models/ovc_referral.dart';

// import 'package:provider/provider.dart';



// class _OvcServiceChildAddReferralFormState
//     extends StatelessWidget {
//   final String label = "Add Child Referral";
//   List<FormSection> formSections;
//   bool isFormReady = false;

//   @override
//   void initState() {
//     super.initState();
//     formSections = OvcAddReferral.getFormSections();
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
//     BuildContext context,
//     Map dataObject,
//   ) async {
//     if (dataObject.keys.length > 0) {
//       try {
//         //save the data into database
//         print(dataObject);
//         Timer(Duration(seconds: 1), () {
//           setState(() {
//             AppUtil.showToastMessage(
//                 message: 'Form has been saved successfully',
//                 position: ToastGravity.TOP);
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
//           body: Container(
//             child: Consumer<ServiceFormState>(
//               builder: (context, referralFormState, child) {
//                 return Container(
//                   child: !isFormReady
//                       ? Container(
//                           child: CircularProcessLoader(
//                             color: Colors.blueGrey,
//                           ),
//                         )
//                       : Column(
//                           children: [
//                             OvcChildInfoTopHeader(),
//                             Container(
//                               margin: EdgeInsets.only(
//                                 top: 10.0,
//                                 left: 13.0,
//                                 right: 13.0,
//                               ),
//                               child: EntryFormContainer(
//                                 formSections: formSections,
//                                 mandatoryFieldObject: Map(),
//                                 dataObject: referralFormState.formState,
//                                 onInputValueChange: onInputValueChange,
//                               ),
//                             ),
//                             OvcRefferralButton(
//                               onClickRefferral: () => onSaveForm(
//                                 context,
//                                 referralFormState.formState,
//                               ),
//                               buttonName: "Save",
//                             ),
//                           ],
//                         ),
//                 );
//               },
//             ),
//           ),
//         ),
//         bottomNavigationBar: InterventionBottomNavigationBarContainer());
//   }
// }
