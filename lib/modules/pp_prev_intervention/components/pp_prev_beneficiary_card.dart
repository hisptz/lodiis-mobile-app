import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';
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
  }) : super(key: key);

  final PpPrevBeneficiary ppPrevBeneficiary;
  final VoidCallback? onViewBeneficiary;
  final VoidCallback? onEditBeneficiary;
  final VoidCallback? onOpenBeneficiaryServices;

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
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 15.0,
      ),
      child: MaterialCard(
        body: Container(
          child: Consumer<SynchronizationStatusState>(
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
            );
          }),
        ),
      ),
    );
  }
}
