import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_header.dart';

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

  void onEdit() {}

  void onView() {}

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
                  onView: onView,
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
