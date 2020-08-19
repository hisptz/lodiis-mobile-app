import 'package:flutter/material.dart';
import 'package:kb_mobile_app/pages/login_page/components/login_form.dart';

class LoginFormContainer extends StatelessWidget {
  const LoginFormContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 70),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(32))),
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
                        color: const Color(0xFF387A34),
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        'Please enter your account details in',
                        style: TextStyle(
                            color: const Color(0xFF737373),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text('order to login to the app',
                          style: TextStyle(
                              color: const Color(0xFF737373),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: LoginForm(),
            )
          ],
        ),
      ),
    );
  }
}
