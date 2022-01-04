import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan_gap_service_provision_view_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';

class CasePlanGapServiceProvisionContainer extends StatefulWidget {
  const CasePlanGapServiceProvisionContainer({
    Key? key,
    required this.formSectionColor,
    required this.isCasePlanForHousehold,
    required this.casePlanGap,
    required this.shouldEditCaseGapServiceProvision,
    required this.shouldViewCaseGapServiceProvision,
    required this.domainId,
    required this.hasEditAccess,
  }) : super(key: key);

  final Map casePlanGap;
  final Color? formSectionColor;
  final bool isCasePlanForHousehold;
  final bool shouldEditCaseGapServiceProvision;
  final bool shouldViewCaseGapServiceProvision;
  final String? domainId;
  final bool hasEditAccess;

  @override
  _CasePlanGapServiceProvisionContainerState createState() =>
      _CasePlanGapServiceProvisionContainerState();
}

class _CasePlanGapServiceProvisionContainerState
    extends State<CasePlanGapServiceProvisionContainer> {
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

// handling state management on adding following ups
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Visibility(
        visible: widget.shouldEditCaseGapServiceProvision ||
            widget.shouldViewCaseGapServiceProvision,
        child: Container(
          child: Column(
            children: [
              Container(
                child: CasePlanGapServiceViewContainer(
                  casePlanGap: widget.casePlanGap,
                  hasEditAccess: widget.hasEditAccess,
                  domainId: widget.domainId,
                  themeColor: widget.formSectionColor,
                  casePlanGapToServiceProvisionLinkageValue:
                      casePlanGapToServiceProvisionLinkageValue,
                  shouldEditCaseGapServiceProvision:
                      widget.shouldEditCaseGapServiceProvision,
                  isCasePlanForHousehold: widget.isCasePlanForHousehold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
