//OvcIntervention

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class OvcIntervention extends StatelessWidget {
  bool editService, editReferral, editEnrollment, addExit, showChild;
  Widget bodyWidget;
  Widget topyContent;
  Widget bottomContent;
  Widget ovcInterventionBodyData;
  Widget ovcChildren;
  OvcIntervention(
      {this.editService,
      this.editReferral,
      this.editEnrollment,
      this.addExit,
      this.bodyWidget,
      this.bottomContent,
      this.topyContent,
      this.showChild,
      this.ovcChildren,
      this.ovcInterventionBodyData});

  void onExpand(BuildContext context) {
    showChild = !showChild;

    print("on Expand");
    //
    (context as Element).markNeedsBuild();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, right: 13, left: 13, top: 13),
      child: Material(
        type: MaterialType.card,
        elevation: 0.6,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Container(
          padding: EdgeInsets.all(1),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.1),
                            width: 3))),
                margin: EdgeInsets.only(bottom: 3, top: 3),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 12, bottom: 15, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                          visible: true,
                          child: Expanded(
                              flex: editEnrollment ? 3 : 2,
                              child: SvgPicture.asset(
                                  "assets/icons/hh_icon.svg"))),
                      Visibility(
                          visible: true,
                          child: Expanded(
                            flex: 8,
                            child: Text(
                              "HHID-IL-00120820",
                              style: TextStyle(
                                  color: Color.fromRGBO(26, 53, 24, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Visibility(
                          visible: editService || editReferral || addExit
                              ? false
                              : true,
                          child: Expanded(
                              flex: 2,
                              child: SvgPicture.asset(
                                "assets/icons/expand_icon.svg",
                              ))),
                      Visibility(
                          visible: editService || editReferral || addExit
                              ? false
                              : true,
                          child: Expanded(
                            flex: 2,
                            child: SvgPicture.asset(
                              "assets/icons/edit_icon.svg",
                            ),
                          )),
                      Visibility(
                          visible: true,
                          child: Expanded(
                              flex: 1,
                              child: GestureDetector(
                                child: showChild || showChild && editEnrollment
                                    ? SvgPicture.asset(
                                        "assets/icons/chevron_up.svg",
                                      )
                                    : SvgPicture.asset(
                                        "assets/icons/chevron_down.svg",
                                      ),
                                onTap: () => onExpand(context),
                              )))
                    ],
                  ),
                ),
              ),
              //BodyData
              ovcInterventionBodyData,
              bottomContent,

              Visibility(
                visible: showChild ? true : false,
                child: Padding(
                  padding: editEnrollment
                      ? const EdgeInsets.only(top: 0)
                      : const EdgeInsets.only(top: 18.08),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                child: SvgPicture.asset(
                                    "assets/icons/children_ovc_icon.svg"),
                              ),
                              flex: 3,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "CHILDREN LIST",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff143d14)),
                                ),
                              ),
                              flex: 9,
                            ),
                          ],
                        ),
                        ovcChildren,
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
