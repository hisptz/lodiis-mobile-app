import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class OrganisationUnitChildrenWidget extends StatelessWidget {
  
  bool isChildren = false;
  

  List<dynamic> children = [];

  // OrganisationUnitChildrenWidget({this.isChildren, this.children});
  
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isChildren ?false: true,
        child: Padding(
          padding: const EdgeInsets.only(left:58.0,right: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
              dragStartBehavior: DragStartBehavior.start,
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Text("childrens"+index.toString());

              }),
             
            
              
             
            ],
          ),
        ));
  }
}
