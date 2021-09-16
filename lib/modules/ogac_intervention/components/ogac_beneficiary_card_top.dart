import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/core/components/beneficiary_sync_status_indicator.dart';
import 'package:kb_mobile_app/models/ogac_beneficiary.dart';

class OgacBeneficiaryCardTop extends StatelessWidget {
  const OgacBeneficiaryCardTop({
    Key? key,
    required this.ogacBeneficiary,
    required this.onViewBeneficiary,
    required this.iconHeight,
    required this.onEditBeneficiary,
  }) : super(key: key);

  final OgacBeneficiary ogacBeneficiary;
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
              ogacBeneficiary.toString(),
              style: TextStyle().copyWith(
                color: Color(0xFF651900),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BeneficiarySyncStatusIndicator(
            iconHeight: iconHeight,
            isSynced: ogacBeneficiary.isSynced!,
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
                  color: Color(0xFFF05A2A),
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
                  color: Color(0xFFF05A2A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
