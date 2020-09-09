import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DreamBeneficiaryCardHeader extends StatelessWidget {
  const DreamBeneficiaryCardHeader({
    Key key,
    @required this.svgIcon,
    @required this.beneficiaryName,
    @required this.canEdit,
    @required this.canView,
    @required this.canExpand,
    @required this.isExpanded,
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

  final VoidCallback onEdit;
  final VoidCallback onView;
  final VoidCallback onToggleCard;

  @override
  Widget build(BuildContext context) {
    double iconHeight = 20;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
              visible: true,
              child: Expanded(
                flex: 1,
                child: Container(
                  child: Container(
                      height: iconHeight,
                      width: iconHeight,
                      child: SvgPicture.asset(
                        svgIcon,
                      )),
                ),
              )),
          Visibility(
              visible: true,
              child: Expanded(
                flex: canEdit && canView ? 9 : 11,
                child: Container(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    beneficiaryName,
                    style: TextStyle().copyWith(
                        color: Color(0xFF05131B),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          Visibility(
              visible: canView,
              child: Expanded(
                flex: 1,
                child: InkWell(
                    onTap: onView,
                    child: Container(
                      height: iconHeight,
                      width: iconHeight,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: SvgPicture.asset(
                        'assets/icons/expand_icon.svg',
                        color: Color(0xFF1F8ECE),
                      ),
                    )),
              )),
          Visibility(
              visible: canEdit,
              child: Expanded(
                flex: 1,
                child: InkWell(
                    onTap: onEdit,
                    child: Container(
                      height: iconHeight,
                      width: iconHeight,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: SvgPicture.asset(
                        'assets/icons/edit-icon.svg',
                        color: Color(0xFF1F8ECE),
                      ),
                    )),
              )),
          Visibility(
              visible: canExpand,
              child: Expanded(
                flex: 1,
                child: InkWell(
                    onTap: onToggleCard,
                    child: Container(
                      height: iconHeight,
                      width: iconHeight,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: SvgPicture.asset(
                        isExpanded
                            ? 'assets/icons/chevron_up.svg'
                            : 'assets/icons/chevron_down.svg',
                        color: Color(0xFF05131B),
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}
