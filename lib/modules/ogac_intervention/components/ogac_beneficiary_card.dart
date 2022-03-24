import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/ogac_beneficiary.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/components/ogac_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/components/ogac_beneficiary_card_top.dart';

class OgacBeneficiaryCard extends StatelessWidget {
  const OgacBeneficiaryCard({
    Key? key,
    required this.ogacBeneficiary,
    this.onViewBeneficiary,
    this.onEditBeneficiary,
  }) : super(key: key);

  final OgacBeneficiary ogacBeneficiary;
  final VoidCallback? onViewBeneficiary;
  final VoidCallback? onEditBeneficiary;

  @override
  Widget build(BuildContext context) {
    double iconHeight = 20.0;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 15.0,
      ),
      child: MaterialCard(
        body: Column(
          children: [
            OgacBeneficiaryCardTop(
              ogacBeneficiary: ogacBeneficiary,
              onViewBeneficiary: onViewBeneficiary,
              iconHeight: iconHeight,
              onEditBeneficiary: onEditBeneficiary,
            ),
            LineSeparator(
              color: const Color(0xFFF05A2A).withOpacity(0.4),
            ),
            OgacBeneficiaryCardBody(
              ogacBeneficiary: ogacBeneficiary,
            )
          ],
        ),
      ),
    );
  }
}
