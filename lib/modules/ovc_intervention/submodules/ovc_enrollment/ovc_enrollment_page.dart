import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_home_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_house_hold_service.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentPage extends StatelessWidget {
  const OvcEnrollmentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedf4ed),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
              width: 23,
            ),
            Text(
              "HOUSE HOLD LIST",
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<OvcInterventionListState>(
          builder: (context, ovcInterventionListState, child) {
            bool isLoading = ovcInterventionListState.isLoading;
            List<OvcHouseHold> ovcHouseHolds =
                ovcInterventionListState.ovcInterventionList;
            return isLoading
                ? Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: CircularProcessLoader(color: Colors.blueGrey),
                    ),
                  )
                : Container(
                    child: Column(
                    children: ovcHouseHolds
                        .map((OvcHouseHold ovcHouseHold) => Row(
                              children: [
                                Expanded(child: Text(ovcHouseHold.toString())),
                                Text(ovcHouseHold.houseHoldId),
                                Text(ovcHouseHold.location)
                              ],
                            ))
                        .toList(),
                  ));
          },
        ),
        // child: Column(
        //   children: [
        //     OvcInterventionCard(
        //       editEnrollment: true,
        //       addExit: false,
        //       editReferral: false,
        //       editService: false,
        //     ),
        //     OvcInterventionCard(
        //       editEnrollment: true,
        //       addExit: false,
        //       editReferral: false,
        //       editService: false,
        //     ),
        //     OvcInterventionCard(
        //       editEnrollment: true,
        //       addExit: false,
        //       editReferral: false,
        //       editService: false,
        //     ),
        //     OvcInterventionCard(
        //       editEnrollment: true,
        //       addExit: false,
        //       editReferral: false,
        //       editService: false,
        //     ),
        //     OvcInterventionCard(
        //       editEnrollment: true,
        //       addExit: false,
        //       editReferral: false,
        //       editService: false,
        //     )
        //   ],
        // ),
      ),
    );
  }
}
