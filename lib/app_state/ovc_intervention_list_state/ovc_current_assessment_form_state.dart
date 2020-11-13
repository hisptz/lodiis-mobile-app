import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';

class OvcCurrentAssessmentFormState with ChangeNotifier {
  String childHIVStatusId = 'wmKqYZML8GA';
  Map title = {"WELL_BEING": 'Well-being', "TB": 'TB', "HIV": 'HIV'};

  // initiat state

  String getCurrrentOvcHouseHoldChildHIVStatus(
      OvcHouseHoldChild currentOvcHouseHoldChild) {
    List<dynamic> attributes = currentOvcHouseHoldChild.teiData.attributes;
    String childHIVStatus;
    if (attributes.isNotEmpty && attributes.length > 0) {
      for (dynamic attributeObj in attributes) {
        if (attributeObj.containsKey('attribute') &&
            attributeObj['attribute'] == childHIVStatusId &&
            attributeObj.containsKey('value')) {
          childHIVStatus = attributeObj['value'];
        }
      }
    }
    return childHIVStatus;
  }

  List<String> getAssessmentTitles(OvcHouseHoldChild currentOvcHouseHoldChild) {
    String hivStatus =
        getCurrrentOvcHouseHoldChildHIVStatus(currentOvcHouseHoldChild);
    int age = int.parse(currentOvcHouseHoldChild.age);

    List<String> assessmentTitles = [title['WELL_BEING']];

    if (age >= 5) {
      if (hivStatus == 'false') {
        assessmentTitles.add(title['HIV']);
      }
    } else {
      if (hivStatus == 'false') {
        assessmentTitles.add(title['HIV']);
        assessmentTitles.add(title['TB']);
      } else if (hivStatus == 'true') {
        assessmentTitles.add(title['TB']);
      }
    }
    return assessmentTitles;
  }
}
