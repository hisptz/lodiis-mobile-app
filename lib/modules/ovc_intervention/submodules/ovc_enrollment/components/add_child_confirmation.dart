import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';

class AddChildConfirmation extends StatelessWidget {
  const AddChildConfirmation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Container(
            child: Text(
              'Add Another Child?',
              style: TextStyle().copyWith(
                  color: Color(0XFF1A3518),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Row(
            children: [
              Container(
                child: FlatButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text('Yes'),
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('Not Now'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
