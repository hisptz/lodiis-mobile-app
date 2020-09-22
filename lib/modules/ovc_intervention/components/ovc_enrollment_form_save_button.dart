import 'package:flutter/material.dart';

class OvcEnrollmentFormSaveButton extends StatelessWidget {
  const OvcEnrollmentFormSaveButton(
      {Key key,
      @required this.label,
      @required this.labelColor,
      @required this.buttonColor,
      this.fontSize = 15.0,
      this.onPressButton})
      : super(key: key);

  final String label;
  final Color labelColor;
  final double fontSize;
  final Color buttonColor;
  final Function onPressButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 20.0, right: 20.0),
      child: Container(
          width: double.infinity,
          child: FlatButton(
              color: buttonColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: buttonColor),
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: onPressButton,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
                  child: Text(
                    label,
                    style: TextStyle().copyWith(
                        color: labelColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w700),
                  )))),
    );
  }
}
