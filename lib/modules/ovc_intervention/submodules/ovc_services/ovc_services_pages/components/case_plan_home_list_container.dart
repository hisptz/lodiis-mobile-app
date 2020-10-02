import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:provider/provider.dart';

class CasePlanHomeListContainer extends StatelessWidget {
  const CasePlanHomeListContainer({
    Key key,
    @required this.programStageIds,
  }) : super(key: key);

  final List<String> programStageIds;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Consumer<ServiveEventDataState>(
        builder: (context, serviveEventDataState, child) {
          Map<String, List<Events>> eventListByProgramStage =
              serviveEventDataState.eventListByProgramStage;
          List<Events> events =
              TrackedEntityInstanceUtil.getAllEventListFromServiceDataState(
                  eventListByProgramStage, programStageIds);
          Map groupedEventByDates =
              TrackedEntityInstanceUtil.getGroupedEventByDates(events);
          return Container(
            child: Text('Listing ${events.length}'),
          );
        },
      ),
    );
  }
}
