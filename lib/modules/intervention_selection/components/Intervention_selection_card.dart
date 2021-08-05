import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';

class InterventionSelectionCard extends StatelessWidget {
  InterventionSelectionCard({
    Key key,
    this.interventionProgram,
    this.interventionProgramId,
    @required this.numberOfNoneAgywDreamsBeneficiaries,
    @required this.numberOfAgywDreamsBeneficiaries,
    @required this.numberOfHouseholds,
    @required this.numberOfOvcs,
    @required this.numberOfOgac,
  }) : super(key: key);

  final InterventionCard interventionProgram;
  final String interventionProgramId;
  final int numberOfNoneAgywDreamsBeneficiaries;
  final int numberOfAgywDreamsBeneficiaries;
  final int numberOfHouseholds;
  final int numberOfOvcs;
  final int numberOfOgac;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(32))),
      child: Column(
        children: [
          Container(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                        color: interventionProgram.svgBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: 65,
                    height: 65,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        interventionProgram.svgIcon,
                      ),
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
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: interventionProgram.id == 'ovc'
                                      ? '# of Households: '
                                      : interventionProgram.id == 'dreams'
                                          ? '# of AGYWs: '
                                          : '# of Beneficiaries: ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          interventionProgram.countLabelColor),
                                  children: [
                                    TextSpan(
                                      text: interventionProgram.id == 'ovc'
                                          ? numberOfHouseholds.toString()
                                          : interventionProgram.id == 'dreams'
                                              ? numberOfAgywDreamsBeneficiaries
                                                  .toString()
                                              : numberOfOgac.toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              interventionProgram.countColor),
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: interventionProgram.id == 'ovc'
                                      ? '# of OVCs: '
                                      : interventionProgram.id == 'dreams'
                                          ? '# of none-AGWYs: '
                                          : '',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          interventionProgram.countLabelColor),
                                  children: [
                                    TextSpan(
                                      text: interventionProgram.id == 'ovc'
                                          ? numberOfOvcs.toString()
                                          : interventionProgram.id == 'dreams'
                                              ? numberOfNoneAgywDreamsBeneficiaries
                                                  .toString()
                                              : '',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              interventionProgram.countColor),
                                    )
                                  ]),
                            )
                          ])
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 35,
            width: double.infinity,
            decoration: BoxDecoration(
                color: interventionProgramId == interventionProgram.id
                    ? interventionProgram.secondaryColor
                    : Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32))),
            child: Visibility(
                visible: interventionProgramId == interventionProgram.id,
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: SvgPicture.asset('assets/icons/tick-icon.svg'),
                )),
          )
        ],
      ),
    );
  }
}
