import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';

class OvcHouseHoldCardHeader extends StatelessWidget {
  OvcHouseHoldCardHeader({
    Key key,
    @required this.ovcHouseHold,
    @required this.svgIcon,
    @required this.canEdit,
    @required this.canView,
    @required this.canExpand,
    @required this.isExpanded,
    this.onEdit,
    this.onView,
    this.onToggleCard,
  }) : super(key: key);

  final OvcHouseHold ovcHouseHold;

  final String svgIcon;
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
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    flex: canEdit && canView ? 9 : 10,
                    child: Container(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        ovcHouseHold.houseHoldId,
                        style: TextStyle().copyWith(
                            color: Color(0xFF1A3518),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700),
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
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: SvgPicture.asset(
                            'assets/icons/expand_icon.svg',
                            color: Color(0xFF4B9F46),
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
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: SvgPicture.asset(
                            'assets/icons/edit-icon.svg',
                            color: Color(0xFF4B9F46),
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
                          height: iconHeight * 0.8,
                          width: iconHeight,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
        ),
        LineSeperator(
          color: Color(0xFFECF5EC),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
