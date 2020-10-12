import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/models/ovc_referral_outcome.dart';

class OvcReferralOutComeCard extends StatefulWidget {
  const OvcReferralOutComeCard({
    Key key,
    @required this.eventData,
    @required this.beneficiary,
    @required this.referralFollowUpStage,
    @required this.referralToFollowUpLinkage,
    @required this.referralProgram,
  }) : super(key: key);

  final Events eventData;
  final TrackeEntityInstance beneficiary;
  final String referralFollowUpStage;
  final String referralToFollowUpLinkage;
  final String referralProgram;

  @override
  _OvcReferralOutComeCardState createState() => _OvcReferralOutComeCardState();
}

class _OvcReferralOutComeCardState extends State<OvcReferralOutComeCard> {
  bool isFormReady = false;
  bool isreferralOutComeFilled = false;
  List<FormSection> formSections;

  @override
  void initState() {
    super.initState();
    formSections = OvcReferralOutCome.getFormSections();
    Timer(Duration(seconds: 1), () {
      isreferralOutComeFilled = getReferralOutComeStatus();

      isFormReady = true;
      setState(() {});
    });
  }

  void updateFormStateForReferals(BuildContext context) {}

  bool getReferralOutComeStatus() {
    bool isreferralOutcomeFilled = false;
    List<String> inputFields = FormUtil.getFormFieldIds(formSections);
    for (Map dataValue in widget.eventData.dataValues) {
      String dataElement = dataValue['dataElement'];
      String value = dataValue['value'];
      if (dataElement != null &&
          inputFields.indexOf(dataElement) > -1 &&
          value != null) {
        isreferralOutcomeFilled = true;
      }
    }
    return isreferralOutcomeFilled;
  }

  @override
  Widget build(BuildContext context) {
    return !isFormReady
        ? Container(
            child: CircularProcessLoader(
              color: Colors.blueGrey,
            ),
          )
        : Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text('Referral outcome $isreferralOutComeFilled'),
                ),
                Container(
                  child: Text('referralProgram ${widget.referralProgram}'),
                ),
                Container(
                  child: Text(
                      'referralFollowUpStage ${widget.referralFollowUpStage}'),
                ),
                Container(
                  child: Text(
                      'referralToFollowUpLinkage ${widget.referralToFollowUpLinkage}'),
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
