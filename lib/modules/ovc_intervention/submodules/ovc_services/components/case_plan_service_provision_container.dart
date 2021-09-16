import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan_service_provision_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan_gap_service_provision_view_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/constants/ovc_household_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/utils/ovc_service_provision_util.dart';

class CasePlanServiceProvisionContainer extends StatefulWidget {
  const CasePlanServiceProvisionContainer({
    Key? key,
    required this.formSectionColor,
    required this.isCasePlanForHousehold,
    required this.casePlanGap,
    required this.shouldEditCaseGapServiceProvision,
    required this.shoulViewCaseGapServiceProvision,
    required this.domainId,
  }) : super(key: key);

  final Map casePlanGap;
  final Color? formSectionColor;
  final bool isCasePlanForHousehold;
  final bool shouldEditCaseGapServiceProvision;
  final bool shoulViewCaseGapServiceProvision;
  final String? domainId;

  @override
  _CasePlanServiceProvisionContainerState createState() =>
      _CasePlanServiceProvisionContainerState();
}

class _CasePlanServiceProvisionContainerState
    extends State<CasePlanServiceProvisionContainer> {
  String? casePlanGapToServiceProvisionLinkageValue;

  @override
  void initState() {
    super.initState();
    setState(() {
      String casePlanGapToServiceProvisionLinkage =
          OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage;
      casePlanGapToServiceProvisionLinkageValue =
          widget.casePlanGap[casePlanGapToServiceProvisionLinkage] ??
              AppUtil.getUid();
    });
  }

  void addServiceProvision(BuildContext context) async {
    String programStage = widget.isCasePlanForHousehold
        ? OvcHouseholdCasePlanConstant.casePlanGapServiceProvisionProgramStage
        : OvcChildCasePlanConstant.casePlanGapServiceProvisionProgramStage;

    Map dataObject = Map();
    for (var key in widget.casePlanGap.keys) {
      if (key != 'eventId' && key != 'eventDate') {
        dataObject[key] = widget.casePlanGap[key];
      }
    }
    Map<String, List<String>> previousSessionMapping =
        OvcServiceProvisionUtil.getPreviousSessionMapping(
      context,
      [programStage],
    );
    dataObject["previousSessionMapping"] = previousSessionMapping;
    dataObject[OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage] =
        casePlanGapToServiceProvisionLinkageValue;
    Widget modal = CasePlanServiceProvisionFormModalContainer(
      dataObject: dataObject,
      domainId: widget.domainId,
      isCasePlanForHousehold: widget.isCasePlanForHousehold,
      isEditableMode: widget.shoulViewCaseGapServiceProvision,
    );
    await AppUtil.showPopUpModal(context, modal, true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Visibility(
        visible: widget.shouldEditCaseGapServiceProvision ||
            widget.shoulViewCaseGapServiceProvision,
        child: Container(
          child: Column(
            children: [
              Container(
                child: CasePlanGapServiceViewContainer(
                  casePlanGap: widget.casePlanGap,
                  domainId: widget.domainId,
                  themeColor: widget.formSectionColor,
                  casePlanGapToServiceProvisionLinkageValue:
                      casePlanGapToServiceProvisionLinkageValue,
                  shouldEditCaseGapServiceProvision:
                      widget.shouldEditCaseGapServiceProvision,
                  isCasePlanForHousehold: widget.isCasePlanForHousehold,
                ),
              ),
              Visibility(
                visible: widget.shoulViewCaseGapServiceProvision,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: widget.formSectionColor!,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.all(15.0),
                    ),
                    onPressed: () => this.addServiceProvision(context),
                    child: Text(
                      'ADD SERVICE',
                      style: TextStyle().copyWith(
                        color: widget.formSectionColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
