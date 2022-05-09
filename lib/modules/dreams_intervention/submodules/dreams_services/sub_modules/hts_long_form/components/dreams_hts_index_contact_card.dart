import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/agyw_dreams_index_info_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/components/dreams_hts_index_contact_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/components/dreams_hts_index_contact_card_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/models/index_contact.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_index_information_about_pos_client.dart';
import 'package:provider/provider.dart';

class DreamsHTSIndexContactCard extends StatelessWidget {
  const DreamsHTSIndexContactCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  final IndexContact? event;
  final String svgIcon = 'assets/icons/hh_icon.svg';

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    AgywDreamsIndexInfoEvent eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('eventDate', eventData.date);
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('eventId', eventData.id);
    for (Map dataValue in eventData.dataValues) {
      if (dataValue['value'] != '') {
        Provider.of<ServiceFormState>(context, listen: false)
            .setFormFieldState(dataValue['dataElement'], dataValue['value']);
      }
    }
  }

  void onEditIndexInfo(
      BuildContext context, AgywDreamsIndexInfoEvent eventData) {
    updateFormState(context, true, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsIndexInfoAboutPosClient(),
      ),
    );
  }

  void onViewIndexInfo(
      BuildContext context, AgywDreamsIndexInfoEvent eventData) {
    updateFormState(context, false, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsIndexInfoAboutPosClient(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: MaterialCard(
        body: Column(
          children: [
            DreamsHTSIndexContactCardHeader(
              event: event,
            ),
            DreamsHTSIndexContactCardBody(
              event: event,
            )
          ],
        ),
      ),
    );
  }
}
