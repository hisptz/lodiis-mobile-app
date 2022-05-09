import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:provider/provider.dart';

class CasePlanHomeListContainer extends StatelessWidget {
  const CasePlanHomeListContainer({
    Key? key,
    required this.programStageIds,
    this.onEditCasePlan,
    this.onViewCasePlan,
  }) : super(key: key);

  final List<String> programStageIds;
  final Function? onViewCasePlan;
  final Function? onEditCasePlan;

  @override
  Widget build(BuildContext context) {
    double iconHeight = 20;
    return Container(
      margin: const EdgeInsets.symmetric(
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
              ? const Center(
                  child: Text('There is no case plan at moment'),
                )
              : Column(
                  children:
                      groupedEventByDates.keys.toList().map((assessmentDate) {
                    assessmentIndex--;
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 17.0,
                      ),
                      child: MaterialCard(
                        body: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Color(0xFF4B9F46),
                                  width: 9.0,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          text: '$assessmentDate   ',
                                          style: const TextStyle().copyWith(
                                            color: const Color(0xFF92A791),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Case plan ${assessmentIndex + 1}',
                                              style: const TextStyle().copyWith(
                                                color: const Color(0xFF1A3518),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0,
                                      ),
                                      child: InkWell(
                                        onTap: () => onViewCasePlan!(
                                            groupedEventByDates[
                                                assessmentDate]),
                                        child: Container(
                                          height: iconHeight,
                                          width: iconHeight,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          child: SvgPicture.asset(
                                            'assets/icons/expand_icon.svg',
                                            color: const Color(0xFF4B9F46),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: AppUtil
                                          .hasAccessToEditCasePlanServiceData(
                                        groupedEventByDates[assessmentDate],
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0,
                                        ),
                                        child: InkWell(
                                          onTap: () => onEditCasePlan!(
                                              groupedEventByDates[
                                                  assessmentDate]),
                                          child: Container(
                                            height: iconHeight,
                                            width: iconHeight,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 5),
                                            child: SvgPicture.asset(
                                              'assets/icons/edit-icon.svg',
                                              color: const Color(0xFF4B9F46),
                                            ),
                                          ),
                                        ),
                                      ),
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
                );
        },
      ),
    );
  }
}
