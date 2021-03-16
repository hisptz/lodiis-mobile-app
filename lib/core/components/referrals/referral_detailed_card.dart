import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/referral_event.dart';
import 'package:kb_mobile_app/models/referral_outcome_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/pages/dream_agyw_referral_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/pages/ovc_child_referral_add_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_house_referral_pages/pages/ovc_house_hold_add_referral_form.dart';
import 'package:provider/provider.dart';

class ReferralDetailedCard extends StatefulWidget {
  const ReferralDetailedCard({
    Key key,
    @required this.eventData,
    @required this.referralIndex,
    @required this.borderColor,
    @required this.titleColor,
    @required this.labelColor,
    @required this.valueColor,
    this.isOvcIntervention = true,
    this.isHouseHoldReferral = false,
    this.isEditable = false,
  }) : super(key: key);

  final Events eventData;
  final int referralIndex;
  final Color borderColor;
  final Color titleColor;
  final Color valueColor;
  final Color labelColor;
  final bool isOvcIntervention;
  final bool isHouseHoldReferral;
  final bool isEditable;

  @override
  _ReferralDetailedCardState createState() => _ReferralDetailedCardState();
}

class _ReferralDetailedCardState extends State<ReferralDetailedCard> {
  ReferralEvent ovcReferralCard;
  double editIconHeight = 20;
  ReferralOutComeEvent referralOutComeEvent;
  Color buttonLabelColor;

  @override
  void initState() {
    super.initState();
    buttonLabelColor =
        widget.isOvcIntervention ? Color(0xFF4B9F46) : Color(0xFF1F8ECE);
    setState(() {});
  }

  void onUpdateEventData(Events eventData) {
    ovcReferralCard = ReferralEvent().fromTeiModel(eventData);
    referralOutComeEvent = ReferralOutComeEvent().fromTeiModel(eventData, "");
  }

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    Events eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.event);
      for (Map datavalue in eventData.dataValues) {
        if (datavalue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(datavalue['dataElement'], datavalue['value']);
        }
      }
    }
  }

  onEditRefferral(BuildContext context) {
    updateFormState(context, true, widget.eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget.isOvcIntervention
            ? widget.isHouseHoldReferral
                ? OvcHouseHoldAddReferralForm()
                : OvcChildReferralAddForm()
            : DreamAgywAddReferralForm(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String currentLanguage = languageTranslationState.currentLanguage;
          return Consumer<ServiveEventDataState>(
            builder: (context, serviceFormState, child) {
              Map<String, List<Events>> eventListByProgramStage =
                  serviceFormState.eventListByProgramStage;
              List<Events> eventList =
                  TrackedEntityInstanceUtil.getAllEventListFromServiceDataState(
                      eventListByProgramStage);
              if (eventList.isNotEmpty) {
                Events currentReferralEvent = eventList.firstWhere(
                    (Events eventData) =>
                        eventData.event == widget.eventData.event);
                if (currentReferralEvent != null) {
                  onUpdateEventData(currentReferralEvent);
                }
              }
              return ovcReferralCard == null
                  ? Container(
                      child: CircularProcessLoader(
                        color: Colors.grey,
                      ),
                    )
                  : Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 15.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Referral ${widget.referralIndex.toString()}',
                                    style: TextStyle().copyWith(
                                      color: widget.titleColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: widget.isEditable &&
                                      referralOutComeEvent != null &&
                                      (referralOutComeEvent
                                                  .dateClientReachStation ==
                                              '' ||
                                          referralOutComeEvent
                                                  .dateServiceProvided ==
                                              ''),
                                  child: InkWell(
                                    onTap: () => onEditRefferral(context),
                                    child: Container(
                                      height: editIconHeight,
                                      width: editIconHeight,
                                      margin: EdgeInsets.symmetric(
                                        vertical: 5.0,
                                        horizontal: 5.0,
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/icons/edit-icon.svg',
                                        color: buttonLabelColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          LineSeperator(
                            color: widget.borderColor,
                            height: 2,
                          ),
                          Visibility(
                            visible: ovcReferralCard != null,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 13.0,
                                vertical: 10.0,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            currentLanguage == 'lesotho'
                                                ? 'Letsatsi'
                                                : 'Date',
                                            style: TextStyle().copyWith(
                                              fontSize: 14.0,
                                              color: widget.labelColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            ovcReferralCard.date,
                                            style: TextStyle().copyWith(
                                              fontSize: 14.0,
                                              color: widget.valueColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            currentLanguage == 'lesotho'
                                                ? 'Tsela ea tsebetso'
                                                : 'Service mode',
                                            style: TextStyle().copyWith(
                                              fontSize: 14.0,
                                              color: widget.labelColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            ovcReferralCard.serviceMode,
                                            style: TextStyle().copyWith(
                                              fontSize: 14.0,
                                              color: widget.valueColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Category',
                                            style: TextStyle().copyWith(
                                              fontSize: 14.0,
                                              color: widget.labelColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            ovcReferralCard.category,
                                            style: TextStyle().copyWith(
                                              fontSize: 14.0,
                                              color: widget.valueColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            currentLanguage == 'lesotho'
                                                ? 'Mofuta'
                                                : 'Type',
                                            style: TextStyle().copyWith(
                                              fontSize: 14.0,
                                              color: widget.labelColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            ovcReferralCard.type,
                                            style: TextStyle().copyWith(
                                              fontSize: 14.0,
                                              color: widget.valueColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Status',
                                            style: TextStyle().copyWith(
                                              fontSize: 14.0,
                                              color: widget.labelColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            child: Text(
                                              ovcReferralCard.status,
                                              style: TextStyle().copyWith(
                                                fontSize: 14.0,
                                                color: widget.valueColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Comments',
                                            style: TextStyle().copyWith(
                                              fontSize: 14.0,
                                              color: widget.labelColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            child: Text(
                                              ovcReferralCard.comments,
                                              style: TextStyle().copyWith(
                                                fontSize: 14.0,
                                                color: widget.valueColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
            },
          );
        },
      ),
    );
  }
}
