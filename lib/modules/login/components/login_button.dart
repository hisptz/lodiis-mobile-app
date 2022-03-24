import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.isLoginProcessActive,
    this.onLogin,
    required this.currentLanguage,
  }) : super(key: key);

  final bool isLoginProcessActive;
  final VoidCallback? onLogin;
  final String? currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        top: 20.0,
      ),
      child: TextButton(
        onPressed: isLoginProcessActive ? null : onLogin,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: const Color(0xFF4B9F46),
        ),
        child: isLoginProcessActive
            ? const SizedBox(
                height: 21.0,
                width: 21.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 2.0,
                ),
              )
            : const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFAFAFA),
                ),
              ),
      ),
    );
  }
}
