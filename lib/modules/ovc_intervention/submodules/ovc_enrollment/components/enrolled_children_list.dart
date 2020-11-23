import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
class EnrolledChildrenList extends StatelessWidget {
  final List<String> childrenList;
  final String title = 'Enrolled Children';

  EnrolledChildrenList(this.childrenList);

  @override
  Widget build(BuildContext context) {
    return MaterialCard(
        elevation: 2.0,
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child:
                        SvgPicture.asset('assets/icons/children_ovc_icon.svg')),
                    Expanded(
                      child: Container(
                        child: Text('Children List',
                            style: TextStyle().copyWith(
                              fontSize: 14.0,
                              color: Color(0xFF536852),
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: title != '',
                child: Container(
                    child: LineSeperator(
                        color:
                        Color(0xFF1A3518).withOpacity(0.1))),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 5.0, horizontal: 10.0),
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: childrenList.map((child){
                      int index = childrenList.indexOf(child);
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:4.0,bottom: 4.0),
                            child: Text('${index +1}. $child'),
                          ),
                        ],
                      );
                  }).toList()
                ),
              ),
            ],
          ),
        ));
  }
}
