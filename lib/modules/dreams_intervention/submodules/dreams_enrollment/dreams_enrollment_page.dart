import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_re_assessment_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_dreams_consent.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_dreams_for_re_assessment.dart';
import 'package:provider/provider.dart';

class DreamsEnrollmentPage extends StatefulWidget {
  const DreamsEnrollmentPage({Key? key}) : super(key: key);

  @override
  _DreamsEnrollmentPageState createState() => _DreamsEnrollmentPageState();
}

class _DreamsEnrollmentPageState extends State<DreamsEnrollmentPage> {
  final String title = 'BENEFICIARY LIST';
  final bool canEdit = true;
  final bool canView = true;
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

  void onAddAgywBeneficiary(BuildContext context) async {
    String beneficiaryId = "";
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywConsentPage}_$beneficiaryId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const AgywDreamsConsentForm();
          },
        ),
      );
    }
  }

  void onViewBeneficiariesWhoRequireReAssessment(BuildContext context) {
    var primaryColor =
        Provider.of<InterventionCardState>(context, listen: false)
            .currentInterventionProgram
            .primaryColor;
    var backgroundColor = Color.alphaBlend(
        (primaryColor ?? Colors.white).withOpacity(0.1), Colors.white);

    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => const AgywDreamForReAssessment(),
    );
  }

  void refreshBeneficiaryList(
      DreamsInterventionListState dreamInterventionListState) {
    dreamInterventionListState.refreshBeneficiariesNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DreamsRaAssessmentListState>(
        builder: (context, dreamsRaAssessmentListState, child) {
      return Consumer<DreamsInterventionListState>(
        builder: (context, dreamInterventionListState, child) {
          return SubModuleHomeContainer(
            onOpenInfo: () =>
                onViewBeneficiariesWhoRequireReAssessment(context),
            hasInfo: dreamsRaAssessmentListState.numberOfDreamsToReAssess > 0,
            header:
                '$title : ${dreamInterventionListState.numberOfAgywDreamsBeneficiaries} beneficiaries',
            showFilter: true,
            bodyContents: _buildBody(),
          );
        },
      );
    });
  }

  Widget _buildBody() {
    return Consumer<DreamsInterventionListState>(
      builder: (context, dreamInterventionListState, child) {
        return RefreshIndicator(
          onRefresh: () async {
            refreshBeneficiaryList(dreamInterventionListState);
          },
          child: CustomPaginatedListView(
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
                canViewServiceCategory: false,
                isVerticalLayout: agywBeneficiary.id == toggleCardId,
              ),
              cardButtonActions: Container(),
              cardButtonContent: Container(),
            ),
            pagingController: dreamInterventionListState.agywPagingController,
            emptyListWidget: Column(
              children: [
                const Center(
                  child: Text(
                    'There is no beneficiary list at a moment',
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/add-beneficiary.svg',
                      color: Colors.blueGrey,
                    ),
                    onPressed: () => onAddAgywBeneficiary(context),
                  ),
                )
              ],
            ),
            errorWidget: const Center(
              child: Text(
                'Error in loading beneficiary list ',
              ),
            ),
          ),
        );
      },
    );
  }
}
