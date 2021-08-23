import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:provider/provider.dart';

class ServicesHomeListContainer extends StatelessWidget {
  const ServicesHomeListContainer({
    Key? key,
    required this.programStageIds,
    this.onViewCasePlan,
  }) : super(key: key);

  final List<String> programStageIds;
  final Function? onViewCasePlan;

  @override
  Widget build(BuildContext context) {
    double iconHeight = 20;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Consumer<ServiceEventDataState>(
        builder: (context, serviceEventDataState, child) {
          Map<String?, List<Events>> eventListByProgramStage =
              serviceEventDataState.eventListByProgramStage;
          List<Events> events = TrackedEntityInstanceUtil
              .getAllEventListFromServiceDataStateByProgramStages(
                  eventListByProgramStage, programStageIds);
          Map groupedEventByDates =
              TrackedEntityInstanceUtil.getGroupedEventByDates(events);
          int assessmentIndex = groupedEventByDates.keys.toList().length;
          return assessmentIndex == 0
              ? Center(
                  child: Text('There is no case plan at moment'),
                )
              : Container(
                  child: Column(
                    children:
                        groupedEventByDates.keys.toList().map((assessmentDate) {
                      assessmentIndex--;
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 17.0,
                        ),
                        child: MaterialCard(
                          body: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              bottomLeft: Radius.circular(12.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                left: BorderSide(
                                  color: Color(0xFF4B9F46),
                                  width: 9.0,
                                ),
                              )),
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
                                              text: '$assessmentDate   ',
                                              style: TextStyle().copyWith(
                                                color: Color(0xFF92A791),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'Services followup(Case plan ${assessmentIndex + 1})',
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
                                            onTap: () => onViewCasePlan!(
                                                groupedEventByDates[
                                                    assessmentDate]),
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
