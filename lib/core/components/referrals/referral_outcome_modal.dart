import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';

class ReferralOutcomeModal extends StatelessWidget {
  const ReferralOutcomeModal({
    Key key,
    @required this.themeColor,
    @required this.referralOutcomeFormSections,
    @required this.eventData,
  }) : super(key: key);

  final Color themeColor;
  final List<FormSection> referralOutcomeFormSections;
  final Events eventData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text('Form Container'),
          ),
          Container(
            decoration: BoxDecoration(
              color: themeColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: () => {},
                    child: Text(
                      'SAVE OUTCOME',
                      style: TextStyle().copyWith(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                        color: themeColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
