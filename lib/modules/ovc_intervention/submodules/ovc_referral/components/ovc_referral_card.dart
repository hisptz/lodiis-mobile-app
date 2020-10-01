import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';

class OvcReferralCard extends StatelessWidget {
  OvcReferralCard(
      {Key key,
      @required this.count,
      @required this.cardBody,
     
      this.onView,
      this.onManage})
      : super(key: key);
  final int count;
  final Widget cardBody;
  final Function onView;
  final Function onManage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: MaterialCard(
        body: Container(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("Referral ${count.toString()}")],
                  )),
              LineSeperator(
                color: Color(0xFFEDF5EC),
                height: 2,
              ),
              cardBody,
              LineSeperator(
                color: Color(0xFFEDF5EC),
                height: 2,
              ),
              Container(
                     
                        decoration: BoxDecoration(color: Color(0XFFF6FAF6)),
                              child: Container(
                 margin:EdgeInsets.symmetric(horizontal: 70),
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(color: Color(0XFFF6FAF6)),
                    child: Expanded(
                        flex: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                               margin: EdgeInsets.symmetric(horizontal: 2.0),
                                 child: FlatButton(
                                  onPressed: onView,
                                  child: Text(
                                    "VIEW",
                                    style: TextStyle().copyWith(
                                      fontSize: 12.0,
                                      color: Color(0xFF4B9F46),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),
                            Container(
                              height: 40.0,
                             // margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                      color: Color(0xFFC9E2C7), width: 1.0),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              child: FlatButton(
                                  onPressed: onManage,
                                  child: Text(
                                    'MANAGE',
                                    style: TextStyle().copyWith(
                                      fontSize: 12.0,
                                      color: Color(0xFF4B9F46),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),
                          ],
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
