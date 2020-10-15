import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:provider/provider.dart';

class OvcChildInfoTopHeader extends StatelessWidget {
  const OvcChildInfoTopHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OvcHouseHoldCurrentSelectionState>(
      builder: (context, ovcHouseHoldCurrentSelectionState, child) {
        var currentOvcHouseHoldChild =
            ovcHouseHoldCurrentSelectionState.currentOvcHouseHoldChild;
        var currentOvcHouseHold =
            ovcHouseHoldCurrentSelectionState.currentOvcHouseHold;
        return Material(
          type: MaterialType.card,
          elevation: 1.0,
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Text(
                              currentOvcHouseHoldChild.toString(),
                              style: TextStyle().copyWith(
                                  color: Color(0xFF1A3518),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Text(
                              currentOvcHouseHoldChild.childId,
                              style: TextStyle().copyWith(
                                  color: Color(0xFF1A3518),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: LineSeperator(color: Color(0XFFECF5EC)),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Sex  ',
                                  style: TextStyle().copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF92A791),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: currentOvcHouseHoldChild.sex ?? "",
                                      style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF4B9F46),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Age  ',
                                  style: TextStyle().copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF92A791),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: currentOvcHouseHoldChild.age,
                                      style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF4B9F46),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Caregiver  ',
                                  style: TextStyle().copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF92A791),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: currentOvcHouseHold.toString(),
                                      style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF4B9F46),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]))
                ],
              )),
        );
      },
    );
  }
}
