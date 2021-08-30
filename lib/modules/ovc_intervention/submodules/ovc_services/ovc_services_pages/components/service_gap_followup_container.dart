import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_follow_up_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_follow_up_view_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/constants/ovc_case_plan_constant.dart';

class ServiceGapFollowUpContainer extends StatefulWidget {
  const ServiceGapFollowUpContainer({
    Key? key,
    required this.formSectionColor,
    required this.isCasePlanForHousehold,
    required this.casePlanGap,
    required this.shouldEditCaseGapFollowUps,
    required this.shouldViewCaseGapFollowUp,
    required this.domainId,
  }) : super(key: key);

  final Map casePlanGap;
  final Color? formSectionColor;
  final bool isCasePlanForHousehold;
  final bool shouldEditCaseGapFollowUps;
  final bool shouldViewCaseGapFollowUp;
  final String? domainId;

  @override
  _ServiceGapFollowUpContainerState createState() =>
      _ServiceGapFollowUpContainerState();
}

class _ServiceGapFollowUpContainerState
    extends State<ServiceGapFollowUpContainer> {
  String? casePlanGapToFollowUpLinkageValue;

  @override
  void initState() {
    super.initState();
    setState(() {
      String casePlanGapToFollowUpLinkage =
          OvcCasePlanConstant.casePlanGapToFollowUpLinkage;
      casePlanGapToFollowUpLinkageValue =
          widget.casePlanGap[casePlanGapToFollowUpLinkage] ?? AppUtil.getUid();
    });
  }

  void addNewFollowingUp(BuildContext context) async {
    Map dataObject = Map();
    for (var key in widget.casePlanGap.keys) {
      if (key != 'eventId' && key != 'eventDate') {
        dataObject[key] = widget.casePlanGap[key];
      }
    }
    dataObject[OvcCasePlanConstant.casePlanGapToFollowUpLinkage] =
        casePlanGapToFollowUpLinkageValue;
    Widget modal = CasePlanFollowUpFormContainer(
      dataObject: dataObject,
      domainId: widget.domainId,
      isCasePlanForHousehold: widget.isCasePlanForHousehold,
      isEditableMode: widget.shouldViewCaseGapFollowUp,
    );
    await AppUtil.showPopUpModal(context, modal, true);
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
                  casePlanGap: widget.casePlanGap,
                  domainId: widget.domainId,
                  themeColor: widget.formSectionColor,
                  casePlanGapToFollowUpLinkageValue:
                      casePlanGapToFollowUpLinkageValue,
                  shouldEditCaseGapFollowUps: widget.shouldEditCaseGapFollowUps,
                  isCasePlanForHousehold: widget.isCasePlanForHousehold,
                ),
              ),
              Visibility(
                visible: widget.shouldViewCaseGapFollowUp,
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
