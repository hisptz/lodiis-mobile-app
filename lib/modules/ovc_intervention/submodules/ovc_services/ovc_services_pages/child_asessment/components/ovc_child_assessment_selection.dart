import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';

class OvcChildAssessmentSelection extends StatelessWidget {
  final List<String> assessmentTitles = ['Well-being', 'TB', 'HIV'];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'SELECT ASSESSMENT',
              style: TextStyle(
                  color: Color(0xFF4B9F46),
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),
          ),
          Container(
            child: Column(
              children: assessmentTitles.map((assessmentTitle) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: LineSeperator(
                        color: Color(0xFFE0E6E0),
                        height: 1.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () =>
                                  Navigator.pop(context, assessmentTitle),
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    assessmentTitle,
                                    style: TextStyle(
                                        color: Color(0xFF1A3518),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
