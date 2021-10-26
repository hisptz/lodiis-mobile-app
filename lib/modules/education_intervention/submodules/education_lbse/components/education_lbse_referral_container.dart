import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/components/education_lbse_referral_body.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/components/education_lbse_referral_header.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/components/education_lbse_referral_outcome_container.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_event.dart';

class EducationLbseReferralContainer extends StatelessWidget {
  const EducationLbseReferralContainer({
    Key? key,
    required this.referralIndex,
    required this.lbseReferral,
    this.onView,
    this.onEdit,
  }) : super(key: key);

  final int referralIndex;
  final LbseReferralEvent lbseReferral;

  final VoidCallback? onView;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15.0,
      ),
      child: MaterialCard(
        body: Container(
          child: Column(
            children: [
              Container(
                child: EducationLbseReferralHeader(
                  referralIndex: referralIndex,
                  onEdit: onEdit,
                  onView: onView,
                ),
              ),
              Container(
                child: EducationLbseReferralBody(
                  lbseReferral: lbseReferral,
                ),
              ),
              Container(
                child: EducationLbseReferralOutComeContainer(
                  lbseReferral: lbseReferral,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
