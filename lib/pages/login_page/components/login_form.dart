import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/components/form_field_input_icon.dart';
import 'package:kb_mobile_app/pages/login_page/components/login_button.dart';
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
                  prefixIcon: FormFieldInputIcon(
                    backGroundColor: Color(0xFFEDF5EC),
                    svgIcon: 'images/icons/login-user-input.svg',
                  ),
                  prefixIconConstraints: LoginPageStyles.loginBoxConstraints)),
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
                prefixIcon: FormFieldInputIcon(
                  backGroundColor: Color(0xFFEDF5EC),
                  svgIcon: 'images/icons/login-lock.svg',
                ),
                prefixIconConstraints: LoginPageStyles.loginBoxConstraints,
                suffixIcon: FormFieldInputIcon(
                  backGroundColor: Color(0xFFFFFFFF),
                  svgIcon: 'images/icons/login-open-eye.svg',
                ),
                suffixIconConstraints: LoginPageStyles.loginBoxConstraints),
          ),
        ),
        LoginFormFieldSeperator(
          color:
              activeInput == 'password' ? activeInputColor : inActiveInputColor,
        ),
        LoginButton(
          isLoginProcessActive: isLoginProcessActive,
          onLogin: onLogin,
        )
      ],
    ));
  }
}
