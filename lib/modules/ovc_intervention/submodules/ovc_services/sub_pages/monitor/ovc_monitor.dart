import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_appbar_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/components/ovc_service_detail_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/models/ovc_service_detail_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/monitor/pages/add_school/ovc_monitor_add_school.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/monitor/pages/add_service/ovc_monitor_add_service.dart';
import 'package:provider/provider.dart';

//

class OvcMonitorChildView extends StatelessWidget {
  void assessment(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcMonitorChildView(),
        ));
  }

  void onExpand() {}
  void onEdit() {}
  void addService(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcMonitorAddService()));
  }

  void addSchool(BuildContext context) {
 Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcMonitorAddSchool(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEDF4ED),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<IntervetionCardState>(
            builder: (context, intervetionCardState, child) {
              InterventionCard activeInterventionProgram =
                  intervetionCardState.currentIntervetionProgram;
              return SubPageAppBar(
                label: "Child Monitor",
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            OvcChildAppBarContainer(),
            Column(
              children: OvcChildServiceDetailCard.ovcChildServiceDetailCardSeed
                  .map((OvcChildServiceDetailCard ovcChildServiceDetailCard) {
                return ovcChildServiceDetailCard.service != null
                    ? Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                        child: OvcServiceDetailCard(
                          assessmentDate:
                              serviceAccess(ovcChildServiceDetailCard.service),
                          healthStatus: serviceDate(
                              ovcChildServiceDetailCard.serviceDate),
                          showBorderColor: false,
                          onExpand: onExpand,
                          onEdit: onEdit,
                        ),
                      )
                    : Text("");
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OvcEnrollmentFormSaveButton(
                  label: "ADD SERVICE",
                  labelColor: Color(0xFF4B9F46),
                  width: 130,
                  marginLeft: 10,
                  marginRight: 10,
                  fontSize: 14,
                  vertical: 8,
                  borderColor: Color(0xFFAEB9AD),
                  horizontal: 0,
                  buttonColor: Color(0xFFEEF2ED),
                  onPressButton: () => addService(context),
                ),
                OvcEnrollmentFormSaveButton(
                  label: "ADD SCHOOL",
                  labelColor: Colors.white,
                  fontSize: 14,
                  marginLeft: 10,
                  marginRight: 10,
                  vertical: 8,
                  horizontal: 0,
                  width: 130,
                  buttonColor: Color(0xFF4B9F46),
                  onPressButton: () => addSchool(context),
                )
              ],
            )
          ]),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }

  Widget serviceDate(String date) {
    return Visibility(
        visible: true,
        child: Expanded(
            flex: 4,
            child: Container(
                child: Text(
              "$date",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4B9F46)),
            ))));
  }

  Widget serviceAccess(String serviceStatus) {
    return Visibility(
        child: Expanded(
            flex: 3,
            child: Container(
                padding: EdgeInsets.only(left: 19),
                child: Text(
                  "$serviceStatus",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF1A3518)),
                ))));
  }
}
