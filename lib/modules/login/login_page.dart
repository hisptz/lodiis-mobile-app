import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/constants/custom_color.dart';
import 'package:kb_mobile_app/modules/login/components/login_form_container.dart';
import 'package:kb_mobile_app/modules/login/components/login_top_icon.dart';

class LoginPage extends StatelessWidget {
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
