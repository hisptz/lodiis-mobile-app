import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_beneficiary_card_top.dart';

class PpPrevBeneficiaryCard extends StatelessWidget {
  const PpPrevBeneficiaryCard({
    Key? key,
    required this.ppPrevBeneficiary,
    this.onViewBeneficiary,
    this.onEditBeneficiary,
    this.onOpenBeneficiaryServices,
  }) : super(key: key);

  final PpPrevBeneficiary ppPrevBeneficiary;
  final VoidCallback? onViewBeneficiary;
  final VoidCallback? onEditBeneficiary;
  final VoidCallback? onOpenBeneficiaryServices;

  @override
  Widget build(BuildContext context) {
    double iconHeight = 20.0;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 15.0,
      ),
      child: MaterialCard(
        body: Container(
          child: Column(
            children: [
              PpPrevBeneficiaryCardTop(
                ppPrevBeneficiary: ppPrevBeneficiary,
                onViewBeneficiary: onViewBeneficiary,
                iconHeight: iconHeight,
                onEditBeneficiary: onEditBeneficiary,
              ),
              Container(
                child: LineSeparator(
                  color: Color(0xFF9B2BAE).withOpacity(0.4),
                ),
              ),
              PpPrevBeneficiaryCardBody(
                ppPrevBeneficiary: ppPrevBeneficiary,
              ),
              Container(
                child: Column(
                  children: [
                    LineSeparator(
                      color: Color(0xFF9B2BAE).withOpacity(0.4),
                    ),
                    Container(
                      child: MaterialButton(
                        onPressed: onOpenBeneficiaryServices,
                        child: Text(
                          'Services',
                          style: TextStyle().copyWith(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF9B2BAE),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
