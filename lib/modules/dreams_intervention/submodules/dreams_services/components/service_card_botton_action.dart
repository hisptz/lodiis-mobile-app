import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';

class ServiceCardBottonAction extends StatelessWidget {
  const ServiceCardBottonAction({
    Key key,
    this.onOpenAssessmentForm,
    this.onOpenServiceForm,
    this.onOpenPrepForm,
  }) : super(key: key);

  final VoidCallback onOpenAssessmentForm;
  final VoidCallback onOpenServiceForm;
  final VoidCallback onOpenPrepForm;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          LineSeperator(
            color: Color(0xFFE9F4FA),
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                alignment: Alignment.topLeft,
                child: MaterialButton(
                  onPressed: onOpenAssessmentForm,
                  child: Text('ASSESSMENT',
                      style: TextStyle().copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F8ECE),
                      )),
                ),
              )),
              Expanded(
                child: InkWell(
                  onTap: onOpenServiceForm,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                              width: 1,
                              color: Color(0xFF8EBAD3),
                            ),
                            right: BorderSide(
                                width: 1, color: Color(0xFF8EBAD3)))),
                    child: Center(
                        child: Text('ASSESSMENT',
                            style: TextStyle().copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F8ECE),
                            ))),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: MaterialButton(
                    onPressed: onOpenPrepForm,
                    child: Text('REFERRAL',
                        style: TextStyle().copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F8ECE),
                        )),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
