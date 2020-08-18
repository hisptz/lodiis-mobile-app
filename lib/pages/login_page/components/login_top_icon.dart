import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginTopIcon extends StatelessWidget {
  final double height = 5.0;
  final double width = 50;

  final double iconSize = 53;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: iconSize,
          height: iconSize,
          margin: EdgeInsets.only(top: size.height * 0.1),
          child: SvgPicture.asset(
            'images/icons/login-top-user.svg',
            fit: BoxFit.contain,
            color: const Color(0xFFB3EFA0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: const Color(0xFF78B774),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        Container(
          margin: EdgeInsets.only(top: 2),
          height: height,
          width: width * 1.8,
          decoration: BoxDecoration(
              color: const Color(0xFF9AC197),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        Container(
          margin: EdgeInsets.only(top: 2),
          height: height,
          width: width * 2.5,
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        )
      ],
    );
  }
}
