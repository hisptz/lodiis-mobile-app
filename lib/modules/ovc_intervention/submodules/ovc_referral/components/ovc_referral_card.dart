import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';

class OvcReferralCard extends StatelessWidget {
  OvcReferralCard(
      {Key key,
      @required this.count,
      @required this.cardBody,
      @required this.isDreamReferral,
      this.onView,
      this.onManage})
      : super(key: key);
  final int count;
  final Widget cardBody;
  final Function onView;
  final Function onManage;
  final bool isDreamReferral;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialCard(
        body: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('Referral ${count.toString()}'),
                    )
                  ],
                ),
              ),
              LineSeperator(
                color: Color(0xFFEDF5EC),
                height: 2,
              ),
              cardBody,
              LineSeperator(
                color: Color(0xFFEDF5EC),
                height: 2,
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                child: Container(

                  decoration: BoxDecoration(color: isDreamReferral ?Color(0XFFFBFDFE):Color(0XFFF6FAF6)),
                  child: Container(
                      decoration: BoxDecoration(color:isDreamReferral ? Color(0XFFFBFDFE) : Color(0XFFF6FAF6)),
                      child: Row(
                        children: [
                          Expanded(
                            child: FlatButton(
                                onPressed: onView,
                                child: Text(
                                  'VIEW',
                                  style: TextStyle().copyWith(
                                    fontSize: 12.0,
                                    color: isDreamReferral ? Color(0xFF1F8ECE) :  Color(0xFF4B9F46),
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ),
                          Container(
                            height: 20.0,
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    color: Color(0xFFC9E2C7), width: 1.0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: FlatButton(
                                onPressed: onManage,
                                child: Text(
                                  'MANAGE',
                                  style: TextStyle().copyWith(
                                    fontSize: 12.0,
                                    color: isDreamReferral ? Color(0xFF1F8ECE) :  Color(0xFF4B9F46),
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
