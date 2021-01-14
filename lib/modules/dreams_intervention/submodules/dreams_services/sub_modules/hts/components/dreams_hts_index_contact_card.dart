import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/agyw_dreams_index_info_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/components/dreams_hts_index_contact_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/components/dreams_hts_index_contact_card_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/models/index_contact_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../../app_state/enrollment_service_form_state/service_form_state.dart';
import '../pages/agyw_dreams_index_information_about_pos_client.dart';
import 'dreams_hts_index_card_header.dart';

class DreamsHTSIndexContactCard extends StatelessWidget {
  const DreamsHTSIndexContactCard({
    Key key,
    @required this.event,
  }) : super(key: key);

  final IndexContactModel event;
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

  void onEditIndexInfo(
      BuildContext context, AgywDreamsIndexInfoEvent eventData) {
    updateFormState(context, true, eventData);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgywDreamsIndexInfoAboutPosClient()));
  }

  void onViewIndexInfo(
      BuildContext context, AgywDreamsIndexInfoEvent eventData) {
    updateFormState(context, false, eventData);
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
                    child: DreamsHTSIndexContactCardHeader(
                  event: event,
                )),
                DreamsHTSIndexContactCardBody(
                  event: event,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
