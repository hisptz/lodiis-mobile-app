import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';

class OvcServiceChildCard extends StatelessWidget {
  final String countString;
  final String serviceIcon;
  final String serviceTitle;
  OvcServiceChildCard(
      {@required this.countString,
      @required this.serviceIcon,
      @required this.serviceTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
   
      child: Material(
        type: MaterialType.card,
        elevation: 0.6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF35B638)),
                  alignment: Alignment.center,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                      child: Text(
                        countString,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10, bottom: 9),
                    child: SvgPicture.asset(serviceIcon))
              ],
            ),
            LineSeperator(
              color: Color(0xFFECF9EB),
              height: 1,
            ),
            Row(
              
              children: [
                Container(
                    margin: EdgeInsets.only(top: 10, left: 33),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.transparent,
                    child: Text(serviceTitle,
                        style:
                            TextStyle(color: Color(0xFF143D14), fontSize: 12)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
