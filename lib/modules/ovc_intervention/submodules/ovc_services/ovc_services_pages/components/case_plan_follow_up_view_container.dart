import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/case_plan_gap_followup.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_follow_up_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/house_hold_case_plan/constants/ovc_house_hold_case_plan_constant.dart';
import 'package:provider/provider.dart';

class CasePlanFollowUpViewContainer extends StatefulWidget {
  const CasePlanFollowUpViewContainer({
    Key key,
    @required this.casePlanGapToFollowinUpLinkageValue,
    @required this.shouldEditCaseGapFollowUps,
    @required this.isCasePlanForHouseHold,
    @required this.themeColor,
    @required this.domainId,
    @required this.casePlanGap,
  }) : super(key: key);

  final String casePlanGapToFollowinUpLinkageValue;
  final bool shouldEditCaseGapFollowUps;
  final bool isCasePlanForHouseHold;
  final String domainId;
  final Color themeColor;
  final Map casePlanGap;

  @override
  _CasePlanFollowUpViewContainerState createState() =>
      _CasePlanFollowUpViewContainerState();
}

class _CasePlanFollowUpViewContainerState
    extends State<CasePlanFollowUpViewContainer> {
  String programStage;
  String casePlanGapToFollowinUpLinkage =
      OvcCasePlanConstant.casePlanGapToFollowinUpLinkage;
  bool isViewReady = false;
  double iconHeight = 15.0;

  void onEditCasePlanFollowUp(
    BuildContext context,
    CasePlanGapFollowUp casePlanFollowup,
  ) async {
    Map dataObject = Map();
    dataObject['eventDate'] = casePlanFollowup.date;
    dataObject['eventId'] = casePlanFollowup.id;
    for (Map dataValue in casePlanFollowup.eventData.dataValues) {
      if ('${dataValue['value']}'.isNotEmpty)
        dataObject[dataValue['dataElement']] = dataValue['value'];
    }
    Map casePlanGap = widget.casePlanGap;
    casePlanGap.remove('eventDate');
    casePlanGap.remove('eventId');
    dataObject.addAll(casePlanGap);
    Widget modal = CasePlanFollowUpFormContainer(
      dataObject: dataObject,
      domainId: widget.domainId,
      isCasePlanForHouseHold: widget.isCasePlanForHouseHold,
      isEditableMode: true,
    );
    await AppUtil.showPopUpModal(context, modal, true);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      programStage = widget.isCasePlanForHouseHold
          ? OvcHouseHoldCasePlanConstant.casePlanGapFollowUpProgramStage
          : OvcChildCasePlanConstant.casePlanGapFollowUpProgramStage;
      casePlanGapToFollowinUpLinkage =
          OvcCasePlanConstant.casePlanGapToFollowinUpLinkage;
      isViewReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String currentLanguage = languageTranslationState.currentLanguage;
          return Consumer<ServiceEventDataState>(
            builder: (context, serviceEventDataState, child) {
              bool isLoading = serviceEventDataState.isLoading;
              Map<String, List<Events>> eventListByProgramStage =
                  serviceEventDataState.eventListByProgramStage;
              List<Events> events = TrackedEntityInstanceUtil
                  .getAllEventListFromServiceDataStateByProgramStages(
                      eventListByProgramStage, [programStage]);
              List<CasePlanGapFollowUp> casePlanFollowups = events
                  .map((Events eventData) => CasePlanGapFollowUp()
                      .fromTeiModel(eventData, casePlanGapToFollowinUpLinkage))
                  .toList()
                  .where((CasePlanGapFollowUp casePlanFollowup) =>
                      casePlanFollowup.casePlanGapToFollowinUpLinkage ==
                      widget.casePlanGapToFollowinUpLinkageValue)
                  .toList();
              return Container(
                child: isLoading || !isViewReady
                    ? Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: CircularProcessLoader(
                          color: Colors.blueGrey,
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: casePlanFollowups.length > 0,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Follow-up',
                                        style: TextStyle().copyWith(
                                          color: widget.themeColor,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: casePlanFollowups
                                    .map(
                                      (CasePlanGapFollowUp casePlanFollowup) =>
                                          Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Table(
                                                children: [
                                                  TableRow(
                                                    children: [
                                                      TableCell(
                                                        child: Text(
                                                          currentLanguage ==
                                                                  'lesotho'
                                                              ? 'Letsatsi'
                                                              : 'Date',
                                                          style: TextStyle()
                                                              .copyWith(
                                                            color: Color(
                                                                0xFF8A9589),
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        child: Text(
                                                          'Results',
                                                          style: TextStyle()
                                                              .copyWith(
                                                            color: Color(
                                                                0xFF8A9589),
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        child: Text(
                                                          'Comment',
                                                          style: TextStyle()
                                                              .copyWith(
                                                            color: Color(
                                                                0xFF8A9589),
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  TableRow(
                                                    children: [
                                                      TableCell(
                                                        child: Text(
                                                          casePlanFollowup.date,
                                                          style: TextStyle()
                                                              .copyWith(
                                                            color: Color(
                                                                0xFF1A3518),
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        child: Text(
                                                          casePlanFollowup
                                                              .result,
                                                          style: TextStyle()
                                                              .copyWith(
                                                            color: Color(
                                                                0xFF1A3518),
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      TableCell(
                                                        child: Text(
                                                          casePlanFollowup
                                                              .reason,
                                                          style: TextStyle()
                                                              .copyWith(
                                                            color: Color(
                                                                0xFF1A3518),
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Visibility(
                                                visible: widget
                                                    .shouldEditCaseGapFollowUps,
                                                child: Container(
                                                  child: InkWell(
                                                    onTap: () =>
                                                        onEditCasePlanFollowUp(
                                                      context,
                                                      casePlanFollowup,
                                                    ),
                                                    child: Container(
                                                      height: iconHeight,
                                                      width: iconHeight,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 5,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        'assets/icons/edit-icon.svg',
                                                        color:
                                                            widget.themeColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
