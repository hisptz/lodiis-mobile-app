import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';

class DreamBeneficiaryCardBody extends StatelessWidget {
  const DreamBeneficiaryCardBody(
      {Key key,
      @required this.isVerticalLayout,
      @required this.agywBeneficiary})
      : super(key: key);

  final bool isVerticalLayout;
  final Color labelColor = const Color(0xFF8FBAD3);
  final Color valueColor = const Color(0xFF444E54);
  final AgywDream agywBeneficiary;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 20.0),
        child: isVerticalLayout
            ? Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: VerticalRowCardData(
                        label: 'Created',
                        value: agywBeneficiary.createdDate,
                        labelColor: labelColor,
                        valueColor: valueColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: VerticalRowCardData(
                        label: 'Beneficary id',
                        value: agywBeneficiary.benefecaryId,
                        labelColor: labelColor,
                        valueColor: valueColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: VerticalRowCardData(
                        label: 'Age',
                        value: agywBeneficiary.age.toString(),
                        labelColor: labelColor,
                        valueColor: valueColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: VerticalRowCardData(
                        label: 'Age band',
                        value: agywBeneficiary.ageBand,
                        labelColor: labelColor,
                        valueColor: valueColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: VerticalRowCardData(
                        label: 'Sex',
                        value: agywBeneficiary.sex,
                        labelColor: labelColor,
                        valueColor: valueColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: VerticalRowCardData(
                        label: 'Enrolled Organisation unit',
                        value: agywBeneficiary.enrolledOrganisation,
                        labelColor: labelColor,
                        valueColor: valueColor),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HorizontalRowCardData(
                            labelColor: labelColor,
                            valueColor: valueColor,
                            label: 'Age',
                            value: agywBeneficiary.age.toString(),
                          ),
                          HorizontalRowCardData(
                            labelColor: labelColor,
                            valueColor: valueColor,
                            label: 'Sex',
                            value: agywBeneficiary.sex,
                          ),
                          HorizontalRowCardData(
                            labelColor: labelColor,
                            valueColor: valueColor,
                            label: 'En Org',
                            value: agywBeneficiary.enrolledOrganisation,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ));
  }
}

class HorizontalRowCardData extends StatelessWidget {
  const HorizontalRowCardData({
    Key key,
    @required this.labelColor,
    @required this.valueColor,
    @required this.label,
    @required this.value,
  }) : super(key: key);

  final Color labelColor;
  final Color valueColor;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        child: RichText(
          text: TextSpan(
              text: '$label   ',
              style: TextStyle().copyWith(
                  color: labelColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: value,
                  style: TextStyle().copyWith(
                      color: valueColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                )
              ]),
        ),
      ),
    );
  }
}

class VerticalRowCardData extends StatelessWidget {
  const VerticalRowCardData({
    Key key,
    @required this.labelColor,
    @required this.valueColor,
    @required this.label,
    @required this.value,
  }) : super(key: key);

  final Color labelColor;
  final Color valueColor;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: Text(
          label,
          style: TextStyle().copyWith(
              color: labelColor, fontSize: 14.0, fontWeight: FontWeight.w500),
        )),
        Expanded(
            child: Text(
          value,
          style: TextStyle().copyWith(
              color: valueColor, fontSize: 14.0, fontWeight: FontWeight.w500),
        ))
      ],
    );
  }
}
