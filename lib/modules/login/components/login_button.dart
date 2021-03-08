import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key key,
      @required this.isLoginProcessActive,
      this.onLogin,
      @required this.currentLanguage})
      : super(key: key);

  final bool isLoginProcessActive;
  final VoidCallback onLogin;
  final String currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 20),
        child: TextButton(
          onPressed: isLoginProcessActive ? null : onLogin,
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            backgroundColor: Color(0xFF4B9F46),
          ),
          child: isLoginProcessActive
              ? Container(
                  height: 21.0,
                  width: 21.0,
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
        ));
  }
}
