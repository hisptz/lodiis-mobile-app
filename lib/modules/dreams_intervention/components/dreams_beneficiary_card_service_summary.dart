import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/service_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/service_form/constants/service_form_constant.dart';
import 'package:provider/provider.dart';

class DreamsBeneficiaryCardServiceSummary extends StatelessWidget {
  const DreamsBeneficiaryCardServiceSummary({
    Key? key,
    required this.services,
    required this.labelColor,
  }) : super(key: key);

  final List<List<Map>> services;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Consumer<ServiceEventDataState>(
        builder: (context, serviceEventDataState, child) {
          bool eventsLoading = serviceEventDataState.isLoading;
          Map<String?, List<Events>> serviceEvents =
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
              : Container(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Table(
                                children: (services).map((List serviceRow) {
                                  return TableRow(
                                    children: (serviceRow).map((service) {
                                      return TableCell(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                            bottom: 5.0,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 10.0,
                                                margin: EdgeInsets.only(
                                                  right: 5.0,
                                                ),
                                                child: Visibility(
                                                  visible:
                                                      service['name'] != '' &&
                                                          isServiceProvided(
                                                            service,
                                                            serviceEvents,
                                                          ),
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
                                    }).toList(),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }

  bool isServiceProvided(
      Map serviceProgramStage, Map<String?, List<Events>> serviceEvents) {
    List<String> serviceProgramStageIds = serviceProgramStage['programStage'];
    List<Events> events = getEventList(serviceEvents);
    List programStageIds =
        events.map((Events event) => event.programStage).toSet().toList();
    if (serviceProgramStageIds.contains(ServiceFormConstant.programStage) &&
        programStageIds.indexWhere((programStageId) =>
                serviceProgramStageIds.contains(programStageId)) !=
            -1) {
      List<ServiceEvent> serviceEvents = [];
      events.removeWhere((Events event) =>
          !serviceProgramStageIds.contains(event.programStage));
      events.forEach((event) {
        serviceEvents.add(ServiceEvent().getServiceSessions(event));
      });
      for (ServiceEvent element in serviceEvents) {
        if (element.interventionGroup == serviceProgramStage['name']) {
          return true;
        }
      }
      return false;
    } else if (programStageIds.indexWhere((programStageId) =>
            serviceProgramStageIds.contains(programStageId)) !=
        -1) {
      return true;
    } else {
      return false;
    }
  }

  List<Events> getEventList(Map<String?, List<Events>> serviceEvents) {
    List<List<Events>> sanitizedList = [];
    serviceEvents.forEach((key, value) {
      sanitizedList.add(value);
    });
    List<Events> eventList =
        sanitizedList.expand((element) => element).toList();
    return eventList;
  }
}
