import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OvcServiceDetailCard extends StatelessWidget {
  final Widget assessmentDate, healthStatus,caseplan;
  final bool showBorderColor;
  final Function onExpand, onEdit;
  final bool isCaseplan;
  OvcServiceDetailCard(
      {this.assessmentDate,
      this.healthStatus,
      this.showBorderColor,
      this.onExpand,
      this.caseplan,
      this.onEdit   ,
      this.isCaseplan = false
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Material(
        type: MaterialType.card,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                    color: showBorderColor
                        ? Color(0xFF4B9F46)
                        : Colors.transparent,
                    width: 8.0)),
            color: Colors.transparent,
          ),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Row(
            children: [
            assessmentDate  ,
         healthStatus    ,
             
              Visibility(
                  visible: true,
                  child: InkWell(
                    child: Expanded(
                        flex: 0,
                        child: Container(
                            margin: EdgeInsets.only(right: 16),
                            child: SvgPicture.asset(
                              "assets/icons/expand_icon.svg",
                            ))),
                    onTap: () => onExpand,
                  )),
              Visibility(
                  visible: true,
                  child: InkWell(
                      child: Expanded(
                          flex: 0,
                          child: Container(
                            margin: EdgeInsets.only(right: 16),
                            child: SvgPicture.asset(
                              "assets/icons/edit_icon.svg",
                            ),
                          )),
                      onTap: () => onEdit)),
            ],
          ),
        ),
      ),
    );
  }
}
