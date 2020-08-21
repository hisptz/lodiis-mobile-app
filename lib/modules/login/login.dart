import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/constants/custom_color.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/modules/login/components/login_form_container.dart';
import 'package:kb_mobile_app/modules/login/components/login_top_icon.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    AppUtil.setStatusBarColor(CustomColor.defaultPrimaryColor);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: CustomColor.defaultPrimaryColor),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LoginTopIcon(),
                SizedBox(
                  height: 10,
                ),
                LoginFormContainer(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
