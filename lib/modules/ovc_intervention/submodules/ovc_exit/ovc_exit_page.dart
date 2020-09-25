import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_body.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_botton_content.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_appBar.dart';
import 'package:provider/provider.dart';

class OvcExitPage extends StatefulWidget {
  const OvcExitPage({Key key}) : super(key: key);

  @override
  _OvcExitPageState createState() => _OvcExitPageState();
}

class _OvcExitPageState extends State<OvcExitPage> {
  final bool canEdit = false;
  final bool canView = false;
  final bool canExpand = true;
  final bool canAddChild = false;
  final bool canViewChildInfo = false;
  final bool canEditChildInfo = false;
  final bool canViewChildService = false;
  final bool canViewChildReferral = false;
  final bool canViewChildExit = true;
  final bool canAddChildExit = true;

  String toggleCardId = '';

  void onCardToogle(String cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
  }

  void onViewAchievement() {}

  void onViewExit() {}

  void onViewTransfer() {}

  void onViewClosure() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedf4ed),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: OvcInterventionAppBar(title: "HOUSE HOLD LIST"),
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
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: FlatButton(
                                                  onPressed: () =>
                                                      onViewAchievement(),
                                                  child: Text(
                                                    'ACHIEVEMENT',
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
                                                  onPressed: () => onViewExit(),
                                                  child: Text(
                                                    'EXIT',
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
                                                      onViewTransfer(),
                                                  child: Text(
                                                    'TRANSFER',
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
                                                      onViewClosure(),
                                                  child: Text(
                                                    'CLOSURE',
                                                    style: TextStyle().copyWith(
                                                      fontSize: 12.0,
                                                      color: Color(0xFF4B9F46),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )),
                                            )
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
