import 'package:flutter/material.dart';

class AddFollowUpConfirmation extends StatelessWidget {
  const AddFollowUpConfirmation({Key key, @required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Visibility(
            visible: name != '',
            child: Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                '$name added successfully',
                style: TextStyle().copyWith(
                    color: Color(0XFF1A3518),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              'Add Another Child?',
              style: TextStyle().copyWith(
                  color: Color(0XFF1A3518),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: FlatButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    'Not Now',
                    style: TextStyle().copyWith(
                        color: Color(0xFF1A3518),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text('Yes',
                      style: TextStyle().copyWith(
                          color: Color(0xFF4B9F46),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
