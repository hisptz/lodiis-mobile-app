import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/beneficiary_sync_status_indicator.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';

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
    this.isActive = true,
    this.onEdit,
    this.onView,
    this.onToggleCard,
  }) : super(key: key);

  final String svgIcon;
  final String beneficiaryName;
  final bool canEdit;
  final bool canView;
  final bool canExpand;
  final bool isExpanded;
  final bool isActive;
  final bool isSynced;

  final VoidCallback? onEdit;
  final VoidCallback? onView;
  final VoidCallback? onToggleCard;

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
                    child: SvgPicture.asset(
                      svgIcon,
                    ),
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
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 5.0,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFFF0F8FE)
                        : const Color(0xFFFFF5F5),
                    border: Border.all(
                      color: isActive
                          ? const Color(0xFF1F8DCE)
                          : const Color(0xFFC81314),
                    ),
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 2.0,
                  ),
                  child: Text(
                    isActive ? 'Active' : 'Inactive',
                    style: const TextStyle().copyWith(
                      color: isActive
                          ? const Color(0xFF1F8DCE)
                          : const Color(0xFFC81314),
                      fontSize: 12.0,
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
