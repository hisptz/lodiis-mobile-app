import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_appBar.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_home_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/ovc_service_child_view_page.dart';

class OvcServicesPage extends StatelessWidget {
  const OvcServicesPage({Key key}) : super(key: key);

  void onAssess() {
    print("on ASSESS");
  }

  void onPlan() {
    print("on Plan");
  }

  void onMonitor() {
    print("on Monitor");
  }

  @override
  Widget build(BuildContext context) {
    void viewChild() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OvcServiceChildView(),
          ));
    }

    return Scaffold(
      backgroundColor: Color(0xffedf4ed),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: OvcInterventionAppBar(title: "HOUSE HOLD LIST"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OvcInterventionCard(
              editService: true,
              addExit: false,
              editEnrollment: false,
              editReferral: false,
              onView: viewChild,
            ),
            OvcInterventionCard(
              editService: true,
              addExit: false,
              editEnrollment: false,
              editReferral: false,
              onView: viewChild,
            ),
            OvcInterventionCard(
              editService: true,
              addExit: false,
              editEnrollment: false,
              editReferral: false,
              onView: viewChild,
            ),
            OvcInterventionCard(
              editService: true,
              addExit: false,
              editEnrollment: false,
              editReferral: false,
              onView: viewChild,
            ),
            OvcInterventionCard(
              editService: true,
              addExit: false,
              editEnrollment: false,
              editReferral: false,
              onView: viewChild,
            ),
          ],
        ),
      ),
    );
  }
}
