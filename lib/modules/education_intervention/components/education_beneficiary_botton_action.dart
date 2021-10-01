import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:kb_mobile_app/modules/education_intervention/components/education_beneficiary_button.dart';

class EducationBeneficiaryBottonAction extends StatelessWidget {
  const EducationBeneficiaryBottonAction({
    Key? key,
    required this.isLbseLearningOutcomeVisible,
    required this.isLbseReferralVisible,
    required this.isBursarySchoolVisible,
    required this.isBursaryClubVisible,
    this.onOpenLbseLearningOutcome,
    this.onOpenLbseReferral,
    this.onOpenBursarySchool,
    this.onOpenBursaryClub,
  }) : super(key: key);

  final double height = 50.0;

  final bool isLbseLearningOutcomeVisible;
  final bool isLbseReferralVisible;
  final bool isBursarySchoolVisible;
  final bool isBursaryClubVisible;

  final VoidCallback? onOpenLbseLearningOutcome;
  final VoidCallback? onOpenLbseReferral;
  final VoidCallback? onOpenBursarySchool;
  final VoidCallback? onOpenBursaryClub;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
        child: Container(
          height: height,
          color: Color(0xFF009688).withOpacity(0.08),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                EducationBeneficiaryButton(
                  label: 'LEARNING OUTCOME',
                  isVisible: isLbseLearningOutcomeVisible,
                  hasSplitBorder: isLbseReferralVisible,
                  onTap: () => {
                    print('On tap => isLbseLearningOutcomeVisible'),
                  },
                ),
                EducationBeneficiaryButton(
                  label: 'REFERRAL',
                  isVisible: isLbseReferralVisible,
                  hasSplitBorder: isBursarySchoolVisible,
                  onTap: () => {
                    print('On tap => isLbseReferralVisible'),
                  },
                ),
                EducationBeneficiaryButton(
                  label: 'SCHOOL',
                  isVisible: isBursarySchoolVisible,
                  hasSplitBorder: isBursaryClubVisible,
                  onTap: () => {
                    print('On tap => isBursarySchoolVisible'),
                  },
                ),
                EducationBeneficiaryButton(
                  label: 'CLUB',
                  isVisible: isBursaryClubVisible,
                  hasSplitBorder: false,
                  onTap: () => {
                    print('On tap => onOpenBursaryClub'),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
