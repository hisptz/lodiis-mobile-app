import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/pp_prev_intervention_state/pp_prev_intervention_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/pp_prev_intervention_state/pp_prev_intervention_state.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/constants/pp_prev_routes_constant.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/pages/pp_prev_intervention_enrollment_form.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/pages/pp_prev_intervention_service_home.dart';
import 'package:provider/provider.dart';

class PpPrevInterventionHome extends StatelessWidget {
  const PpPrevInterventionHome({Key? key}) : super(key: key);

  final String title = 'PP PREV List';

  void onUpdateFormState(
    BuildContext context,
    PpPrevBeneficiary ppPrevBeneficiary,
    bool isEditableMode,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Provider.of<EnrollmentFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    Provider.of<EnrollmentFormState>(context, listen: false).setFormFieldState(
        'location',
        isEditableMode
            ? ppPrevBeneficiary.orgUnit
            : ppPrevBeneficiary.location);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('trackedEntityInstance', ppPrevBeneficiary.id);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('orgUnit', ppPrevBeneficiary.orgUnit);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('enrollment', ppPrevBeneficiary.enrollment);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('enrollmentDate', ppPrevBeneficiary.createdDate);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('incidentDate', ppPrevBeneficiary.createdDate);
    if (ppPrevBeneficiary.trackedEntityInstanceData != null) {
      for (Map attributeObj
          in ppPrevBeneficiary.trackedEntityInstanceData!.attributes) {
        Provider.of<EnrollmentFormState>(context, listen: false)
            .setFormFieldState(
                attributeObj['attribute'], attributeObj['value']);
      }
    }
  }

  void onAddPpPrevBeneficiary(BuildContext context) async {
    String beneficiaryId = "";
    String formAutoSaveId =
        "${PpPrevRoutesConstant.enrollmentPageModule}_$beneficiaryId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
      redirectToPpPrevEnrollmentForm(context);
    }
  }

  void redirectToPpPrevEnrollmentForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const PpPrevInterventionEnrollmentForm();
        },
      ),
    );
  }

  void onViewBeneficiary(
    BuildContext context,
    PpPrevBeneficiary ppPrevBeneficiary,
  ) {
    bool isEditableMode = false;
    onUpdateFormState(context, ppPrevBeneficiary, isEditableMode);
    redirectToPpPrevEnrollmentForm(context);
  }

  void onEditBeneficiary(
    BuildContext context,
    PpPrevBeneficiary ppPrevBeneficiary,
  ) async {
    String beneficiaryId = ppPrevBeneficiary.id!;
    String formAutoSaveId =
        "${PpPrevRoutesConstant.enrollmentPageModule}_$beneficiaryId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave,
            beneficiaryName: ppPrevBeneficiary.toString());
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      bool isEditableMode = true;
      onUpdateFormState(context, ppPrevBeneficiary, isEditableMode);
      redirectToPpPrevEnrollmentForm(context);
    }
  }

  void refreshBeneficiaryList(PpPrevInterventionState ppPrevInterventionState) {
    ppPrevInterventionState.refreshPpPrevNumber();
  }

  void onOpenBeneficiaryServices(
    BuildContext context,
    PpPrevBeneficiary ppPrevBeneficiary,
  ) {
    Provider.of<PpPrevInterventionCurrentSelectionState>(context, listen: false)
        .setCurrentAgywDream(ppPrevBeneficiary);
    Provider.of<ServiceEventDataState>(context, listen: false)
        .resetServiceEventDataState(ppPrevBeneficiary.id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const PpPrevInterventionServiceHome();
        },
      ),
    );
  }

  Consumer<PpPrevInterventionState> _buildBody() {
    return Consumer<PpPrevInterventionState>(
      builder: (context, ppPrevInterventionState, child) {
        return RefreshIndicator(
          onRefresh: () async =>
              refreshBeneficiaryList(ppPrevInterventionState),
          child: CustomPaginatedListView(
            childBuilder: (context, ppPrevBeneficiary, child) =>
                PpPrevBeneficiaryCard(
              ppPrevBeneficiary: ppPrevBeneficiary,
              onEditBeneficiary: () => onEditBeneficiary(
                context,
                ppPrevBeneficiary,
              ),
              onViewBeneficiary: () => onViewBeneficiary(
                context,
                ppPrevBeneficiary,
              ),
              onOpenBeneficiaryServices: () => onOpenBeneficiaryServices(
                context,
                ppPrevBeneficiary,
              ),
            ),
            pagingController: ppPrevInterventionState.pagingController!,
            emptyListWidget: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: const Text(
                      'There is no PP PREV beneficiaries enrolled at moment',
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/add-beneficiary.svg',
                      color: Colors.blueGrey,
                    ),
                    onPressed: () => onAddPpPrevBeneficiary(context),
                  )
                ],
              ),
            ),
            errorWidget: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: const Text(
                      'There is no PP PREV beneficiaries enrolled at moment',
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/add-beneficiary.svg',
                      color: Colors.blueGrey,
                    ),
                    onPressed: () => onAddPpPrevBeneficiary(context),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PpPrevInterventionState>(
      builder: (context, ppPrevInterventionState, child) {
        return SubModuleHomeContainer(
          header:
              '$title : ${ppPrevInterventionState.numberOfPpPrev} beneficiaries',
          showFilter: true,
          bodyContents: _buildBody(),
        );
      },
    );
  }
}
