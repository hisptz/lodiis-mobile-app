import 'package:flutter/material.dart';

class CasePlanGapServiceProvisionView extends StatelessWidget {
  const CasePlanGapServiceProvisionView({
    Key? key,
    required this.domainId,
    required this.formSectionColor,
    required this.casePlanGap,
    required this.isHouseholdCasePlan,
    required this.hasEditAccess,
  }) : super(key: key);

  final String domainId;
  final Color formSectionColor;
  final Map casePlanGap;
  final bool isHouseholdCasePlan;
  final bool hasEditAccess;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Services updated $domainId $formSectionColor $casePlanGap $isHouseholdCasePlan $hasEditAccess',
    );
  }
}
