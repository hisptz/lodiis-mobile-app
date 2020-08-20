import 'package:flutter/material.dart';

class RoutePageNotFound extends StatelessWidget {
  RoutePageNotFound({Key key, this.pageTitle, this.color}) : super(key: key);

  final String pageTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: color ?? Colors.white,
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pageTitle,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )),
    ));
  }
}
