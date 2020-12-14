import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/agyw_dreams_index_info_event.dart';

class DreamsHTSIndexCardHeader extends StatelessWidget {
  DreamsHTSIndexCardHeader({
    Key key,
    @required this.event,
    @required this.svgIcon,
    @required this.canExpand,
    @required this.canEdit,
    @required this.canView,
    @required this.isExpanded,
    @required this.onEdit,
    @required this.onView,
    this.onToggleCard,
  }) : super(key: key);

  final String svgIcon;
  final bool canExpand;
  final bool canEdit;
  final bool canView;
  final bool isExpanded;
  final Function onEdit;
  final Function onView;
  final AgywDreamsIndexInfoEvent event;

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
                    flex: canEdit && canView ? 9 : 10,
                    child: Container(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Index Information',
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
                        onTap: event == null ? null : onView,
                        child: Container(
                          height: iconHeight,
                          width: iconHeight,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: SvgPicture.asset(
                            'assets/icons/expand_icon.svg',
                            color: Color(0xFF258DCC),
                          ),
                        )),
                  )),
              Visibility(
                  visible: canEdit,
                  child: Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: event == null ? null : onEdit,
                        child: Container(
                          height: iconHeight,
                          width: iconHeight,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: SvgPicture.asset(
                            'assets/icons/edit-icon.svg',
                            color: Color(0xFF258DCC),
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
