import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/components/dreams_hts_tb_screening_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/constants/agyw_dreams_hts_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/constants/agyw_dreams_hts_tb_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/models/dreams_hts_tb_screening_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_tb_screening.dart';
import 'package:provider/provider.dart';

class HTSTBHomePage extends StatefulWidget {
  HTSTBHomePage(
      {Key key, @required this.htsToTBLinkageValue, this.hivResultStatus})
      : super(key: key);

  final String htsToTBLinkageValue;
  final String hivResultStatus;

  @override
  _HTSTBHomePageState createState() => _HTSTBHomePageState();
}

class _HTSTBHomePageState extends State<HTSTBHomePage> {
  final String label = 'TB Screening';
  final bool canExpand = true;
  final bool canEdit = true;
  final bool canView = true;

  List<String> programStageIds = [AgywDreamsHTSTBConstant.programStage];
  @override
  void initState() {
    super.initState();
  }

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    DreamsHTSTBScreeningEvent eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.date);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.id);
      Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
          AgywDreamsHTSLongFormConstant.hivResultStatus,
          widget.hivResultStatus ?? '');
      for (Map dataValue in eventData.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
  }

  void onViewTB(BuildContext context, DreamsHTSTBScreeningEvent eventData) {
    updateFormState(context, false, eventData);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamsHTSTBForm()));
  }

  void onEditTB(BuildContext context, DreamsHTSTBScreeningEvent eventData) {
    updateFormState(context, true, eventData);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgywDreamsHTSTBForm(
                htsToTBLinkageValue: eventData.htsTBLinkage)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(child: Consumer<ServiceEventDataState>(
        builder: (context, serviceFormState, child) {
          bool isLoading = serviceFormState.isLoading;
          Map<String, List<Events>> eventListByProgramStage =
              serviceFormState.eventListByProgramStage;
          List<Events> events = TrackedEntityInstanceUtil
              .getAllEventListFromServiceDataStateByProgramStages(
                  eventListByProgramStage, programStageIds);
          List<DreamsHTSTBScreeningEvent> tbEvents = events
              .map((Events eventData) =>
                  DreamsHTSTBScreeningEvent().fromTeiModel(eventData))
              .toList()
              .where((element) =>
                  element.htsTBLinkage == widget.htsToTBLinkageValue)
              .toList();
          DreamsHTSTBScreeningEvent tbEvent =
              tbEvents.length > 0 ? tbEvents[0] : null;
          return Container(
              child: isLoading
                  ? CircularProcessLoader(
                      color: Colors.blueGrey,
                    )
                  : Column(children: [
                      Container(
                          child: DreamsHTSTBScreeningCard(
                        onEditTB: () => onEditTB(context, tbEvent),
                        onViewTB: () => onViewTB(context, tbEvent),
                        tbEvents: tbEvent,
                      ))
                    ]));
        },
      )),
    );
  }
}
