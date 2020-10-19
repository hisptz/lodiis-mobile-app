import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:provider/provider.dart';

class CasePlanFollowUpViewContainer extends StatelessWidget {
  const CasePlanFollowUpViewContainer({
    Key key,
    @required this.casePlanGapToFollowinUpLinkageValue,
    @required this.shouldEditCaseGapFollowUps,
  }) : super(key: key);

  final String casePlanGapToFollowinUpLinkageValue;
  final bool shouldEditCaseGapFollowUps;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ServiveEventDataState>(
        builder: (context, serviveEventDataState, child) {
          bool isLoading = serviveEventDataState.isLoading;
          Map<String, List<Events>> eventListByProgramStage =
              serviveEventDataState.eventListByProgramStage;
          return Container(
            child: isLoading
                ? Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: CircularProcessLoader(
                      color: Colors.blueGrey,
                    ),
                  )
                : Container(child: Text('List of following ups')),
          );
        },
      ),
    );
  }
}
