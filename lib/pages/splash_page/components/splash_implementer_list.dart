import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/constants/custom_dimension.dart';

class SplashImplementingPartnerList extends StatelessWidget {
  const SplashImplementingPartnerList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          padding: EdgeInsets.only(top: CustomDimension.defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset('images/logos/usaid.svg'),
              SvgPicture.asset('images/logos/usaid.svg'),
              SvgPicture.asset('images/logos/kb.svg')
            ],
          )),
    );
  }
}
