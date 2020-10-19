import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/agyw_dreams_index_info_event.dart';

import 'dreams_hts_index_card_header.dart';

class DreamsHTSIndexCard extends StatelessWidget {
  const DreamsHTSIndexCard({
    Key key,
    @required this.event,
    @required this.cardBody,
    @required this.cardBottonActions,
    @required this.cardBottonContent,
    @required this.canExpand,
    @required this.canEdit,
    @required this.canView,
    @required this.isExpanded,
    this.onCardToogle,
  }) : super(key: key);

  final AgywDreamsIndexInfoEvent event;
  final Widget cardBody;
  final Widget cardBottonActions;
  final Widget cardBottonContent;
  final bool canExpand;
  final bool isExpanded;
  final bool canEdit;
  final bool canView;

  final VoidCallback onCardToogle;
  final String svgIcon = 'assets/icons/hh_icon.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: MaterialCard(
          body: Container(
            child: Column(
              children: [
                Container(
                  child: DreamsHTSIndexCardHeader(
                  event: event,
                  canEdit: canEdit,
                  canView: canView,
                  svgIcon: svgIcon,
                  canExpand: canExpand,
                  isExpanded: isExpanded,
                  onToggleCard: onCardToogle,
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

