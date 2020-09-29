import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_house_hold_view_form.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldCard extends StatelessWidget {
  OvcHouseHoldCard({
    Key key,
    @required this.ovcHouseHold,
    @required this.canEdit,
    @required this.canView,
    @required this.canExpand,
    @required this.isExpanded,
    @required this.cardBody,
    @required this.cardBottonActions,
    @required this.cardBottonContent,
    this.onCardToogle,
  }) : super(key: key);

  final OvcHouseHold ovcHouseHold;
  final Widget cardBody;
  final Widget cardBottonActions;
  final Widget cardBottonContent;
  final bool canEdit;
  final bool canView;
  final bool canExpand;
  final bool isExpanded;

  final VoidCallback onCardToogle;
  final String svgIcon = 'assets/icons/hh_icon.svg';

  void updateEnrollmentFormStateData(
    BuildContext context,
  ) {
    TrackeEntityInstance teiData = ovcHouseHold.teiData;
    //@todo add other necessary info for edit

    // Provider.of<ServiceFormState>(context, listen: false)
    //     .setFormFieldState('eventDate', eventData.eventDate);
    // Provider.of<ServiceFormState>(context, listen: false)
    //     .setFormFieldState('eventId', eventData.event);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: false);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('location', ovcHouseHold.location);
    for (Map attributeObj in teiData.attributes) {
      if (attributeObj['value'] != '' && '${attributeObj['value']}' != 'null') {
        Provider.of<EnrollmentFormState>(context, listen: false)
            .setFormFieldState(
                attributeObj['attribute'], attributeObj['value']);
      }
    }
  }

  void onEdit() {}

  void onView(BuildContext context) {
    updateEnrollmentFormStateData(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OvcEnrollmentHouseHoldViewForm()));
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
                    child: OvcHouseHoldCardHeader(
                  ovcHouseHold: ovcHouseHold,
                  svgIcon: svgIcon,
                  canEdit: canEdit,
                  canExpand: canExpand,
                  canView: canView,
                  isExpanded: isExpanded,
                  onToggleCard: onCardToogle,
                  onEdit: onEdit,
                  onView: () => onView(context),
                )),
                cardBody,
                cardBottonActions,
                Visibility(visible: isExpanded, child: cardBottonContent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
