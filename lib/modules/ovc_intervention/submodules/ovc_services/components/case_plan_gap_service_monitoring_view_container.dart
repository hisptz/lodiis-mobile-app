import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/case_plan_gap_service_monitoring.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan_service_monitoring_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/constants/ovc_household_case_plan_constant.dart';
import 'package:provider/provider.dart';

class CasePlanGapServiceMonitoringViewContainer extends StatefulWidget {
  const CasePlanGapServiceMonitoringViewContainer({
    Key? key,
    required this.casePlanGapToServiceMonitoringLinkageValue,
    required this.shouldEditCaseGapServiceMonitoring,
    required this.isCasePlanForHousehold,
    required this.themeColor,
    required this.domainId,
    required this.casePlanGap,
  }) : super(key: key);

  final String? casePlanGapToServiceMonitoringLinkageValue;
  final bool shouldEditCaseGapServiceMonitoring;
  final bool isCasePlanForHousehold;
  final String? domainId;
  final Color? themeColor;
  final Map casePlanGap;

  @override
  _CasePlanGapServiceMonitoringViewContainerState createState() =>
      _CasePlanGapServiceMonitoringViewContainerState();
}

class _CasePlanGapServiceMonitoringViewContainerState
    extends State<CasePlanGapServiceMonitoringViewContainer> {
  String? programStage;
  String casePlanGapToServiceMonitoringLinkage =
      OvcCasePlanConstant.casePlanGapToMonitoringLinkage;
  bool isViewReady = false;
  double iconHeight = 15.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      programStage = widget.isCasePlanForHousehold
          ? OvcHouseholdCasePlanConstant
              .casePlanGapServiceMonitoringProgramStage
          : OvcChildCasePlanConstant.casePlanGapServiceMonitoringProgramStage;
      casePlanGapToServiceMonitoringLinkage =
          OvcCasePlanConstant.casePlanGapToMonitoringLinkage;
      isViewReady = true;
    });
  }

  Expanded _getTableViewWidget(String? currentLanguage,
      CasePlanGapServiceMonitoring casePlanGapServiceMonitoring, int index) {
    return Expanded(
      child: Table(
        children: [
          TableRow(
            children: [
              TableCell(
                child: Text(
                  currentLanguage == 'lesotho' ? 'Letsatsi' : 'Date',
                  style: TextStyle().copyWith(
                    color: Color(
                      0xFF8A9589,
                    ),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TableCell(
                child: Text(
                  '',
                  style: TextStyle().copyWith(
                    color: Color(
                      0xFF8A9589,
                    ),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text(
                  casePlanGapServiceMonitoring.date!,
                  style: TextStyle().copyWith(
                    color: Color(0xFF1A3518),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TableCell(
                child: Text(
                  'Monitoring $index',
                  style: TextStyle().copyWith(
                    color: Color(0xFF1A3518),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  onEditCasePlanServiceMonitoring(
      context, CasePlanGapServiceMonitoring casePlanGapServiceMonitoring,
      {bool isEditable = true}) async {
    Map dataObject = Map();
    dataObject['eventDate'] = casePlanGapServiceMonitoring.date;
    dataObject['eventId'] = casePlanGapServiceMonitoring.id;
    for (Map dataValue in casePlanGapServiceMonitoring.eventData!.dataValues) {
      if ('${dataValue['value']}'.isNotEmpty)
        dataObject[dataValue['dataElement']] = dataValue['value'];
    }

    Map casePlanGap = widget.casePlanGap;
    casePlanGap.remove('eventDate');
    casePlanGap.remove('eventId');
    dataObject.addAll(casePlanGap);

    Widget modal = CasePlanServiceMonitoringFormContainer(
      dataObject: dataObject,
      domainId: widget.domainId,
      isCasePlanForHousehold: widget.isCasePlanForHousehold,
      isEditableMode: isEditable,
    );

    await AppUtil.showPopUpModal(context, modal, true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String? currentLanguage = languageTranslationState.currentLanguage;
          return Consumer<ServiceEventDataState>(
            builder: (context, serviceEventDataState, child) {
              bool isLoading = serviceEventDataState.isLoading;
              Map<String?, List<Events>> eventListByProgramStage =
                  serviceEventDataState.eventListByProgramStage;
              List<Events> events = TrackedEntityInstanceUtil
                  .getAllEventListFromServiceDataStateByProgramStages(
                      eventListByProgramStage, [programStage]);
              List<CasePlanGapServiceMonitoring> casePlanMonitoringEvents =
                  events
                      .map((Events eventData) => CasePlanGapServiceMonitoring()
                          .fromTeiModel(
                              eventData, casePlanGapToServiceMonitoringLinkage))
                      .toList()
                      .where((CasePlanGapServiceMonitoring
                              casePlanGapServiceMonitoring) =>
                          casePlanGapServiceMonitoring
                              .casePlanGapToServiceMonitoringLinkage ==
                          widget.casePlanGapToServiceMonitoringLinkageValue)
                      .toList();
              int index = casePlanMonitoringEvents.length;
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
                              visible: casePlanMonitoringEvents.length > 0,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Monitoring',
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
                                children: casePlanMonitoringEvents.map(
                                    (CasePlanGapServiceMonitoring
                                        casePlanGapServiceMonitoring) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                    ),
                                    child: Row(
                                      children: [
                                        _getTableViewWidget(
                                          currentLanguage,
                                          casePlanGapServiceMonitoring,
                                          index--,
                                        ),
                                        Container(
                                          child: InkWell(
                                            onTap: () =>
                                                onEditCasePlanServiceMonitoring(
                                                    context,
                                                    casePlanGapServiceMonitoring,
                                                    isEditable: false),
                                            child: Container(
                                              height: iconHeight,
                                              width: iconHeight,
                                              margin: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 5,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/expand_icon.svg',
                                                color: widget.themeColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Visibility(
                                            visible: widget
                                                .shouldEditCaseGapServiceMonitoring,
                                            child: Container(
                                              child: InkWell(
                                                onTap: () =>
                                                    onEditCasePlanServiceMonitoring(
                                                  context,
                                                  casePlanGapServiceMonitoring,
                                                ),
                                                child: Container(
                                                  height: iconHeight,
                                                  width: iconHeight,
                                                  margin: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 5,
                                                  ),
                                                  child: SvgPicture.asset(
                                                    'assets/icons/edit-icon.svg',
                                                    color: widget.themeColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
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
