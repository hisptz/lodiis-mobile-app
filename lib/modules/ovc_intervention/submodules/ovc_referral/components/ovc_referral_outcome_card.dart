import 'package:flutter/cupertino.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class OvcReferralOutComeCard extends StatelessWidget {
  const OvcReferralOutComeCard(
      {Key key,
      @required this.eventData,
      @required this.beneficiary,
      @required this.referralProgramStages})
      : super(key: key);

  final Events eventData;
  final TrackeEntityInstance beneficiary;
  final List<String> referralProgramStages;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text('Referral outcome'),
          ),
          Visibility(
            child: Container(
              child: Text('Add outcome button'),
            ),
          )
        ],
      ),
    );
  }
}
