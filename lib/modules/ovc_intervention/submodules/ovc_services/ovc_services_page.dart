import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_body.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_botton_content.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/house_hold_assessment/ovc_house_hold_assessment.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/house_hold_case_plan/ovc_house_hold_case_plan_home.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/house_hold_monitor/ovc_house_hold_monitor.dart';
import 'package:provider/provider.dart';

class OvcServicesPage extends StatefulWidget {
  const OvcServicesPage({Key key}) : super(key: key);

  @override
  _OvcServicesPageState createState() => _OvcServicesPageState();
}

class _OvcServicesPageState extends State<OvcServicesPage> {
  final bool canEdit = false;
  final bool canView = false;
  final bool canExpand = true;
  final bool canAddChild = false;
  final bool canViewChildInfo = false;
  final bool canEditChildInfo = false;
  final bool canViewChildService = true;
  final bool canViewChildReferral = false;
  final bool canViewChildExit = false;
  final bool canAddChildExit = false;

  String toggleCardId = '';

  void onCardToogle(String cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
  }

  void setOvcHouseHoldCurrentSelection(
      BuildContext context, OvcHouseHold ovcHouseHold) {
    Provider.of<OvcHouseHoldCurrentSelectionState>(context, listen: false)
        .setCurrentHouseHold(ovcHouseHold);
    Provider.of<ServiveEventDataState>(context, listen: false)
        .resetServiceEventDataState(ovcHouseHold.id);
  }

  void onOpenHouseHoldAssess(BuildContext context, OvcHouseHold ovcHouseHold) {
    setOvcHouseHoldCurrentSelection(context, ovcHouseHold);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcHouseHoldAssessment(),
        ));
  }

  void onOpenHouseHoldCasePlan(
      BuildContext context, OvcHouseHold ovcHouseHold) {
    setOvcHouseHoldCurrentSelection(context, ovcHouseHold);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcHouseHoldCasePlanHome(),
        ));
  }

  void onOpenHouseHoldMonitor(BuildContext context, OvcHouseHold ovcHouseHold) {
    setOvcHouseHoldCurrentSelection(context, ovcHouseHold);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcHouseHoldMonitor(),
        ));
  }

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
              'HOUSE HOLD LIST',
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
                    margin: EdgeInsets.only(top: 16.0),
                    child: ovcHouseHolds.length == 0
                        ? Center(
                            child: Text(
                                'There is no household enrolled at moment'))
                        : Column(
                            children: ovcHouseHolds
                                .map(
                                  (OvcHouseHold ovcHouseHold) =>
                                      OvcHouseHoldCard(
                                    ovcHouseHold: ovcHouseHold,
                                    canEdit: canEdit,
                                    canExpand: canExpand,
                                    canView: canView,
                                    isExpanded: ovcHouseHold.id == toggleCardId,
                                    onCardToogle: () {
                                      onCardToogle(ovcHouseHold.id);
                                    },
                                    cardBody: OvcHouseHoldCardBody(
                                      ovcHouseHold: ovcHouseHold,
                                    ),
                                    cardBottonActions: ClipRRect(
                                      borderRadius: ovcHouseHold.id ==
                                              toggleCardId
                                          ? BorderRadius.zero
                                          : BorderRadius.only(
                                              bottomLeft: Radius.circular(12.0),
                                              bottomRight:
                                                  Radius.circular(12.0),
                                            ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Color(0XFFF6FAF6)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: FlatButton(
                                                  onPressed: () =>
                                                      onOpenHouseHoldAssess(
                                                        context,
                                                        ovcHouseHold,
                                                      ),
                                                  child: Text(
                                                    'ASSESS',
                                                    style: TextStyle().copyWith(
                                                      fontSize: 12.0,
                                                      color: Color(0xFF4B9F46),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )),
                                            ),
                                            Container(
                                              child: FlatButton(
                                                  onPressed: () =>
                                                      onOpenHouseHoldCasePlan(
                                                        context,
                                                        ovcHouseHold,
                                                      ),
                                                  child: Text(
                                                    'PLAN',
                                                    style: TextStyle().copyWith(
                                                      fontSize: 12.0,
                                                      color: Color(0xFF4B9F46),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )),
                                            ),
                                            Container(
                                              child: FlatButton(
                                                  onPressed: () =>
                                                      onOpenHouseHoldMonitor(
                                                        context,
                                                        ovcHouseHold,
                                                      ),
                                                  child: Text(
                                                    'MONITOR',
                                                    style: TextStyle().copyWith(
                                                      fontSize: 12.0,
                                                      color: Color(0xFF4B9F46),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    cardBottonContent:
                                        OvcHouseHoldCardBottonContent(
                                      ovcHouseHold: ovcHouseHold,
                                      canAddChild: canAddChild,
                                      canViewChildInfo: canViewChildInfo,
                                      canEditChildInfo: canEditChildInfo,
                                      canViewChildService: canViewChildService,
                                      canViewChildReferral:
                                          canViewChildReferral,
                                      canAddChildExit: canAddChildExit,
                                      canViewChildExit: canViewChildExit,
                                    ),
                                  ),
                                )
                                .toList(),
                          ));
          },
        ),
      ),
    );
  }
}
