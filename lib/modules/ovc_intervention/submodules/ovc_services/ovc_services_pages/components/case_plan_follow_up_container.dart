import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_follow_up_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_follow_up_view_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/constants/ovc_case_plan_constant.dart';

class CasePlanGapFollowUpContainer extends StatefulWidget {
  const CasePlanGapFollowUpContainer({
    Key key,
    @required this.formSectionColor,
    @required this.isCasePlanForHouseHold,
    @required this.casePlanGap,
    @required this.shouldAddCaseGapFollowUps,
    @required this.shouldViewCaseGapFollowUp,
  }) : super(key: key);

  final Map casePlanGap;
  final Color formSectionColor;
  final bool isCasePlanForHouseHold;
  final bool shouldAddCaseGapFollowUps;
  final bool shouldViewCaseGapFollowUp;

  @override
  _CasePlanGapFollowUpContainerState createState() =>
      _CasePlanGapFollowUpContainerState();
}

class _CasePlanGapFollowUpContainerState
    extends State<CasePlanGapFollowUpContainer> {
  String casePlanGapToFollowinUpLinkageValue;
  // todo using stage management to tget update list

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

  void addNewFollowingUp(BuildContext context) async {
    Map dataObject = Map();
    dataObject[OvcCasePlanConstant.casePlanGapToFollowinUpLinkage] =
        casePlanGapToFollowinUpLinkageValue;
    Widget modal = CasePlanFollowUpFormContainer(dataObject: dataObject);
    await AppUtil.showPopUpModal(context, modal, true);
    print(widget.casePlanGap);
  }

// handling state management on adding following ups
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Visibility(
        visible: widget.shouldAddCaseGapFollowUps ||
            widget.shouldViewCaseGapFollowUp,
        child: Container(
          child: Column(
            children: [
              Container(
                child: CasePlanFollowUpViewContainer(
                  casePlanGapToFollowinUpLinkageValue:
                      casePlanGapToFollowinUpLinkageValue,
                ),
              ),
              Visibility(
                visible: widget.shouldAddCaseGapFollowUps,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: widget.formSectionColor,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: EdgeInsets.all(15.0),
                    onPressed: () => this.addNewFollowingUp(context),
                    child: Text(
                      'ADD FOLLOW-UP',
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
