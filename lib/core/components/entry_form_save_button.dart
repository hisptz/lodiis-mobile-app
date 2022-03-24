import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EntryFormSaveButton extends StatelessWidget {
  const EntryFormSaveButton(
      {Key? key,
      this.width = double.infinity,
      required this.label,
      required this.labelColor,
      required this.buttonColor,
      this.marginLeft = 65.0,
      this.marginRight = 64.0,
      this.fontSize = 15.0,
      this.horizontal = 10.0,
      this.vertical = 15.0,
      this.borderColor,
      this.onPressButton,
      this.svgIconPath,
      this.svgIconHeight = 20.0,
      this.svgIconWidth = 20.0})
      : super(key: key);

  final String label;
  final Color labelColor;
  final double fontSize;
  final Color? buttonColor;
  final Function? onPressButton;
  final double width;
  final double marginLeft;
  final double marginRight;
  final double vertical;
  final double horizontal;
  final Color? borderColor;
  final String? svgIconPath;
  final double svgIconHeight;
  final double svgIconWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20.0,
        bottom: 10.0,
        left: marginLeft,
        right: marginRight,
      ),
      child: SizedBox(
        width: width,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor == null ? buttonColor! : borderColor!,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: onPressButton as void Function()?,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: vertical,
              horizontal: horizontal,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: svgIconPath != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(label,
                                  style: const TextStyle().copyWith(
                                    color: labelColor,
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.w700,
                                  )),
                              Container(
                                height: svgIconHeight,
                                width: svgIconWidth,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                ),
                                child: SvgPicture.asset(
                                  svgIconPath!,
                                  color: labelColor,
                                ),
                              )
                            ],
                          )
                        : Text(
                            label,
                            style: const TextStyle().copyWith(
                              color: labelColor,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
