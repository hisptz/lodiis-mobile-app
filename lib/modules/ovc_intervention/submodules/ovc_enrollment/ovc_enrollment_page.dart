import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_body.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_botton_content.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentPage extends StatefulWidget {
  const OvcEnrollmentPage({Key key}) : super(key: key);

  @override
  _OvcEnrollmentPageState createState() => _OvcEnrollmentPageState();
}

class _OvcEnrollmentPageState extends State<OvcEnrollmentPage> {
  final bool canEdit = true;
  final bool canView = true;
  final bool canExpand = true;

  final bool canAddChild = true;
  final bool canViewChildInfo = true;
  final bool canEditChildInfo = true;
  final bool canViewChildService = false;
  final bool canViewChildReferral = false;
  final bool canViewChildExit = false;
  final bool canAddChildExit = false;

  String toggleCardId = '';

  void onCardToogle(String cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
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
                                    cardBottonActions: Container(),
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
