import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OvcInterventionChilrens extends StatelessWidget {
  bool editService, editReferral, editEnrollment, addExit;
  bool showChild = false;

  OvcInterventionChilrens(
      {this.editService,
      this.editReferral,
     this.editEnrollment,
    this.addExit});



  List<String> childrenList = [
    "Tebello Ramatla",
    "Pula Tihokomelo",
    "Bertha Nyakallo"
  ];


  void onView() {
    print("on View");
  }

  void onEdit() {
    print("on Edit");
  }

  void onRefferal() {
    print("on Refferal");
  }

  void onAdd() {
    print("on Add");
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Padding(
          padding: EdgeInsets.only(right: 0, top: 2),
      
        child: ListView.builder(
          padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: childrenList.length,
            itemBuilder: (context, index) {
              return  Row(
                  children: [
                    Text("         "),
                    Expanded(
                      child: Container(
                        child: Text((index + 1).toString() + ".",
                            style: TextStyle(
                                color: Color(0xffabc4ab),
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        child: Text(childrenList[index],
                            style: TextStyle(
                                color: Color(0xffd3dcd4),
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                      ),
                      flex: editReferral ? 5 : 6,
                    ),
                    Expanded(
                      child: Container(
                        child: addExit || editService || editEnrollment
                            ? MaterialButton(
                              onPressed: ()=>onView(),
                                                        child: Text(
                                  "VIEW",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFF4B9F46)),
                                ),
                            )
                            : Text(""),
                      ),
                      flex: editReferral ? 0 : 4,
                    ),
                    Expanded(
                      child: Container(
                        child: addExit
                            ? MaterialButton(
                              onPressed: ()=>onAdd(),
                                                        child: Text(
                                  "ADD",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color:Color(0xFF4B9F46)),
                                ),
                            )
                            : editReferral
                                ? MaterialButton(
                                  onPressed: () => onRefferal(),
                                                                child: Text(
                                      "REFERRAL",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF4B9F46)),
                                    ),
                                )
                                : MaterialButton(
                                  onPressed: ()=>onEdit(),
                                                                child: Text(
                                      "EDIT",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF4B9F46)),
                                    ),
                                ),
                      ),
                      flex:4,
                    ),
                  ],
                
              );
            }),
      ),
    );
  }
}
