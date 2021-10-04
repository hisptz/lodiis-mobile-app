import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/modules/education_intervention/components/education_beneficiary_botton_action.dart';
import 'package:kb_mobile_app/modules/education_intervention/components/education_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/education_intervention/components/education_beneficiary_card_header.dart';
import 'package:provider/provider.dart';

class EducationBeneficiaryCard extends StatelessWidget {
  const EducationBeneficiaryCard({
    Key? key,
    required this.canEdit,
    required this.canView,
    required this.canExpand,
    required this.isExpanded,
    required this.isLbseLearningOutcomeVisible,
    required this.isLbseReferralVisible,
    required this.isBursarySchoolVisible,
    required this.isBursaryClubVisible,
    required this.educationBeneficiary,
    this.onCardToggle,
    this.onView,
    this.onEdit,
    this.onOpenLbseLearningOutcome,
    this.onOpenLbseReferral,
    this.onOpenBursarySchool,
    this.onOpenBursaryClub,
  }) : super(key: key);

  final bool canEdit;
  final bool canView;
  final bool canExpand;
  final bool isExpanded;
  final bool isLbseLearningOutcomeVisible;
  final bool isLbseReferralVisible;
  final bool isBursarySchoolVisible;
  final bool isBursaryClubVisible;
  final EducationBeneficiary educationBeneficiary;
  final VoidCallback? onCardToggle;
  final VoidCallback? onView;
  final VoidCallback? onEdit;

  final VoidCallback? onOpenLbseLearningOutcome;
  final VoidCallback? onOpenLbseReferral;
  final VoidCallback? onOpenBursarySchool;
  final VoidCallback? onOpenBursaryClub;
  final String femaleSvgIcon = 'assets/icons/female-education-beneficiary.svg';
  final String maleSvgIcon = 'assets/icons/male-education-beneficiary.svg';

  bool _syncStatusOfLbseBeneficiary(
    EducationBeneficiary educationBeneficiary,
    List<String> unsyncedTeiReferences,
  ) {
    int teiIndex = unsyncedTeiReferences.indexOf(educationBeneficiary.id!);
    return educationBeneficiary.isSynced! && teiIndex == -1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 16.0,
        right: 13.0,
        left: 13.0,
      ),
      child: MaterialCard(
        body: Container(
          child: Column(
            children: [
              Container(
                child: Consumer<SynchronizationStatusState>(
                    builder: (context, synchronizationStatusState, child) {
                  List<String> unsyncedTeiReferences =
                      synchronizationStatusState.unsyncedTeiReferences;
                  return EducationBeneficiaryCardHeader(
                    svgIcon: educationBeneficiary.isMaleBeneficiary!
                        ? maleSvgIcon
                        : femaleSvgIcon,
                    isSynced: _syncStatusOfLbseBeneficiary(
                        educationBeneficiary, unsyncedTeiReferences),
                    beneficiaryName: educationBeneficiary.toString(),
                    canEdit: canEdit,
                    canExpand: canExpand,
                    canView: canView,
                    isExpanded: isExpanded,
                    onToggleCard: onCardToggle,
                    onEdit: onEdit,
                    onView: onView,
                  );
                }),
              ),
              EducationBeneficiaryCardBody(
                isVerticalLayout: isExpanded,
                educationBeneficiary: educationBeneficiary,
              ),
              LineSeparator(
                color: Color(0xFF009688).withOpacity(0.1),
              ),
              EducationBeneficiaryBottonAction(
                isLbseLearningOutcomeVisible: isLbseLearningOutcomeVisible,
                isLbseReferralVisible: isLbseReferralVisible,
                isBursarySchoolVisible: isBursarySchoolVisible,
                isBursaryClubVisible: isBursaryClubVisible,
                onOpenLbseLearningOutcome: onOpenLbseLearningOutcome,
                onOpenLbseReferral: onOpenLbseReferral,
                onOpenBursarySchool: onOpenBursarySchool,
                onOpenBursaryClub: onOpenBursaryClub,
              )
            ],
          ),
        ),
      ),
    );
  }
}
