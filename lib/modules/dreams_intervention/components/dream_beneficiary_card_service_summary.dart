import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DreamBeneficiaryCardServiceSummary extends StatelessWidget {
  const DreamBeneficiaryCardServiceSummary({Key key, @required this.services})
      : super(key: key);

  final List<List> services;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(children: [
          Expanded(
              child: Table(
            children: (services ?? []).map((List serviceRow) {
              return TableRow(
                  children: (serviceRow ?? []).map((service) {
                return TableCell(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Visibility(
                            visible: service != '',
                            child: SvgPicture.asset(
                              'assets/icons/tick-icon.svg',
                              color: Colors.black,
                              height: 10,
                              width: 10,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '$service ',
                            style: TextStyle().copyWith(
                              color: Colors.black,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList());
            }).toList(),
          ))
        ]));
  }
}
