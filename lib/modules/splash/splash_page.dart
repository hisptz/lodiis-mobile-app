import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/constants/custom_color.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';

import 'package:kb_mobile_app/modules/intervention_selection/intervention_selection_page.dart';
import 'package:kb_mobile_app/modules/login/login_page.dart';
import 'package:kb_mobile_app/modules/splash/components/splash_implementer_list.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    AppUtil.setStatusBarColor(CustomColor.defaultPrimaryColor);
  }

  void setLandingPage(bool isUserLoginIn) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => isUserLoginIn
                    ? InterventionSelectionPage()
                    : LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    // @TODO handling all user realoaction if user has been login in or not
    this.setLandingPage(false);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(children: [
      Container(
        decoration: BoxDecoration(color: CustomColor.defaultPrimaryColor),
        height: size.height * 0.83,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: new AlwaysStoppedAnimation(
                        CustomColor.defaultSecondaryColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      SplashImplementingPartnerList(),
    ]));
  }
}
