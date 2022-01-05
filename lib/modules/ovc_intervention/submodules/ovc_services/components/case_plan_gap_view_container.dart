import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan_gap_view.dart';

class CasePlanGapViewContainer extends StatelessWidget {
  const CasePlanGapViewContainer({
    Key? key,
    required this.casePlanGaps,
    required this.formSectionColor,
    required this.domainId,
    required this.isCasePlanForHousehold,
    required this.shouldEditCaseGapServiceProvision,
    required this.hasEditAccess,
    required this.shouldViewCaseGapServiceProvision,
  }) : super(key: key);

  final List<dynamic> casePlanGaps;
  final Color? formSectionColor;
  final String? domainId;
  final bool isCasePlanForHousehold;
  final bool shouldEditCaseGapServiceProvision;
  final bool shouldViewCaseGapServiceProvision;
  final bool hasEditAccess;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: casePlanGaps.length > 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: casePlanGaps.map((casePlanGap) {
          int gapIndex = casePlanGaps.indexOf(casePlanGap);
          return Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: CasePlanGapView(
              hasEditAccess: hasEditAccess,
              gapIndex: gapIndex,
              domainId: domainId,
              casePlanGap: casePlanGap,
              isCasePlanForHousehold: isCasePlanForHousehold,
              formSectionColor: formSectionColor,
              shouldEditCaseGapServiceProvision:
                  shouldEditCaseGapServiceProvision,
              shouldViewCaseGapServiceProvision:
                  shouldViewCaseGapServiceProvision,
            ),
          );
        }).toList(),
      ),
    );
  }
}
