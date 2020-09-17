import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';

class ServiceCardBottonAction extends StatelessWidget {
  const ServiceCardBottonAction({
    Key key,
    this.onOpenPrepForm,
    this.onOpenHTSForm,
    this.onOpenHRSForm,
    this.onOpenHIVPrepForm,
    this.onOpenHIVRegForm,
  }) : super(key: key);

  final VoidCallback onOpenPrepForm;
  final VoidCallback onOpenHTSForm;
  final VoidCallback onOpenHRSForm;
  final VoidCallback onOpenHIVPrepForm;
  final VoidCallback onOpenHIVRegForm;

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
                child: InkWell(
                  onTap: onOpenHTSForm,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Center(
                        child: Text('HTS',
                            style: TextStyle().copyWith(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF1F8ECE),
                            ))),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: onOpenHRSForm,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                      width: 1,
                      color: Color(0xFF8EBAD3),
                    ))),
                    child: Center(
                        child: Text('SRH',
                            style: TextStyle().copyWith(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF1F8ECE),
                            ))),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: onOpenPrepForm,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                      width: 1,
                      color: Color(0xFF8EBAD3),
                    ))),
                    child: Center(
                        child: Text('PREP',
                            style: TextStyle().copyWith(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF1F8ECE),
                            ))),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: onOpenHIVPrepForm,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                      width: 1,
                      color: Color(0xFF8EBAD3),
                    ))),
                    child: Center(
                        child: Text('HIV PREP',
                            style: TextStyle().copyWith(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF1F8ECE),
                            ))),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: onOpenHIVRegForm,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                      width: 1,
                      color: Color(0xFF8EBAD3),
                    ))),
                    child: Center(
                        child: Text('HIV REG',
                            style: TextStyle().copyWith(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF1F8ECE),
                            ))),
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
