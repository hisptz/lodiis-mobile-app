import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_card_body.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_card_botton_content.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentRecords extends StatefulWidget {
  const OvcEnrollmentRecords({Key? key}) : super(key: key);

  @override
  State<OvcEnrollmentRecords> createState() => _OvcEnrollmentRecordsState();
}

class _OvcEnrollmentRecordsState extends State<OvcEnrollmentRecords> {
  final bool canEdit = false;
  final bool canView = true;
  final bool canExpand = true;
  final bool canAddChild = false;
  final bool canViewChildInfo = true;
  final bool canEditChildInfo = false;
  final bool canViewChildService = false;
  final bool canViewChildReferral = false;
  final bool canViewChildExit = false;
  String? toggleCardId = '';

  void onCardToggle(String? cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
  }

  void refreshBeneficiaryList(
      OvcInterventionListState ovcInterventionListState) {
    ovcInterventionListState.refreshOvcNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageTranslationState>(
      builder: (context, languageTranslationState, child) {
        String? currentLanguage = languageTranslationState.currentLanguage;
        return Consumer<OvcInterventionListState>(
          builder: (context, ovcInterventionListState, child) {
            String header = currentLanguage == 'lesotho'
                ? '${'Lethathamo la malapa'.toUpperCase()}: ${ovcInterventionListState.numberOfHouseholds} Malapa'
                : '${'Household list'.toUpperCase()}: ${ovcInterventionListState.numberOfHouseholds} households';
            return SubModuleHomeContainer(
              header: header,
              bodyContents: _buildBody(currentLanguage),
            );
          },
        );
      },
    );
  }

  Widget _buildBody(String? currentLanguage) {
    return Consumer<OvcInterventionListState>(
      builder: (context, ovcState, child) => RefreshIndicator(
        onRefresh: () async => refreshBeneficiaryList(ovcState),
        child: CustomPaginatedListView(
          errorWidget: Center(
            child: Text(
              currentLanguage == 'lesotho'
                  ? 'Ha hona lelapa le ngolisitsoeng ha hajoale'
                  : 'There is no household enrolled at the moment',
            ),
          ),
          pagingController: ovcState.pagingController,
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
            cardButtonActions: Container(),
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
          emptyListWidget: Center(
            child: Column(
              children: [
                Text(
                  currentLanguage == 'lesotho'
                      ? 'Ha hona lelapa le ngolisitsoeng ha hajoale'
                      : 'There is no household enrolled at the moment',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
