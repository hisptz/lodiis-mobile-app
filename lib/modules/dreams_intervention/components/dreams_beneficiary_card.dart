import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/login_form_field_seperator.dart';

class DreamsBeneficiaryCard extends StatelessWidget {
  final String svgIcon = 'assets/icons/dreams-header-icon.svg';
  final String beneficiaryName = 'Amohelang Thuso';

  const DreamsBeneficiaryCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0, right: 13.0, left: 13.0),
      child: Material(
        type: MaterialType.card,
        elevation: 1.6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                      visible: true,
                      child: Expanded(
                        flex: 1,
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, bottom: 10),
                          child: Container(
                              height: 20.0,
                              width: 20.0,
                              child: SvgPicture.asset(
                                svgIcon,
                              )),
                        ),
                      )),
                  Visibility(
                      visible: true,
                      child: Expanded(
                        flex: 9,
                        child: Container(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            beneficiaryName,
                            style: TextStyle().copyWith(
                                color: Color(0xFF05131B),
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                  Visibility(
                      visible: true,
                      child: Expanded(
                        flex: 1,
                        child: Container(
                            child: InkWell(onTap: () {}, child: Text('todo'))),
                      )),
                  Visibility(
                      visible: true,
                      child: Expanded(
                        flex: 1,
                        child: Container(
                          child: Text('title 1'),
                        ),
                      )),
                  Visibility(
                      visible: true,
                      child: Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.blueAccent,
                          child: Text('title 1'),
                        ),
                      )),
                ],
              ),
              LineSeperator(
                color: Color(0xFFE9F4FA),
              ),
              Row(
                children: [Text('body')],
              ),
              Row(
                children: [Text('button actions')],
              ),
              Row(
                children: [Text('bottom content')],
              )
            ],
          ),
        ),
      ),
    );
  }
}
