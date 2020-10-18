import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/events.dart';

import 'dreams_hts_index_card_header.dart';

class DreamsHTSIndexCard extends StatelessWidget {
  const DreamsHTSIndexCard({
    Key key,
    @required this.eventData,
    @required this.indexStageId,
    @required this.cardBody,
    @required this.cardBottonActions,
    @required this.cardBottonContent,
    @required this.canExpand,
    @required this.canEdit,
    @required this.canView,
    @required this.isExpanded,
    this.onCardToogle,
  }) : super(key: key);

  final Events eventData;
  final Widget cardBody;
  final Widget cardBottonActions;
  final Widget cardBottonContent;
  final bool canExpand;
  final bool isExpanded;
  final bool canEdit;
  final bool canView;
  final String indexStageId;

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
                  indexStageId: indexStageId,
                  eventData: eventData,
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

