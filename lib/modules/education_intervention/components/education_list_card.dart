import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';

class EducationListCard extends StatelessWidget {
  const EducationListCard({
    Key? key,
    required this.title,
    required this.date,
    required this.canEdit,
    this.onView,
    this.onEdit,
  }) : super(key: key);

  final String title;
  final String date;
  final bool canEdit;
  final VoidCallback? onView;
  final VoidCallback? onEdit;

  final String editSvgIcon = 'assets/icons/edit-icon.svg';
  final String viewSvgIcon = 'assets/icons/expand_icon.svg';

  Container _getListActionButton({
    VoidCallback? onTap,
    required String svgIcon,
  }) {
    double iconHeight = 20;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: iconHeight,
          width: iconHeight,
          margin: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 5.0,
          ),
          child: SvgPicture.asset(
            svgIcon,
            color: const Color(0xFF009688),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: MaterialCard(
        body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: '$date   ',
                        style: const TextStyle().copyWith(
                          color: const Color(0xFF82898D),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: title,
                            style: const TextStyle().copyWith(
                              color: const Color(0xFF05131B),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  _getListActionButton(
                    onTap: onView,
                    svgIcon: viewSvgIcon,
                  ),
                  Visibility(
                    visible: canEdit,
                    child: _getListActionButton(
                      onTap: onEdit,
                      svgIcon: editSvgIcon,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
