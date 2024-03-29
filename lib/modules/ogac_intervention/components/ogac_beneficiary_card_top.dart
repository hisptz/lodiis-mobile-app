import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/components/beneficiary_sync_status_indicator.dart';
import 'package:kb_mobile_app/models/ogac_beneficiary.dart';
import 'package:provider/provider.dart';

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
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 15.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              ogacBeneficiary.toString(),
              style: const TextStyle().copyWith(
                color: const Color(0xFF651900),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Consumer<SynchronizationStatusState>(
              builder: (context, synchronizationStatusState, child) {
            List<String> unsyncedTeiReferences =
                synchronizationStatusState.unsyncedTeiReferences;
            bool isSynced = !unsyncedTeiReferences.contains(ogacBeneficiary.id);
            return BeneficiarySyncStatusIndicator(
              iconHeight: iconHeight,
              isSynced: isSynced,
            );
          }),
          InkWell(
            onTap: onViewBeneficiary,
            child: Container(
              height: iconHeight,
              width: iconHeight,
              margin: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 5.0,
              ),
              child: SvgPicture.asset(
                'assets/icons/expand_icon.svg',
                colorFilter: const ColorFilter.mode(
                  Color(0xFFF05A2A),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Visibility(
            visible: ogacBeneficiary.enrollmentOuAccessible!,
            child: InkWell(
              onTap: onEditBeneficiary,
              child: Container(
                height: iconHeight,
                width: iconHeight,
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 5.0,
                ),
                child: SvgPicture.asset(
                  'assets/icons/edit-icon.svg',
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFF05A2A),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
