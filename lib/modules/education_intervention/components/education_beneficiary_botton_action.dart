import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/education_intervention/components/education_beneficiary_button.dart';

class EducationBeneficiaryBottonAction extends StatelessWidget {
  const EducationBeneficiaryBottonAction({
    Key? key,
    required this.isLbseLearningOutcomeVisible,
    required this.isBursarySchoolVisible,
    required this.isBursaryClubVisible,
    this.onOpenLbseLearningOutcome,
    this.onOpenBursarySchool,
    this.onOpenBursaryClub,
  }) : super(key: key);

  final double height = 50.0;

  final bool isLbseLearningOutcomeVisible;
  final bool isBursarySchoolVisible;
  final bool isBursaryClubVisible;

  final VoidCallback? onOpenLbseLearningOutcome;
  final VoidCallback? onOpenBursarySchool;
  final VoidCallback? onOpenBursaryClub;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(12.0),
        bottomRight: Radius.circular(12.0),
      ),
      child: Container(
        height: height,
        color: const Color(0xFF009688).withOpacity(0.08),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              EducationBeneficiaryButton(
                label: 'LEARNING OUTCOME',
                isVisible: isLbseLearningOutcomeVisible,
                hasSplitBorder: false,
                onTap: onOpenLbseLearningOutcome,
              ),
              EducationBeneficiaryButton(
                label: 'SCHOOL',
                isVisible: isBursarySchoolVisible,
                hasSplitBorder: isBursaryClubVisible,
                onTap: onOpenBursarySchool,
              ),
              EducationBeneficiaryButton(
                label: 'CLUB',
                isVisible: isBursaryClubVisible,
                hasSplitBorder: false,
                onTap: onOpenBursaryClub,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
