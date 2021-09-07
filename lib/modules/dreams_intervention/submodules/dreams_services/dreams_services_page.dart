import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/components/service_card_botton_action.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/anc/agyw_dreams_anc.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/art_refill/agyw_dreams_art_refill.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/condoms/agyw_dreams_condoms.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/contraceptives/agyw_dreams_contraceptives.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hiv_message/agyw_dreams_hiv_message.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/hts_long_form_home_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_short_form/hts_short_form_home_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/pep/agyw_dreams_pep.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/post_gbv/agyw_dreams_post_gbv.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/agyw_dreams_prep.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep_short_form/agyw_dreams_prep_short_form_home_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/service_form/agyw_dreams_service_form_page.dart';
import 'package:provider/provider.dart';

class DreamsServicesPage extends StatefulWidget {
  const DreamsServicesPage({Key? key}) : super(key: key);

  @override
  _DreamsServicesPageState createState() => _DreamsServicesPageState();
}

class _DreamsServicesPageState extends State<DreamsServicesPage> {
  final String title = 'BENEFICIARY LIST';
  final bool canEdit = false;
  final bool canView = false;
  final bool canExpand = true;

  String? toggleCardId = '';

  void onCardToggle(BuildContext context, String? trackedEntityInstance) {
    Provider.of<ServiceEventDataState>(context, listen: false)
        .resetServiceEventDataState(trackedEntityInstance);
    setState(() {
      toggleCardId = canExpand && trackedEntityInstance != toggleCardId
          ? trackedEntityInstance
          : '';
    });
  }

  void onOpenHTSLongForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HTSLongFormHomePage(),
      ),
    );
  }

  void onOpenHTSShortForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HTSShortFormHomePage(),
      ),
    );
  }

  void onOpenPrepLongForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) async {
    updateStateData(context, agywBeneficiary);
    String? beneficiaryId = agywBeneficiary.id;
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywDreamsPrEPHTSConsentPage}_$beneficiaryId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);

    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AgywDreamsPrep(),
        ),
      );
    }
  }

  void onOpenPrepShortForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsPrepShortFormHomePage(),
      ),
    );
  }

  void onOpenCondomForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsCondoms(),
      ),
    );
  }

  void onOpenContraceptivesForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamContraceptives(),
      ),
    );
  }

  void onOpenMSGHIVForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamHIVMessage(),
      ),
    );
  }

  void onOpenANCForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsANC(),
      ),
    );
  }

  void onOpenPostGBVForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsPostGBV(),
      ),
    );
  }

  void onOpenArtRefillForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsArtRefill(),
      ),
    );
  }

  void onOpenPEPForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsPEP(),
      ),
    );
  }

  void onOpenServiceForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsServiceFormPage(),
      ),
    );
  }

  void updateStateData(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    Provider.of<DreamsBeneficiarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywBeneficiary);
    Provider.of<ServiceEventDataState>(context, listen: false)
        .resetServiceEventDataState(agywBeneficiary.id);
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: true);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DreamsInterventionListState>(
      builder: (context, dreamInterventionListState, child) {
        return SubModuleHomeContainer(
          header:
              '$title : ${dreamInterventionListState.numberOfAgywDreamsBeneficiaries} beneficiaries',
          bodyContents: _buildBody(),
        );
      },
    );
  }

  Widget _buildBody() {
    return Container(
      child: Container(
        child: Consumer<DreamsInterventionListState>(
          builder: (context, dreamInterventionListState, child) {
            return CustomPaginatedListView(
              childBuilder: (context, agywBeneficiary, child) =>
                  DreamsBeneficiaryCard(
                isAgywEnrollment: true,
                agywDream: agywBeneficiary,
                canEdit: canEdit,
                canExpand: canExpand,
                beneficiaryName: agywBeneficiary.toString(),
                canView: canView,
                isExpanded: agywBeneficiary.id == toggleCardId,
                onCardToggle: () {
                  onCardToggle(
                    context,
                    agywBeneficiary.id,
                  );
                },
                cardBody: DreamsBeneficiaryCardBody(
                  agywBeneficiary: agywBeneficiary,
                  canViewServiceCategory: true,
                  isVerticalLayout: agywBeneficiary.id == toggleCardId,
                ),
                cardButtonActions: ServiceCardButtonAction(
                  agywBeneficiary: agywBeneficiary,
                  onOpenPrepLongForm: () => onOpenPrepLongForm(
                    context,
                    agywBeneficiary,
                  ),
                  onOpenPrepShortForm: () => onOpenPrepShortForm(
                    context,
                    agywBeneficiary,
                  ),
                  onOpenHTSShortForm: () => onOpenHTSShortForm(
                    context,
                    agywBeneficiary,
                  ),
                  onOpenHTSLongForm: () => onOpenHTSLongForm(
                    context,
                    agywBeneficiary,
                  ),
                  onOpenCondomForm: () => onOpenCondomForm(
                    context,
                    agywBeneficiary,
                  ),
                  onOpenContraceptivesForm: () => onOpenContraceptivesForm(
                    context,
                    agywBeneficiary,
                  ),
                  onOpenANCForm: () => onOpenANCForm(
                    context,
                    agywBeneficiary,
                  ),
                  onOpenMSGHIVForm: () => onOpenMSGHIVForm(
                    context,
                    agywBeneficiary,
                  ),
                  onOpenArtRefillForm: () => onOpenArtRefillForm(
                    context,
                    agywBeneficiary,
                  ),
                  onOpenPEPForm: () => onOpenPEPForm(
                    context,
                    agywBeneficiary,
                  ),
                  onOpenPostGBVForm: () => onOpenPostGBVForm(
                    context,
                    agywBeneficiary,
                  ),
                  onOpenServiceForm: () => onOpenServiceForm(
                    context,
                    agywBeneficiary,
                  ),
                ),
                cardButtonContent: Container(),
              ),
              pagingController: dreamInterventionListState.agywPagingController,
              emptyListWidget: Center(
                child: Text(
                  'There is no beneficiary list at a moment',
                ),
              ),
              errorWidget: Center(
                child: Text(
                  'There is no beneficiary list at a moment',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
