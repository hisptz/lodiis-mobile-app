import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_card_body.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_card_botton_content.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/constants/ovc_routes_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_consent_form.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentPage extends StatefulWidget {
  const OvcEnrollmentPage({Key? key}) : super(key: key);

  @override
  State<OvcEnrollmentPage> createState() => _OvcEnrollmentPageState();
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
  String? toggleCardId = '';

  void onCardToggle(String? cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
  }

  void onAddHousehold(BuildContext context) async {
    String beneficiaryId = "";
    String formAutoSaveId =
        "${OvcRoutesConstant.ovcConcentFormPage}_$beneficiaryId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const OvcEnrollmentConsentForm();
          },
        ),
      );
    }
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
              showFilter: true,
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
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/add-house-hold.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.blueGrey,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () => onAddHousehold(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
