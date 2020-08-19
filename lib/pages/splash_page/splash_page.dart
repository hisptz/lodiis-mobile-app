import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/constants/custom_color.dart';

import 'package:kb_mobile_app/pages/intervention_selection_page/intervention_selection_page.dart';
import 'package:kb_mobile_app/pages/login_page/login_page.dart';
import 'package:kb_mobile_app/pages/splash_page/components/splash_implementer_list.dart';

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
  }

  void setLandingPgae(bool isUserLoginIn) {
    Timer(
        Duration(seconds: 5),
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
    this.setLandingPgae(false);

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
