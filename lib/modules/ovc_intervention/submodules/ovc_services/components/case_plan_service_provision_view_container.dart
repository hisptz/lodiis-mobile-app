import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/service_gap_view.dart';

class CasePlanServiceProvisionViewContainer extends StatelessWidget {
  const CasePlanServiceProvisionViewContainer({
    Key? key,
    required this.casePlanGaps,
    required this.formSectionColor,
    required this.domainId,
    required this.isCasePlanForHousehold,
    required this.isServiceMonitoring,
    required this.shouldEditCaseGapServiceProvision,
    required this.shouldViewCaseGapServiceProvision,
    required this.hasEditAccess,
  }) : super(key: key);

  final List<dynamic> casePlanGaps;
  final Color? formSectionColor;
  final String? domainId;
  final bool isCasePlanForHousehold;
  final bool isServiceMonitoring;
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
            child: ServiceGapView(
              gapIndex: gapIndex,
              hasEditAccess: hasEditAccess,
              domainId: domainId,
              casePlanGap: casePlanGap,
              isCasePlanForHousehold: isCasePlanForHousehold,
              isServiceMonitoring: isServiceMonitoring,
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
