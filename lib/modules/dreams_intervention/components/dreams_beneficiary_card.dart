// import 'package:flutter/material.dart';
// import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
// import 'package:kb_mobile_app/core/components/material_card.dart';
// import 'package:kb_mobile_app/models/agyw_dream.dart';
// import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
// import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_card_header.dart';
// import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/dream_enrollment_page_view_form.dart';
// import 'package:provider/provider.dart';

// class DreamsBeneficiaryCard extends StatelessWidget {
//   const DreamsBeneficiaryCard({
//     Key key,
//     @required this.canEdit,
//     @required this.canView,
//     @required this.canExpand,
//     @required this.isExpanded,
//     @required this.beneficiaryName,
//     @required this.cardBody,
//     @required this.cardBottonActions,
//     @required this.cardBottonContent,
//     @required this.agywDream,
//     this.onCardToogle,
//   }) : super(key: key);

//   final Widget cardBody;
//   final Widget cardBottonActions;
//   final Widget cardBottonContent;
//   final bool canEdit;
//   final bool canView;
//   final bool canExpand;
//   final bool isExpanded;
//   final String beneficiaryName;
//   final AgywDream agywDream;

//   final VoidCallback onCardToogle;

//   final String svgIcon = 'assets/icons/dreams-header-icon.svg';

//   void onEdit() {}

//   void updateEnrollmentFormStateData(
//     BuildContext context,
//     bool isEditableMode,
//   ) {
//     for (var d in agywDream.trackeEntityInstanceData.attributes) {
//       if (d['attribute'] == 'yk0OH9p09C1') {
//         print(d);
//       }
//     }
//     TrackeEntityInstance teiData = agywDream.trackeEntityInstanceData;
//     Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
//     //@todo add other necessary info for edit
//     Provider.of<EnrollmentFormState>(context, listen: false)
//         .updateFormEditabilityState(isEditableMode: isEditableMode);
//     Provider.of<EnrollmentFormState>(context, listen: false).setFormFieldState(
//         'location',
//         isEditableMode ? agywDream.orgUnit : agywDream.location);
//     Provider.of<EnrollmentFormState>(context, listen: false)
//         .setFormFieldState('trackedEntityInstance', agywDream.benefecaryId);
//     Provider.of<EnrollmentFormState>(context, listen: false)
//         .setFormFieldState('orgUnit', agywDream.orgUnit);
//     Provider.of<EnrollmentFormState>(context, listen: false)
//         .setFormFieldState('enrollment', agywDream.enrollment);
//     Provider.of<EnrollmentFormState>(context, listen: false)
//         .setFormFieldState('enrollmentDate', agywDream.createdDate);
//     Provider.of<EnrollmentFormState>(context, listen: false)
//         .setFormFieldState('incidentDate', agywDream.createdDate);
//     Provider.of<EnrollmentFormState>(context, listen: false)
//         .setFormFieldState('yk0OH9p09C1', agywDream.benefecaryId);
//     Provider.of<EnrollmentFormState>(context, listen: false)
//         .setFormFieldState('PN92g65TkVI', agywDream.programStatus);
//     for (Map attributeObj in teiData.attributes) {
//       if (attributeObj['value'] != '' && '${attributeObj['value']}' != 'null') {
//         Provider.of<EnrollmentFormState>(context, listen: false)
//             .setFormFieldState(
//                 attributeObj['attribute'], attributeObj['value']);
//       }
//     }
//   }

//   void onView(BuildContext context) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => DreamAgywEnrollmentViewForm(),
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16.0, right: 13.0, left: 13.0),
//       child: MaterialCard(
//         body: Container(
//           child: Column(
//             children: [
//               DreamBeneficiaryCardHeader(
//                 svgIcon: svgIcon,
//                 beneficiaryName: beneficiaryName,
//                 canEdit: canEdit,
//                 canExpand: canExpand,
//                 canView: canView,
//                 isExpanded: isExpanded,
//                 onToggleCard: onCardToogle,
//                 onEdit: onEdit,
//                 onView: () => onView(context),
//               ),
//               cardBody,
//               cardBottonActions,
//               Visibility(
//                   visible: isExpanded,
//                   child: Row(
//                     children: [cardBottonContent],
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_card_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/dream_enrollment_page_view_form.dart';
import 'package:provider/provider.dart';

class DreamsBeneficiaryCard extends StatelessWidget {
  const DreamsBeneficiaryCard({
    Key key,
    @required this.canEdit,
    @required this.canView,
    @required this.canExpand,
    @required this.isExpanded,
    @required this.beneficiaryName,
    @required this.cardBody,
    @required this.cardBottonActions,
    @required this.cardBottonContent,
    @required this.agywDream,
    @required this.routeWidget,
    this.onCardToogle,
  }) : super(key: key);

  final Widget cardBody;
  final Widget cardBottonActions;
  final Widget cardBottonContent;
  final bool canEdit;
  final bool canView;
  final bool canExpand;
  final bool isExpanded;
  final String beneficiaryName;
  final AgywDream agywDream;
  final Widget routeWidget;

  final VoidCallback onCardToogle;

  final String svgIcon = 'assets/icons/dreams-header-icon.svg';

  void onEdit() {}
  void updateEnrollmentFormStateData(
    BuildContext context,
  ) {
    TrackeEntityInstance teiData = agywDream.trackeEntityInstanceData;

    for (Map attributeObj in teiData.attributes) {
      if (attributeObj['value'] != '' && '${attributeObj['value']}' != 'null') {
        Provider.of<EnrollmentFormState>(context, listen: false)
            .setFormFieldState(
                attributeObj['attribute'], attributeObj['value']);
      }
    }
  }

  void onView(BuildContext context) {
    updateEnrollmentFormStateData(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => routeWidget,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0, right: 13.0, left: 13.0),
      child: MaterialCard(
        body: Container(
          child: Column(
            children: [
              DreamBeneficiaryCardHeader(
                svgIcon: svgIcon,
                beneficiaryName: beneficiaryName,
                canEdit: canEdit,
                canExpand: canExpand,
                canView: canView,
                isExpanded: isExpanded,
                onToggleCard: onCardToogle,
                onEdit: onEdit,
                onView: () => onView(context),
              ),
              cardBody,
              cardBottonActions,
              Visibility(
                  visible: isExpanded,
                  child: Row(
                    children: [cardBottonContent],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
