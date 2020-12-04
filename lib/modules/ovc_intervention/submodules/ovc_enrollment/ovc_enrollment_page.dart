import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_body.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_botton_content.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_consent_form.dart';
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
  String toggleCardId = '';

  void onCardToogle(String cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
  }

  void onAddHouseHold(BuildContext context) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OvcEnrollmentConsetForm();
        },
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
                  margin: EdgeInsets.only(top: 20.0),
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
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  currentLanguage == 'lesotho'
                                      ? 'Ha hona lelapa le ngolisitsoeng ha hajoale'
                                      : 'There is no household enrolled at moment',
                                ),
                              ),
                              Container(
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/icons/add-house-hold.svg',
                                    color: Colors.blueGrey,
                                  ),
                                  onPressed: () => onAddHouseHold(context),
                                ),
                              )
                            ],
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
                                  cardBottonActions: Container(),
                                  cardBottonContent:
                                      OvcHouseHoldCardBottonContent(
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
