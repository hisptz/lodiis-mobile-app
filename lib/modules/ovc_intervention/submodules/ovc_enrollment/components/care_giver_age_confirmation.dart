import 'package:flutter/material.dart';

class CareGiverAgeConfirmation extends StatelessWidget {
  const CareGiverAgeConfirmation({Key key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Visibility(
            visible: true,
            child: Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                'You Cannot enroll child helded HouseHold',
                style: TextStyle().copyWith(
                    color: Color(0XFF1A3518),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),        
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: FlatButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    'Exit',
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
                  child: Text('GoBack',
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
