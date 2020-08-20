import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';

class InterventionSelectionCard extends StatelessWidget {
  InterventionSelectionCard({Key key, this.interventionProgram})
      : super(key: key);

  final InterventionCard interventionProgram;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(32))),
      child: Column(
        children: [
          Container(
            height: 151,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 22, right: 22, top: 0),
                    decoration: BoxDecoration(
                        color: interventionProgram.svgBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: 65,
                    height: 65,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: SvgPicture.asset(interventionProgram.svgIcon),
                    )),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text(interventionProgram.name,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: interventionProgram.nameColor))),
                      Row(
                        children: [
                          Text(
                            '# of beneficiary: ',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: interventionProgram.countLabelColor),
                          ),
                          Text('2121',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: interventionProgram.countColor))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: interventionProgram.secondaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32))),
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: SvgPicture.asset('assets/icons/tick-icon.svg'),
                ),
              ))
        ],
      ),
    );
  }
}
