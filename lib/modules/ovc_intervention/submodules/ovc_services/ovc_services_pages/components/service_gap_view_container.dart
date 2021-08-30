import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/service_gap_view.dart';

class ServiceGapViewContainer extends StatelessWidget {
  const ServiceGapViewContainer({
    Key? key,
    required this.casePlanGaps,
    required this.formSectionColor,
    required this.domainId,
    required this.isCasePlanForHousehold,
    required this.shouldEditCaseGapFollowUps,
    required this.shouldViewCaseGapFollowUp,
  }) : super(key: key);

  final List<dynamic> casePlanGaps;
  final Color? formSectionColor;
  final String? domainId;
  final bool isCasePlanForHousehold;
  final bool shouldEditCaseGapFollowUps;
  final bool shouldViewCaseGapFollowUp;

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
            child: ServiceGapView(
              gapIndex: gapIndex,
              domainId: domainId,
              casePlanGap: casePlanGap,
              isCasePlanForHousehold: isCasePlanForHousehold,
              formSectionColor: formSectionColor,
              shouldEditCaseGapFollowUps: shouldEditCaseGapFollowUps,
              shouldViewCaseGapFollowUp: shouldViewCaseGapFollowUp,
            ),
          );
        }).toList(),
      ),
    );
  }
}
