import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_follow_up_view_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/constants/ovc_case_plan_constant.dart';

class CasePlanGapFollowUpContainer extends StatefulWidget {
  const CasePlanGapFollowUpContainer({
    Key key,
    @required this.formSectionColor,
    @required this.isCasePlanForHouseHold,
    @required this.casePlanGap,
    @required this.shouldEditCaseGapFollowUps,
    @required this.shouldViewCaseGapFollowUp,
    @required this.domainId,
  }) : super(key: key);

  final Map casePlanGap;
  final Color formSectionColor;
  final bool isCasePlanForHouseHold;
  final bool shouldEditCaseGapFollowUps;
  final bool shouldViewCaseGapFollowUp;
  final String domainId;

  @override
  _CasePlanGapFollowUpContainerState createState() =>
      _CasePlanGapFollowUpContainerState();
}

class _CasePlanGapFollowUpContainerState
    extends State<CasePlanGapFollowUpContainer> {
  String casePlanGapToFollowinUpLinkageValue;

  @override
  void initState() {
    super.initState();
    setState(() {
      String casePlanGapToFollowinUpLinkage =
          OvcCasePlanConstant.casePlanGapToFollowinUpLinkage;
      casePlanGapToFollowinUpLinkageValue =
          widget.casePlanGap[casePlanGapToFollowinUpLinkage] ??
              AppUtil.getUid();
    });
  }

// handling state management on adding following ups
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Visibility(
        visible: widget.shouldEditCaseGapFollowUps ||
            widget.shouldViewCaseGapFollowUp,
        child: Container(
          child: Column(
            children: [
              Container(
                child: CasePlanFollowUpViewContainer(
                  domainId: widget.domainId,
                  themeColor: widget.formSectionColor,
                  casePlanGapToFollowinUpLinkageValue:
                      casePlanGapToFollowinUpLinkageValue,
                  shouldEditCaseGapFollowUps: widget.shouldEditCaseGapFollowUps,
                  isCasePlanForHouseHold: widget.isCasePlanForHouseHold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
