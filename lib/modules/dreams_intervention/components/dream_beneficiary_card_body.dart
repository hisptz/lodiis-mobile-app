import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';

class DreamBeneficiaryCardBody extends StatelessWidget {
  const DreamBeneficiaryCardBody(
      {Key key, @required this.isVerticalLayout, @required this.agywDream})
      : super(key: key);

  final bool isVerticalLayout;
  final Color labelColor = const Color(0xFF8FBAD3);
  final Color valueColor = const Color(0xFF444E54);
  final AgywDream agywDream;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 20.0),
        child: isVerticalLayout
            ? Column(
                children: [
                  // @TODO list based on data shapes
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: VerticalRowCardData(
                        label: 'Beneficary id',
                        value: '${agywDream.benefecaryId}',
                        labelColor: labelColor,
                        valueColor: valueColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: VerticalRowCardData(
                        label: 'Age',
                        value: '${agywDream.age}',
                        labelColor: labelColor,
                        valueColor: valueColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: VerticalRowCardData(
                        label: 'Age band',
                        value: '${agywDream.ageBand}',
                        labelColor: labelColor,
                        valueColor: valueColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: VerticalRowCardData(
                        label: 'Sex',
                        value: '${agywDream.sex}',
                        labelColor: labelColor,
                        valueColor: valueColor),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: VerticalRowCardData(
                        label: 'Enrolled Organisation unit',
                        value: 'KB',
                        labelColor: labelColor,
                        valueColor: valueColor),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HorizontalRowCardData(
                            labelColor: labelColor,
                            valueColor: valueColor,
                            label: 'Age',
                            value: '${agywDream.age}',
                          ),
                          HorizontalRowCardData(
                            labelColor: labelColor,
                            valueColor: valueColor,
                            label: 'Sex',
                            value: '${agywDream.ageBand}',
                          ),
                          HorizontalRowCardData(
                            labelColor: labelColor,
                            valueColor: valueColor,
                            label: 'En Org',
                            value: 'KB',
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
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle().copyWith(
                color: labelColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w500)),
        SizedBox(
          width: 20.0,
        ),
        Text(value,
            style: TextStyle().copyWith(
                color: valueColor, fontSize: 14.0, fontWeight: FontWeight.w500))
      ],
    ));
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
