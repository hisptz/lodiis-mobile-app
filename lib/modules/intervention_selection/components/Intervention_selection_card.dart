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
            height: 140,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 22, right: 22),
                  child: Text('Icon'),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(interventionProgram.name),
                      Row(
                        children: [Text('# of beneficiary '), Text('2121')],
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
