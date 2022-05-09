import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormFieldInputIcon extends StatelessWidget {
  const FormFieldInputIcon({
    Key? key,
    this.svgIcon,
    this.backGroundColor,
  }) : super(key: key);

  final String? svgIcon;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 5, top: 5),
        child: Container(
          decoration: BoxDecoration(
              color: backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(7))),
          child: Container(
            margin: const EdgeInsets.all(9),
            child: SvgPicture.asset(
              svgIcon!,
            ),
          ),
        ));
  }
}
