import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';

class ChildAssessmentPopUpModal extends StatelessWidget {
  final List<String> titles = ["Wellbeing", "TB", "HIV"];
  @override
  Widget build(BuildContext context) {
    return Container(
           padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 7,bottom: 15),
            child: Text("SELECT ASSESSMENT ",style: TextStyle(
              color: Color(0xFF4B9F46),
              fontWeight: FontWeight.w700,
              fontSize: 14
            ),),
          ),
          SingleChildScrollView(
            child: Column(
              children: titles.map((widgetTitle) {
                return GestureDetector(
                    onTap: () => Navigator.pop(context, widgetTitle),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        LineSeperator(color: Color(0xFFE0E6E0),height: 2,),
                        Container(
  padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            widgetTitle,
                            style: TextStyle(color: Color(0xFF1A3518),fontWeight: FontWeight.w700,fontSize: 14),)),
                      ],
                    ));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
