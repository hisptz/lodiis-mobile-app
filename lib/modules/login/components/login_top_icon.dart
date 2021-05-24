import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginTopIcon extends StatelessWidget {
  final double height = 5.0;
  final double width = 50.0;
  final double iconSize = 60.0;
  final appLabel = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: size.height * 0.1,
            bottom: appLabel == "" ? 0.0 : 15.0,
          ),
          child: Text(
            appLabel,
            style: TextStyle().copyWith(
              color: Color(0xFFFAFAFA),
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          width: iconSize,
          height: iconSize,
          child: SvgPicture.asset(
            'assets/icons/login-top-user.svg',
            fit: BoxFit.contain,
            color: const Color(0xFFB3EFA0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          margin: EdgeInsets.only(
            top: 5.0,
          ),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: const Color(0xFF78B774),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 2.0,
          ),
          height: height,
          width: width * 1.5,
          decoration: BoxDecoration(
            color: const Color(0xFF9AC197),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 2.0,
          ),
          height: height,
          width: width * 2.0,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        )
      ],
    );
  }
}
