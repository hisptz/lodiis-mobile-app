import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/referral_outcome_follow_up_event.dart';
import 'package:provider/provider.dart';

class ReferralOutComeFollowUp extends StatelessWidget {
  const ReferralOutComeFollowUp(
      {Key? key,
      required this.referralOutComeFollowUpEvents,
      required this.themeColor,
      required this.onEditFollowUp,
      this.isEditableMode = true})
      : super(key: key);

  final List<ReferralOutcomeFollowUpEvent> referralOutComeFollowUpEvents;
  final Color? themeColor;
  final isEditableMode;
  final Function onEditFollowUp;
  final double editIconHeight = 20;

  void editOutComeFollowUp(BuildContext context, Events? eventData) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: true);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.event);
      for (Map dataValue in eventData.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
    onEditFollowUp();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            referralOutComeFollowUpEvents.map((referralOutComeFollowUpEvent) {
          int index = referralOutComeFollowUpEvents
                  .indexOf(referralOutComeFollowUpEvent) +
              1;
          return Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Column(
              children: [
                Container(
                  child: LineSeparator(color: themeColor!.withOpacity(0.2)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'FOLLOW UP $index',
                          style: TextStyle().copyWith(
                            color: themeColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isEditableMode &&
                            referralOutComeFollowUpEvent
                                .enrollmentOuAccessible!,
                        child: InkWell(
                          onTap: () => {
                            editOutComeFollowUp(
                              context,
                              referralOutComeFollowUpEvent.eventData,
                            )
                          },
                          child: Container(
                            height: editIconHeight,
                            width: editIconHeight,
                            margin: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/edit-icon.svg',
                              color: themeColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: LineSeparator(
                    color: themeColor!.withOpacity(0.2),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 15.0,
                    top: 5.0,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Follow-up date',
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: themeColor!.withOpacity(0.8),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                referralOutComeFollowUpEvent.followUpDate!,
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: Color(0xFF1A3518),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Follow-up Status',
                              style: TextStyle().copyWith(
                                fontSize: 14.0,
                                color: themeColor!.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                              ),
                            ))
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              referralOutComeFollowUpEvent.followUpStatus!,
                              style: TextStyle().copyWith(
                                fontSize: 14.0,
                                color: Color(0xFF1A3518),
                                fontWeight: FontWeight.w500,
                              ),
                            ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Comments or next steps',
                              style: TextStyle().copyWith(
                                fontSize: 14.0,
                                color: themeColor!.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                              ),
                            ))
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              referralOutComeFollowUpEvent.comments!,
                              style: TextStyle().copyWith(
                                fontSize: 14.0,
                                color: Color(0xFF1A3518),
                                fontWeight: FontWeight.w500,
                              ),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
