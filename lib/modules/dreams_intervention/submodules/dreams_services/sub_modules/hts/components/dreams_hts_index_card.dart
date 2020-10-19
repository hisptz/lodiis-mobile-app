import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/agyw_dreams_index_info_event.dart';
import 'package:provider/provider.dart';

import '../../../../../../../app_state/enrollment_service_form_state/service_form_state.dart';
import '../pages/agyw_dreams_index_information_about_pos_client.dart';
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


  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    AgywDreamsIndexInfoEvent eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.date);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.id);
      for (Map datavalue in eventData.datavalues) {
        if (datavalue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(datavalue['dataElement'], datavalue['value']);
        }
      }
    }
  }

  void onEditIndexInfo(BuildContext context, AgywDreamsIndexInfoEvent eventData) {
    updateFormState(context,true,eventData);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgywDreamsIndexInfoAboutPosClient()));
  }

  void onViewIndexInfo(BuildContext context, AgywDreamsIndexInfoEvent eventData) {
    updateFormState(context,false,eventData);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgywDreamsIndexInfoAboutPosClient()));
  }

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
                  onEdit: () => onEditIndexInfo(context,event),
                  onView: () => onViewIndexInfo(context,event),
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

