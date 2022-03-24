import 'package:flutter/material.dart';

class RoutePageNotFound extends StatelessWidget {
  const RoutePageNotFound({Key? key, this.pageTitle, this.color})
      : super(key: key);

  final String? pageTitle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          pageTitle!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
