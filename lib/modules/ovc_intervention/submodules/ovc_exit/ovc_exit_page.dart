import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_body.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_botton_content.dart';
import 'package:provider/provider.dart';
import 'ovc_exit_pages/house_hold_exit_pages/household_graduation/ovc_house_hold_graduation.dart';
import 'ovc_exit_pages/house_hold_exit_pages/household_case_closure/ovc_house_hold_case_closure.dart';
import 'ovc_exit_pages/house_hold_exit_pages/household_exit/ovc_house_hold_exit.dart';
import 'ovc_exit_pages/house_hold_exit_pages/household_transfer/ovc_house_hold_case_transfer.dart';

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

  void setOvcHouseHoldCurrentSelection(
      BuildContext context, OvcHouseHold ovcHouseHold) {
    Provider.of<OvcHouseHoldCurrentSelectionState>(context, listen: false)
        .setCurrentHouseHold(ovcHouseHold);
    Provider.of<ServiveEventDataState>(context, listen: false)
        .resetServiceEventDataState(ovcHouseHold.id);
  }

  void onViewGraduation(BuildContext context, OvcHouseHold ovcHouseHold) {
    setOvcHouseHoldCurrentSelection(context, ovcHouseHold);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcHouseHoldGraduation(),
      ),
    );
  }

  void onViewExit(BuildContext context, OvcHouseHold ovcHouseHold) {
    setOvcHouseHoldCurrentSelection(context, ovcHouseHold);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcHouseHoldExit(),
      ),
    );
  }

  void onViewTransfer(BuildContext context, OvcHouseHold ovcHouseHold) {
    setOvcHouseHoldCurrentSelection(context, ovcHouseHold);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcHouseHoldCaseTransfer(),
      ),
    );
  }

  void onViewClosure(BuildContext context, OvcHouseHold ovcHouseHold) {
    setOvcHouseHoldCurrentSelection(context, ovcHouseHold);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcHouseHoldCaseClosure(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String currentLanguage = languageTranslationState.currentLanguage;
          return Consumer<OvcInterventionListState>(
            builder: (context, ovcInterventionListState, child) {
              String header = currentLanguage == 'lesotho'
                  ? 'Lethathamo la malapa'.toUpperCase() +
                      ': ${ovcInterventionListState.numberOfHouseHolds} Malapa'
                  : 'Household list'.toUpperCase() +
                      ': ${ovcInterventionListState.numberOfHouseHolds} households';
              return SubModuleHomeContainer(
                header: header,
                bodyContents: _buildBody(currentLanguage),
              );
            },
          );
        },
      ),
    );
  }

  Container _buildBody(String currentLanguage) {
    return Container(
      child: Consumer<OvcInterventionListState>(
        builder: (context, ovcInterventionListState, child) {
          bool isLoading = ovcInterventionListState.isLoading;
          List<OvcHouseHold> ovcHouseHolds =
              ovcInterventionListState.ovcInterventionList;
          return isLoading
              ? Container(
                  margin: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Center(
                    child: CircularProcessLoader(
                      color: Colors.blueGrey,
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(
                    top: 16.0,
                  ),
                  child: ovcHouseHolds.length == 0
                      ? Center(
                          child: Text(
                            currentLanguage == 'lesotho'
                                ? 'Ha hona lelapa le ngolisitsoeng ha hajoale'
                                : 'There is no household enrolled at moment',
                          ),
                        )
                      : Column(
                          children: ovcHouseHolds
                              .map(
                                (OvcHouseHold ovcHouseHold) => OvcHouseHoldCard(
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
                                            bottomRight: Radius.circular(12.0),
                                          ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0XFFF6FAF6),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: FlatButton(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 0.0,
                                              ),
                                              onPressed: () => onViewGraduation(
                                                  context, ovcHouseHold),
                                              child: Text(
                                                'GRADUATION',
                                                style: TextStyle().copyWith(
                                                  fontSize: 12.0,
                                                  color: Color(0xFF4B9F46),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: FlatButton(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 0.0,
                                              ),
                                              onPressed: () => onViewExit(
                                                  context, ovcHouseHold),
                                              child: Text(
                                                'EXIT',
                                                style: TextStyle().copyWith(
                                                  fontSize: 12.0,
                                                  color: Color(0xFF4B9F46),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: FlatButton(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 0.0,
                                              ),
                                              onPressed: () => onViewTransfer(
                                                  context, ovcHouseHold),
                                              child: Text(
                                                'TRANSFER',
                                                style: TextStyle().copyWith(
                                                  fontSize: 12.0,
                                                  color: Color(0xFF4B9F46),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: FlatButton(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 0.0,
                                              ),
                                              onPressed: () => onViewClosure(
                                                context,
                                                ovcHouseHold,
                                              ),
                                              child: Text(
                                                'CLOSURE',
                                                style: TextStyle().copyWith(
                                                  fontSize: 12.0,
                                                  color: Color(0xFF4B9F46),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  cardBottonContent:
                                      OvcHouseHoldCardBottonContent(
                                    currentLanguage: currentLanguage,
                                    ovcHouseHold: ovcHouseHold,
                                    canAddChild: canAddChild,
                                    canViewChildInfo: canViewChildInfo,
                                    canEditChildInfo: canEditChildInfo,
                                    canViewChildService: canViewChildService,
                                    canViewChildReferral: canViewChildReferral,
                                    canViewChildExit: canViewChildExit,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                );
        },
      ),
    );
  }
}
