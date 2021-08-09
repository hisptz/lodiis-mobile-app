import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_card_body.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_card_botton_content.dart';
import 'package:provider/provider.dart';
import 'ovc_exit_pages/household_exit_pages/household_graduation/ovc_household_graduation.dart';
import 'ovc_exit_pages/household_exit_pages/household_case_closure/ovc_household_case_closure.dart';
import 'ovc_exit_pages/household_exit_pages/household_exit/ovc_household_exit.dart';
import 'ovc_exit_pages/household_exit_pages/household_transfer/ovc_household_case_transfer.dart';

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

  void onCardToggle(String cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
  }

  void setOvcHouseholdCurrentSelection(
      BuildContext context, OvcHousehold ovcHousehold) {
    Provider.of<OvcHouseholdCurrentSelectionState>(context, listen: false)
        .setCurrentHousehold(ovcHousehold);
    Provider.of<ServiceEventDataState>(context, listen: false)
        .resetServiceEventDataState(ovcHousehold.id);
  }

  void onViewGraduation(BuildContext context, OvcHousehold ovcHousehold) {
    setOvcHouseholdCurrentSelection(context, ovcHousehold);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcHouseholdGraduation(),
      ),
    );
  }

  void onViewExit(BuildContext context, OvcHousehold ovcHousehold) {
    setOvcHouseholdCurrentSelection(context, ovcHousehold);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcHouseholdExit(),
      ),
    );
  }

  void onViewTransfer(BuildContext context, OvcHousehold ovcHousehold) {
    setOvcHouseholdCurrentSelection(context, ovcHousehold);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcHouseholdCaseTransfer(),
      ),
    );
  }

  void onViewClosure(BuildContext context, OvcHousehold ovcHousehold) {
    setOvcHouseholdCurrentSelection(context, ovcHousehold);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcHouseholdCaseClosure(),
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
                      ': ${ovcInterventionListState.numberOfHouseholds} Malapa'
                  : 'Household list'.toUpperCase() +
                      ': ${ovcInterventionListState.numberOfHouseholds} households';
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

  Widget _buildBody(String currentLanguage) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Consumer<OvcInterventionListState>(
        builder: (context, ovcListState, child) => CustomPaginatedListView(
              pagingController: ovcListState.pagingController,
              childBuilder: (context, ovcHousehold, index) => OvcHouseholdCard(
                ovcHousehold: ovcHousehold,
                canEdit: canEdit,
                canExpand: canExpand,
                canView: canView,
                isExpanded: ovcHousehold.id == toggleCardId,
                onCardToggle: () {
                  onCardToggle(ovcHousehold.id);
                },
                cardBody: OvcHouseholdCardBody(
                  ovcHousehold: ovcHousehold,
                ),
                cardButtonActions: ClipRRect(
                  borderRadius: ovcHousehold.id == toggleCardId
                      ? BorderRadius.zero
                      : BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0XFFF6FAF6),
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      itemExtent:
                          screenWidth > 320 ? (screenWidth * 0.95) / 4 : null,
                      shrinkWrap: true,
                      children: [
                        Container(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 0.0,
                              ),
                            ),
                            onPressed: () =>
                                onViewGraduation(context, ovcHousehold),
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
                        Container(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 0.0,
                              ),
                            ),
                            onPressed: () => onViewExit(context, ovcHousehold),
                            child: Text(
                              currentLanguage != 'lesotho' ? 'EXIT' : 'Koala',
                              style: TextStyle().copyWith(
                                fontSize: 12.0,
                                color: Color(0xFF4B9F46),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 0.0,
                              ),
                            ),
                            onPressed: () =>
                                onViewTransfer(context, ovcHousehold),
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
                        Container(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 0.0,
                              ),
                            ),
                            onPressed: () => onViewClosure(
                              context,
                              ovcHousehold,
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
                cardButtonContent: OvcHouseholdCardButtonContent(
                  currentLanguage: currentLanguage,
                  ovcHousehold: ovcHousehold,
                  canAddChild: canAddChild,
                  canViewChildInfo: canViewChildInfo,
                  canEditChildInfo: canEditChildInfo,
                  canViewChildService: canViewChildService,
                  canViewChildReferral: canViewChildReferral,
                  canViewChildExit: canViewChildExit,
                ),
              ),
              errorWidget: Center(
                child: Text(
                  currentLanguage == 'lesotho'
                      ? 'Ha hona lelapa le ngolisitsoeng ha hajoale'
                      : 'There is no household enrolled at moment',
                ),
              ),
              emptyListWidget: Center(
                child: Text(
                  currentLanguage == 'lesotho'
                      ? 'Ha hona lelapa le ngolisitsoeng ha hajoale'
                      : 'There is no household enrolled at moment',
                ),
              ),
            ));
  }
}
