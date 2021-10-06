import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/login_form_state/login_form_state.dart';
import 'package:kb_mobile_app/modules/login/components/login_form.dart';
import 'package:provider/provider.dart';

class LoginFormContainer extends StatelessWidget {
  const LoginFormContainer({
    Key? key,
    required this.currentLanguage,
    required this.appLabel,
  }) : super(key: key);

  final String? currentLanguage;
  final String appLabel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      width: size.width * 0.8,
      child: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF387A34),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        'Please enter your account details in order to login to the app',
                        style: TextStyle(
                          color: Color(0xFF737373),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: LoginForm(
                currentLanguage: currentLanguage,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Consumer<LoginFormState>(builder: (context, loginFormState, child) {
              return Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          loginFormState.currentLoginProcessMessage,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF737373),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
            Container(
              child: Visibility(
                visible: appLabel != "",
                child: Text(
                  "NB : This is $appLabel",
                  style: TextStyle().copyWith(
                    color: Colors.redAccent,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
