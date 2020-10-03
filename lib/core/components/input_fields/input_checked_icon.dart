import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputCheckedIcon extends StatelessWidget {
  const InputCheckedIcon({Key key, @required this.showTickedIcon, this.color})
      : super(key: key);

  final bool showTickedIcon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !showTickedIcon
          ? Container()
          : Container(
              height: 20.0,
              margin: EdgeInsets.only(left: 10),
              child: SvgPicture.asset(
                'assets/icons/checked-icon.svg',
                color: color ?? Colors.black,
              ),
            ),
    );
  }
}
