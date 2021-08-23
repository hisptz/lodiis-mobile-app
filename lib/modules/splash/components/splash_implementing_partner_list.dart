import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/core/constants/custom_dimension.dart';

class SplashImplementingPartnerList extends StatelessWidget {
  const SplashImplementingPartnerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          color: Color(0xFFFFFFFF),
          padding: EdgeInsets.only(top: CustomDimension.defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                height: 40,
                child: Image(image: AssetImage('assets/logos/usaid.png')),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                height: 50,
                child: Image(image: AssetImage('assets/logos/perpfar.png')),
              ),
              SvgPicture.asset('assets/logos/kb.svg'),
              SvgPicture.asset('assets/logos/hisptz.svg'),
            ],
          )),
    );
  }
}
