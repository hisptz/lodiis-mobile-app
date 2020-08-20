import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/components/form_field_input_icon.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/modules/intervention_selection/intervention_selection_page.dart';
import 'package:kb_mobile_app/modules/login/components/login_button.dart';
import 'package:kb_mobile_app/modules/login/components/login_form_field_seperator.dart';
import 'package:kb_mobile_app/modules/login/constants/login_style.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
// Adding mechanism for updating status of button if all fields has been set

  String activeInput = '';
  bool isLoginProcessActive = false;
  bool isPasswordVisible = false;

  CurrentUser currentUser =
      new CurrentUser(username: 'chingalo', password: 'chingalo');

  void updateInputActiveStatus(String activeField) {
    setState(() {
      activeInput = activeField;
    });
  }

  void updatePasswordVisibilityStatus() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void onFieldValueChanges(String value, String key) {
    currentUser.username = key == 'username' ? value : currentUser.username;
    currentUser.password = key == 'password' ? value : currentUser.password;
  }

  void onFieldSubmitted(String value, String key) {
    onFieldValueChanges(value, key);
    updateInputActiveStatus('');
  }

  void onLogin() {
    bool status = currentUser.isCUrrentUserSet();
    FocusScope.of(context).unfocus();
    updateInputActiveStatus('');
    if (!isLoginProcessActive && status) {
      // @TODO impelement actual login process
      isLoginProcessActive = !isLoginProcessActive;
      Timer(Duration(seconds: 2), () {
        setState(() {
          isLoginProcessActive = !isLoginProcessActive;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => InterventionSelectionPage()));
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
              controller: new TextEditingController(text: currentUser.username),
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
                    svgIcon: 'assets/icons/login-user-input.svg',
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
            controller: new TextEditingController(text: currentUser.password),
            onTap: () => updateInputActiveStatus('password'),
            onChanged: (value) => onFieldValueChanges(value, 'password'),
            onFieldSubmitted: (value) => onFieldSubmitted(value, 'password'),
            obscureText: !isPasswordVisible,
            autocorrect: false,
            style: LoginPageStyles.formInputValueStyle,
            readOnly: isLoginProcessActive,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 15),
                border: InputBorder.none,
                prefixIcon: FormFieldInputIcon(
                  backGroundColor: Color(0xFFEDF5EC),
                  svgIcon: 'assets/icons/login-lock.svg',
                ),
                prefixIconConstraints: LoginPageStyles.loginBoxConstraints,
                suffixIcon: GestureDetector(
                  onTap: updatePasswordVisibilityStatus,
                  child: FormFieldInputIcon(
                    backGroundColor: Color(0xFFFFFFFF),
                    svgIcon: isPasswordVisible
                        ? 'assets/icons/login-close-eye.svg'
                        : 'assets/icons/login-open-eye.svg', // show and hide password icon
                  ),
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
