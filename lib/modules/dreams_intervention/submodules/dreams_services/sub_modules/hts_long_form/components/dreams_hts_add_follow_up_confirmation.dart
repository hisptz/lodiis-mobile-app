import 'package:flutter/material.dart';

class DreamsHTSAddFollowUpConfirmation extends StatelessWidget {
  const DreamsHTSAddFollowUpConfirmation({Key key, @required this.name})
      : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      child: Column(
        children: [
          Visibility(
            visible: name != '',
            child: Container(
              padding: EdgeInsets.only(
                top: 15.0,
              ),
              child: Text(
                'Follow up added successfully',
                style: TextStyle().copyWith(
                  color: Color(0XFF1A3518),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10.0,
            ),
            child: Text(
              'Add Another Follow up?',
              style: TextStyle().copyWith(
                color: Color(0XFF1A3518),
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    'Not Now',
                    style: TextStyle().copyWith(
                      color: Color(0xFF1A3518),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(
                    'Yes',
                    style: TextStyle().copyWith(
                      color: Color(0xFF258DCC),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
