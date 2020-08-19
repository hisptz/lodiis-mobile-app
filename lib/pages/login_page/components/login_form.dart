import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/pages/login_page/components/login_form_field_seperator.dart';
import 'package:kb_mobile_app/pages/login_page/constants/login_style.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  String activeInput = '';
  bool isLoginProcessActive = false;

  void updateInputActiveStatus(String activeField) {
    setState(() {
      activeInput = activeField;
    });
  }

  void onFieldValueChanges(String value, String key) {
    print('$value - $key');
  }

  void onFieldSubmitted(String value, String key) {
    print('$value - $key');
    updateInputActiveStatus('');
  }

  void onLogin() {
    FocusScope.of(context).unfocus();
    updateInputActiveStatus('');
    if (!isLoginProcessActive) {
      print('Login process');
      isLoginProcessActive = !isLoginProcessActive;
      Timer(Duration(seconds: 3), () {
        setState(() {
          isLoginProcessActive = !isLoginProcessActive;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color activeInputColor = Color(0xFF4B9F46);
    Color inActiveInputColor = Color(0xFFD2E7D1);

    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: [
              Text(
                'Username',
                style: LoginPageStyles.formLableStyle,
              )
            ],
          ),
        ),
        Container(
          child: TextFormField(
            onTap: () => updateInputActiveStatus('username'),
            onChanged: (value) => onFieldValueChanges(value, 'username'),
            onFieldSubmitted: (value) => onFieldSubmitted(value, 'username'),
            readOnly: isLoginProcessActive,
            autocorrect: false,
            style: LoginPageStyles.formInputValueStyle,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        LoginFormFieldSeperator(
          color:
              activeInput == 'username' ? activeInputColor : inActiveInputColor,
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              Text(
                'Password',
                style: LoginPageStyles.formLableStyle,
              )
            ],
          ),
        ),
        Container(
          child: TextFormField(
            onTap: () => updateInputActiveStatus('password'),
            onChanged: (value) => onFieldValueChanges(value, 'password'),
            onFieldSubmitted: (value) => onFieldSubmitted(value, 'password'),
            obscureText: true,
            autocorrect: false,
            style: LoginPageStyles.formInputValueStyle,
            readOnly: isLoginProcessActive,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        LoginFormFieldSeperator(
          color:
              activeInput == 'password' ? activeInputColor : inActiveInputColor,
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 20),
            child: FlatButton(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: isLoginProcessActive ? null : onLogin,
              color: Color(0xFF4B9F46),
              splashColor: Color(0xFFB3EFA0),
              disabledColor: Color(0xFF4B9F46),
              child: isLoginProcessActive
                  ? Container(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation(Colors.white),
                        strokeWidth: 2,
                      ),
                    )
                  : Text('Login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFAFAFA),
                      )),
            ))
      ],
    ));
  }
}
