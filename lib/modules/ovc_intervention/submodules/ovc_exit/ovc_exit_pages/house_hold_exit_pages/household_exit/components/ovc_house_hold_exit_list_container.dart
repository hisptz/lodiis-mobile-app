import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldExitListContainer extends StatelessWidget {
  OvcHouseHoldExitListContainer({
    Key key,
    @required this.programStageIds,
    this.onViewHouseHoldExit,
    this.onEditHouseHoldExit,
  }) : super(key: key);

  final List<String> programStageIds;
  final Function onViewHouseHoldExit;
  final Function onEditHouseHoldExit;

  @override
  Widget build(BuildContext context) {
    double iconHeight = 20;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Consumer<ServiveEventDataState>(
        builder: (context, serviveEventDataState, child) {
          Map<String, List<Events>> eventListByProgramStage =
              serviveEventDataState.eventListByProgramStage;
          List<Events> eventList =
              TrackedEntityInstanceUtil.getAllEventListFromServiceDataState(
                  eventListByProgramStage, programStageIds);
          int exitIndex = eventList.length;
          return exitIndex == 0
              ? Center(
                  child: Text('Call a widget to render the form'),
                )
              : Container(
                  child: Column(
                    children: eventList.map((Events exit) {
                      exitIndex--;
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 7.0,
                        ),
                        child: MaterialCard(
                          body: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              bottomLeft: Radius.circular(12.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Expanded(
                                          child: RichText(
                                            text: TextSpan(
                                              text:
                                                  '${exit.eventDate}   ',
                                              style: TextStyle().copyWith(
                                                color: Color(0xFF92A791),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'Exit ${exitIndex + 1}',
                                                  style: TextStyle().copyWith(
                                                    color: Color(0xFF1A3518),
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 5.0,
                                        ),
                                        child: InkWell(
                                            onTap: () =>
                                                onViewHouseHoldExit(
                                                   exit),
                                            child: Container(
                                              height: iconHeight,
                                              width: iconHeight,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                              child: SvgPicture.asset(
                                                'assets/icons/expand_icon.svg',
                                                color: Color(0xFF4B9F46),
                                              ),
                                            )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 5.0,
                                        ),
                                        child: InkWell(
                                            onTap: () =>
                                                onEditHouseHoldExit(
                                                   exit),
                                            child: Container(
                                              height: iconHeight,
                                              width: iconHeight,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                              child: SvgPicture.asset(
                                                'assets/icons/edit-icon.svg',
                                                color: Color(0xFF4B9F46),
                                              ),
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
        },
      ),
    );
  }
}
