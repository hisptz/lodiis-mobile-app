import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/service_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/service_form/constants/service_form_constant.dart';
import 'package:provider/provider.dart';

class DreamBeneficiaryCardServiceSummary extends StatelessWidget {
  const DreamBeneficiaryCardServiceSummary(
      {Key key, @required this.services, @required this.labelColor})
      : super(key: key);

  final List<List<Map>> services;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Consumer<ServiveEventDataState>(
          builder: (context, serviceEventDataState, child) {
            bool eventsLoading = serviceEventDataState.isLoading;
            Map<String, List<Events>> serviceEvents =
                serviceEventDataState.eventListByProgramStage;
            return eventsLoading
                ? Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: CircularProcessLoader(
                        color: Colors.blueGrey,
                      ),
                    ),
                  )
                : Row(children: [
                    Expanded(
                        child: Table(
                      children: (services ?? []).map((List serviceRow) {
                        return TableRow(
                            children: (serviceRow ?? []).map((service) {
                          return TableCell(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    margin: EdgeInsets.only(right: 5),
                                    child: Visibility(
                                      visible: service['name'] != '' &&
                                          isServiceProvided(
                                              service, serviceEvents),
                                      child: SvgPicture.asset(
                                        'assets/icons/tick-icon.svg',
                                        color: labelColor,
                                        height: 10,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${service['name']} ',
                                      style: TextStyle().copyWith(
                                        color: labelColor,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList());
                      }).toList(),
                    )),
                  ]);
          },
        ));
  }

  bool isServiceProvided(
      Map serviceProgramStage, Map<String, List<Events>> serviceEvents) {
    List<Events> events = getEventList(serviceEvents);
    List<String> programStageIds =
        events.map((Events event) => event.programStage).toSet().toList();
    if (serviceProgramStage['programStage'] ==
            ServiceFormConstant.programStage &&
        programStageIds.indexOf(serviceProgramStage['programStage']) != -1) {
      List<ServiceEvents> serviceEvents = [];
      events.removeWhere((Events event) =>
          event.programStage != serviceProgramStage['programStage'] ?? '');
      events.forEach((event) {
        serviceEvents.add(ServiceEvents().getServiceSessions(event));
      });
      for (ServiceEvents element in serviceEvents) {
        if (element.interventionGroup == serviceProgramStage['name']) {
          return true;
        }
      }
      return false;
    } else if (programStageIds.indexOf(serviceProgramStage['programStage']) !=
        -1) {
      return true;
    } else {
      return false;
    }
  }

  List<Events> getEventList(Map<String, List<Events>> serviceEvents) {
    List<List<Events>> sanitizedList = [];
    serviceEvents.forEach((key, value) {
      sanitizedList.add(value);
    });
    List<Events> eventList =
        sanitizedList.expand((element) => element).toList();
    return eventList;
  }
}
