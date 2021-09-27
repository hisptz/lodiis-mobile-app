import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/core/components/beneficiary_sync_status_indicator.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';

class PpPrevBeneficiaryCardTop extends StatelessWidget {
  const PpPrevBeneficiaryCardTop({
    Key? key,
    required this.ppPrevBeneficiary,
    required this.onViewBeneficiary,
    required this.iconHeight,
    required this.onEditBeneficiary,
  }) : super(key: key);

  final PpPrevBeneficiary ppPrevBeneficiary;
  final VoidCallback? onViewBeneficiary;
  final double iconHeight;
  final VoidCallback? onEditBeneficiary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 15.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              ppPrevBeneficiary.toString(),
              style: TextStyle().copyWith(
                color: Color(0xFF9B2BAE),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BeneficiarySyncStatusIndicator(
            iconHeight: iconHeight,
            isSynced: ppPrevBeneficiary.isSynced!,
          ),
          Container(
            child: InkWell(
              onTap: onViewBeneficiary,
              child: Container(
                height: iconHeight,
                width: iconHeight,
                margin: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 5.0,
                ),
                child: SvgPicture.asset(
                  'assets/icons/expand_icon.svg',
                  color: Color(0xFF9B2BAE),
                ),
              ),
            ),
          ),
          Container(
            child: InkWell(
              onTap: onEditBeneficiary,
              child: Container(
                height: iconHeight,
                width: iconHeight,
                margin: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 5.0,
                ),
                child: SvgPicture.asset(
                  'assets/icons/edit-icon.svg',
                  color: Color(0xFF9B2BAE),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
