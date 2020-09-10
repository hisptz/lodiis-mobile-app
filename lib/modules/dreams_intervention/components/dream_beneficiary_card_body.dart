import 'package:flutter/material.dart';

class DreamBeneficiaryCardBody extends StatelessWidget {
  const DreamBeneficiaryCardBody({Key key, @required this.isVerticalLayout})
      : super(key: key);

  final bool isVerticalLayout;
  final Color labelColor = const Color(0xFF8FBAD3);
  final Color valueColor = const Color(0xFF444E54);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: isVerticalLayout
          ? Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        'Beneficary id',
                        style: TextStyle().copyWith(
                            color: labelColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                      )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '099383890',
                            style: TextStyle().copyWith(
                                color: valueColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        'Age',
                        style: TextStyle().copyWith(
                            color: labelColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                      )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '12',
                            style: TextStyle().copyWith(
                                color: valueColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        'Age band',
                        style: TextStyle().copyWith(
                            color: labelColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                      )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '10-14',
                            style: TextStyle().copyWith(
                                color: valueColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        'Sex',
                        style: TextStyle().copyWith(
                            color: labelColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                      )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            'Female',
                            style: TextStyle().copyWith(
                                color: valueColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        'Status',
                        style: TextStyle().copyWith(
                            color: labelColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                      )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            'Active',
                            style: TextStyle().copyWith(
                                color: valueColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ))
                    ],
                  ),
                ),
              ],
            )
          : Row(
              children: [Text('Body - horizontal')],
            ),
    );
  }
}
