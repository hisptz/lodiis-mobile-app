import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_card_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_household_edit_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_household_view_form.dart';
import 'package:provider/provider.dart';

class OvcHouseholdCard extends StatelessWidget {
  OvcHouseholdCard({
    Key key,
    @required this.ovcHousehold,
    @required this.canEdit,
    @required this.canView,
    @required this.canExpand,
    @required this.isExpanded,
    @required this.cardBody,
    @required this.cardButtonActions,
    @required this.cardButtonContent,
    this.onCardToggle,
  }) : super(key: key);

  final OvcHousehold ovcHousehold;
  final Widget cardBody;
  final Widget cardButtonActions;
  final Widget cardButtonContent;
  final bool canEdit;
  final bool canView;
  final bool canExpand;
  final bool isExpanded;

  final VoidCallback onCardToggle;
  final String svgIcon = 'assets/icons/hh_icon.svg';

  void updateEnrollmentFormStateData(
    BuildContext context,
    bool isEditableMode,
  ) {
    TrackedEntityInstance teiData = ovcHousehold.teiData;
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Provider.of<EnrollmentFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    Provider.of<EnrollmentFormState>(context, listen: false).setFormFieldState(
        'location',
        isEditableMode ? ovcHousehold.orgUnit : ovcHousehold.location);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('trackedEntityInstance', ovcHousehold.id);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('orgUnit', ovcHousehold.orgUnit);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('enrollmentDate', ovcHousehold.createdDate);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('incidentDate', ovcHousehold.createdDate);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('yk0OH9p09C1', ovcHousehold.primaryUIC);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('PN92g65TkVI', ovcHousehold.houseHoldStatus);
    for (Map attributeObj in teiData.attributes) {
      if (attributeObj['value'] != '' && '${attributeObj['value']}' != 'null') {
        Provider.of<EnrollmentFormState>(context, listen: false)
            .setFormFieldState(
                attributeObj['attribute'], attributeObj['value']);
      }
    }
  }

  void onEditHousehold(BuildContext context) {
    updateEnrollmentFormStateData(context, true);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OvcEnrollmentHouseholdEditForm()));
  }

  void onViewHousehold(BuildContext context) {
    updateEnrollmentFormStateData(context, false);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OvcEnrollmentHouseholdViewForm()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0, right: 13.0, left: 13.0),
        child: MaterialCard(
          body: Container(
            child: Column(
              children: [
                Container(
                    child: OvcHouseholdCardHeader(
                  ovcHousehold: ovcHousehold,
                  svgIcon: svgIcon,
                  canEdit: canEdit,
                  canExpand: canExpand,
                  canView: canView,
                  isExpanded: isExpanded,
                  onToggleCard: onCardToggle,
                  onEdit: () => onEditHousehold(context),
                  onView: () => onViewHousehold(context),
                )),
                cardBody,
                cardButtonActions,
                Visibility(visible: isExpanded, child: cardButtonContent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}