import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_beneficiary_card_action_buttons.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_beneficiary_card_top.dart';
import 'package:provider/provider.dart';

class PpPrevBeneficiaryCard extends StatelessWidget {
  const PpPrevBeneficiaryCard({
    Key? key,
    required this.ppPrevBeneficiary,
    this.onViewBeneficiary,
    this.onEditBeneficiary,
    this.onOpenBeneficiaryServices,
    this.onOpenBeneficiaryReferrals,
    this.onOpenBeneficiaryGenderNorms,
  }) : super(key: key);

  final PpPrevBeneficiary ppPrevBeneficiary;
  final VoidCallback? onViewBeneficiary;
  final VoidCallback? onEditBeneficiary;
  final VoidCallback? onOpenBeneficiaryServices;
  final VoidCallback? onOpenBeneficiaryReferrals;
  final VoidCallback? onOpenBeneficiaryGenderNorms;

  bool _syncStatusOfPpPrev(
    PpPrevBeneficiary ppPrevBeneficiary,
    List<String> unsyncedTeiReferences,
  ) {
    int teiIndex = unsyncedTeiReferences.indexOf(ppPrevBeneficiary.id!);
    return teiIndex == -1;
  }

  @override
  Widget build(BuildContext context) {
    double iconHeight = 20.0;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 15.0,
      ),
      child: MaterialCard(
        body: Consumer<SynchronizationStatusState>(
            builder: (context, synchronizationStatusState, child) {
          List<String> unsyncedTeiReferences =
              synchronizationStatusState.unsyncedTeiReferences;

          return Column(
            children: [
              PpPrevBeneficiaryCardTop(
                ppPrevBeneficiary: ppPrevBeneficiary,
                onViewBeneficiary: onViewBeneficiary,
                iconHeight: iconHeight,
                isSynced: _syncStatusOfPpPrev(
                  ppPrevBeneficiary,
                  unsyncedTeiReferences,
                ),
                onEditBeneficiary: onEditBeneficiary,
              ),
              LineSeparator(
                color: const Color(0xFF9B2BAE).withOpacity(0.4),
              ),
              PpPrevBeneficiaryCardBody(
                ppPrevBeneficiary: ppPrevBeneficiary,
              ),
              Column(
                children: [
                  LineSeparator(
                    color: const Color(0xFF9B2BAE).withOpacity(0.4),
                  ),
                  PpPrevBeneficiaryCardActionButtons(
                    ppPrevBeneficiary: ppPrevBeneficiary,
                    onOpenServiceForm: onOpenBeneficiaryServices,
                    onOpenReferralForm: onOpenBeneficiaryReferrals,
                    onOpenGenderNormsForm: onOpenBeneficiaryGenderNorms,
                  )
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
