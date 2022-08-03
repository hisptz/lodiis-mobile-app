import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/beneficiary_sync_status_indicator.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/constants/program_status.dart';

class DreamsBeneficiaryCardHeader extends StatelessWidget {
  const DreamsBeneficiaryCardHeader({
    Key? key,
    required this.svgIcon,
    required this.beneficiaryName,
    required this.canEdit,
    required this.canView,
    required this.canExpand,
    required this.isExpanded,
    required this.isSynced,
    required this.isAgeBeyondAverage,
    required this.programStatus,
    this.isActive = true,
    this.onEdit,
    this.onView,
    this.onToggleCard,
    this.onOpenStatus,
  }) : super(key: key);

  final String svgIcon;
  final String beneficiaryName;
  final bool canEdit;
  final bool canView;
  final bool canExpand;
  final bool isExpanded;
  final bool isActive;
  final bool isSynced;
  final bool isAgeBeyondAverage;
  final String programStatus;

  final VoidCallback? onEdit;
  final VoidCallback? onView;
  final VoidCallback? onToggleCard;
  final VoidCallback? onOpenStatus;

  @override
  Widget build(BuildContext context) {
    double iconHeight = 25;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: true,
                child: Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: SvgPicture.asset(svgIcon,
                        color: isAgeBeyondAverage ? Colors.redAccent : null),
                  ),
                ),
              ),
              Visibility(
                visible: true,
                child: Expanded(
                  flex: canEdit && canView
                      ? 7
                      : canView
                          ? 8
                          : 10,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                    ),
                    child: Text(
                      beneficiaryName,
                      style: const TextStyle().copyWith(
                          color: const Color(0xFF05131B),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              BeneficiarySyncStatusIndicator(
                isSynced: isSynced,
              ),
              Visibility(
                visible: programStatus.isNotEmpty,
                child: InkWell(
                  borderRadius: BorderRadius.circular(35.0),
                  onTap: () => programStatus == ProgramStatus.inActive
                      ? onOpenStatus!()
                      : null,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                    decoration: BoxDecoration(
                      color: (programStatus == ProgramStatus.active
                              ? const Color(0xFF1F8DCE)
                              : programStatus == ProgramStatus.inActive
                                  ? Colors.amberAccent
                                  : programStatus == ProgramStatus.dropOut
                                      ? Colors.redAccent
                                      : Colors.blueGrey)
                          .withOpacity(0.2),
                      border: Border.all(
                        color: programStatus == ProgramStatus.active
                            ? const Color(0xFF1F8DCE)
                            : programStatus == ProgramStatus.inActive
                                ? Colors.amberAccent
                                : programStatus == ProgramStatus.dropOut
                                    ? Colors.redAccent
                                    : Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 2.0,
                    ),
                    child: Text(
                      programStatus,
                      style: const TextStyle().copyWith(
                        color: programStatus == ProgramStatus.active
                            ? const Color(0xFF1F8DCE)
                            : programStatus == ProgramStatus.inActive
                                ? Colors.amberAccent.shade700
                                : programStatus == ProgramStatus.dropOut
                                    ? Colors.redAccent
                                    : Colors.blueGrey,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: canView,
                child: Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: onView,
                    child: Container(
                      height: iconHeight,
                      width: iconHeight,
                      margin: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 5.0,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/expand_icon.svg',
                        color: const Color(0xFF1F8ECE),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: canEdit,
                child: Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: onEdit,
                    child: Container(
                      height: iconHeight,
                      width: iconHeight,
                      margin: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 5.0,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/edit-icon.svg',
                        color: const Color(0xFF1F8ECE),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: canExpand,
                child: Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: onToggleCard,
                    child: Container(
                      height: iconHeight,
                      width: iconHeight,
                      margin: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 5.0,
                      ),
                      child: SvgPicture.asset(
                        isExpanded
                            ? 'assets/icons/chevron_up.svg'
                            : 'assets/icons/chevron_down.svg',
                        color: const Color(0xFF05131B),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const LineSeparator(
          color: Color(0xFFE9F4FA),
        ),
      ],
    );
  }
}
