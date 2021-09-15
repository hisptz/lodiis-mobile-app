import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/case_plan_gap_service_provision.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan_service_provision_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/constants/ovc_household_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/utils/ovc_service_provision_util.dart';
import 'package:provider/provider.dart';

class CasePlanGapServiceViewContainer extends StatefulWidget {
  const CasePlanGapServiceViewContainer({
    Key? key,
    required this.casePlanGapToServiceProvisionLinkageValue,
    required this.shouldEditCaseGapServiceProvision,
    required this.isCasePlanForHousehold,
    required this.themeColor,
    required this.domainId,
    required this.casePlanGap,
  }) : super(key: key);

  final String? casePlanGapToServiceProvisionLinkageValue;
  final bool shouldEditCaseGapServiceProvision;
  final bool isCasePlanForHousehold;
  final String? domainId;
  final Color? themeColor;
  final Map casePlanGap;

  @override
  _CasePlanGapServiceViewContainerState createState() =>
      _CasePlanGapServiceViewContainerState();
}

class _CasePlanGapServiceViewContainerState
    extends State<CasePlanGapServiceViewContainer> {
  String? programStage;
  String casePlanGapToServiceProvisionLinkage =
      OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage;
  bool isViewReady = false;
  double iconHeight = 15.0;

  void onEditCasePlanServiceProvision(
    BuildContext context,
    CasePlanGapServiceProvision casePlanGapServiceProvision,
  ) async {
    Map dataObject = Map();
    dataObject['eventDate'] = casePlanGapServiceProvision.date;
    dataObject['eventId'] = casePlanGapServiceProvision.id;
    for (Map dataValue in casePlanGapServiceProvision.eventData!.dataValues) {
      if ('${dataValue['value']}'.isNotEmpty)
        dataObject[dataValue['dataElement']] = dataValue['value'];
    }
    Map<String, List<String>> interventionSessions =
        OvcServiceProvisionUtil.getExistingSessionNumberMapping(
      context,
      [programStage!],
      eventId: casePlanGapServiceProvision.id,
    );
    dataObject["interventionSessions"] = interventionSessions;
    Map casePlanGap = widget.casePlanGap;
    casePlanGap.remove('eventDate');
    casePlanGap.remove('eventId');
    dataObject.addAll(casePlanGap);
    Widget modal = CasePlanServiceProvisionFormModalContainer(
      dataObject: dataObject,
      domainId: widget.domainId,
      isCasePlanForHousehold: widget.isCasePlanForHousehold,
      isEditableMode: true,
    );
    await AppUtil.showPopUpModal(context, modal, true);
  }

  Expanded _getTableViewWidget(String? currentLanguage,
      CasePlanGapServiceProvision casePlanGapServiceProvision) {
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
                  'Service provided',
                  style: TextStyle().copyWith(
                    color: Color(0xFF8A9589),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TableCell(
                child: Text(
                  'Comment',
                  style: TextStyle().copyWith(
                    color: Color(0xFF8A9589),
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
                  casePlanGapServiceProvision.date!,
                  style: TextStyle().copyWith(
                    color: Color(0xFF1A3518),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TableCell(
                child: Text(
                  casePlanGapServiceProvision.result!,
                  style: TextStyle().copyWith(
                    color: Color(0xFF1A3518),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TableCell(
                child: Text(
                  casePlanGapServiceProvision.reason!,
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

  @override
  void initState() {
    super.initState();
    setState(() {
      programStage = widget.isCasePlanForHousehold
          ? OvcHouseholdCasePlanConstant.casePlanGapServiceProvisionProgramStage
          : OvcChildCasePlanConstant.casePlanGapServiceProvisionProgramStage;
      casePlanGapToServiceProvisionLinkage =
          OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage;
      isViewReady = true;
    });
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
              List<CasePlanGapServiceProvision> casePlanFollowups = events
                  .map((Events eventData) => CasePlanGapServiceProvision()
                      .fromTeiModel(
                          eventData, casePlanGapToServiceProvisionLinkage))
                  .toList()
                  .where((CasePlanGapServiceProvision
                          casePlanGapServiceProvision) =>
                      casePlanGapServiceProvision
                          .casePlanGapToServiceProvisionLinkage ==
                      widget.casePlanGapToServiceProvisionLinkageValue)
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
                                        'Services',
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
                                      (CasePlanGapServiceProvision
                                              casePlanGapServiceProvision) =>
                                          Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: Row(
                                          children: [
                                            _getTableViewWidget(
                                              currentLanguage,
                                              casePlanGapServiceProvision,
                                            ),
                                            Container(
                                              child: Visibility(
                                                visible: widget
                                                    .shouldEditCaseGapServiceProvision,
                                                child: Container(
                                                  child: InkWell(
                                                    onTap: () =>
                                                        onEditCasePlanServiceProvision(
                                                      context,
                                                      casePlanGapServiceProvision,
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
