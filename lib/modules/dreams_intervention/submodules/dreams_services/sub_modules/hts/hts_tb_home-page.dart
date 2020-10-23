import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/components/dreams_hts_tb_screening_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/constants/agyw_dreams_hts_tb_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/models/tb_model_screening.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/pages/agyw_dreams_hts_tb_screening.dart';
import 'package:provider/provider.dart';

class HTSTBHomePage extends StatefulWidget {
  HTSTBHomePage({
    Key key,
    @required this.htsToTBLinkageValue,
  }) : super(key: key);

  final String htsToTBLinkageValue;

  @override
  _HTSTBHomePageState createState() => _HTSTBHomePageState();
}

class _HTSTBHomePageState extends State<HTSTBHomePage> {
  final String label = 'TB Screening';
  final bool canExpand = true;
  final bool canEdit = true;
  final bool canView = true;

  List<String> programStageids = [AgywDreamsHTSTBConstant.programStage];
  @override
  void initState() {
    super.initState();
  }

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    DreamsHTSTBEvent eventData,
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

  void onViewTB(BuildContext context, DreamsHTSTBEvent eventData) {
    updateFormState(context, false, eventData);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamsHTSTBForm()));
  }

  void onEditTB(BuildContext context, DreamsHTSTBEvent eventData) {
    updateFormState(context, true, eventData);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamsHTSTBForm()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(child: Consumer<ServiveEventDataState>(
        builder: (context, serviceFormState, child) {
          bool isLoading = serviceFormState.isLoading;
          Map<String, List<Events>> eventListByProgramStage =
              serviceFormState.eventListByProgramStage;
          List<Events> events =
              TrackedEntityInstanceUtil.getAllEventListFromServiceDataState(
                  eventListByProgramStage, programStageids);
          List<DreamsHTSTBEvent> tbEvents = events
              .map((Events eventData) =>
                  DreamsHTSTBEvent().fromTeiModel(eventData))
              .toList()
              .where((element) =>
                  element.htsTBLinkage == widget.htsToTBLinkageValue)
              .toList();
          DreamsHTSTBEvent tbEvent = tbEvents.length > 0 ? tbEvents[0] : null;
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
