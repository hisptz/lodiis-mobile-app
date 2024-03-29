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
    required this.isBursarySchoolVisible,
    required this.isBursaryClubVisible,
    required this.isBursaryClubReferralVisible,
    required this.educationBeneficiary,
    this.onCardToggle,
    this.onView,
    this.onEdit,
    this.onOpenLbseLearningOutcome,
    this.onOpenLbseReferral,
    this.onOpenBursarySchool,
    this.onOpenBursaryClub,
    this.onOpenBursaryClubReferral,
  }) : super(key: key);

  final bool canEdit;
  final bool canView;
  final bool canExpand;
  final bool isExpanded;
  final bool isLbseLearningOutcomeVisible;
  final bool isBursarySchoolVisible;
  final bool isBursaryClubVisible;
  final bool isBursaryClubReferralVisible;
  final EducationBeneficiary educationBeneficiary;
  final VoidCallback? onCardToggle;
  final VoidCallback? onView;
  final VoidCallback? onEdit;

  final VoidCallback? onOpenLbseLearningOutcome;
  final VoidCallback? onOpenLbseReferral;
  final VoidCallback? onOpenBursarySchool;
  final VoidCallback? onOpenBursaryClub;
  final VoidCallback? onOpenBursaryClubReferral;
  final String femaleSvgIcon = 'assets/icons/female-education-beneficiary.svg';
  final String maleSvgIcon = 'assets/icons/male-education-beneficiary.svg';

  bool _syncStatusOfLbseBeneficiary(
    EducationBeneficiary educationBeneficiary,
    List<String> unsyncedTeiReferences,
  ) {
    int teiIndex = unsyncedTeiReferences.indexOf(educationBeneficiary.id!);
    return teiIndex == -1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16.0,
        right: 13.0,
        left: 13.0,
      ),
      child: MaterialCard(
        body: Column(
          children: [
            Consumer<SynchronizationStatusState>(
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
                canEdit:
                    canEdit && educationBeneficiary.enrollmentOuAccessible!,
                canExpand: canExpand,
                canView: canView,
                isExpanded: isExpanded,
                onToggleCard: onCardToggle,
                onEdit: onEdit,
                onView: onView,
              );
            }),
            EducationBeneficiaryCardBody(
              isVerticalLayout: isExpanded,
              educationBeneficiary: educationBeneficiary,
            ),
            LineSeparator(
              color: const Color(0xFF009688).withOpacity(0.1),
            ),
            Visibility(
              visible: isBursaryClubVisible ||
                  isBursarySchoolVisible ||
                  isLbseLearningOutcomeVisible,
              child: EducationBeneficiaryBottonAction(
                isLbseLearningOutcomeVisible: isLbseLearningOutcomeVisible,
                isBursarySchoolVisible: isBursarySchoolVisible,
                isBursaryClubVisible: isBursaryClubVisible,
                isBursaryClubReferralVisible: isBursaryClubReferralVisible,
                onOpenLbseLearningOutcome: onOpenLbseLearningOutcome,
                onOpenBursarySchool: onOpenBursarySchool,
                onOpenBursaryClub: onOpenBursaryClub,
                onOpenBursaryClubReferral: onOpenBursaryClubReferral,
              ),
            )
          ],
        ),
      ),
    );
  }
}
