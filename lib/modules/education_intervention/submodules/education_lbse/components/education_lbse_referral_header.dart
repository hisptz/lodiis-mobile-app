import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EducationLbseReferralHeader extends StatelessWidget {
  const EducationLbseReferralHeader({
    Key? key,
    required this.referralIndex,
    this.canEdit = true,
    this.onView,
    this.onEdit,
  }) : super(key: key);

  // @TODO hide edit button based on filling outcomes
  final int referralIndex;
  final bool canEdit;

  final VoidCallback? onView;
  final VoidCallback? onEdit;

  Container _getActionButton({
    required String svgIcon,
    required VoidCallback? onTap,
  }) {
    double iconHeight = 20.0;
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: iconHeight,
          width: iconHeight,
          margin: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 5.0,
          ),
          child: SvgPicture.asset(
            svgIcon,
            color: Color(0xFF009688),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Referral $referralIndex"),
                  ),
                  Container(
                    child: _getActionButton(
                      svgIcon: 'assets/icons/expand_icon.svg',
                      onTap: onView,
                    ),
                  ),
                  Container(
                    child: Visibility(
                      visible: canEdit,
                      child: _getActionButton(
                        svgIcon: 'assets/icons/edit-icon.svg',
                        onTap: onEdit,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
