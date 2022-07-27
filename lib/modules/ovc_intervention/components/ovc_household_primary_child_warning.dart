import 'package:flutter/material.dart';

class OvcHouseholdPrimaryChildWarning extends StatelessWidget {
  const OvcHouseholdPrimaryChildWarning(
      {Key? key, required this.primaryChildExited, this.iconHeight = 20.0})
      : super(key: key);

  final bool primaryChildExited;
  final double iconHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        height: iconHeight,
        width: iconHeight,
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
        child: Icon(
          Icons.warning_amber,
          size: iconHeight,
          color: primaryChildExited ? Colors.amberAccent : Colors.redAccent,
        ),
      ),
    );
  }
}
