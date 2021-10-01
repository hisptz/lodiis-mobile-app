import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/education_intervention_state/education_intervention_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/education_intervention_state/education_lbse_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/education_intervention/components/education_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_routes_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/pages/education_lbse_enrollment_form_page.dart';
import 'package:provider/provider.dart';

class EducationLbse extends StatefulWidget {
  EducationLbse({Key? key}) : super(key: key);

  @override
  _EducationLbseState createState() => _EducationLbseState();
}

class _EducationLbseState extends State<EducationLbse> {
  final String title = 'LBSE List';
  final bool canEdit = true;
  final bool canView = true;
  final bool canExpand = true;

  String? toggleCardId = '';
  void onCardToggle(BuildContext context, String? trackedEntityInstance) {
    toggleCardId = canExpand && trackedEntityInstance != toggleCardId
        ? trackedEntityInstance
        : '';
    setState(() {});
  }

  void onUpdateFormState(
    BuildContext context,
    EducationBeneficiary educationBeneficiary,
    bool isEditableMode,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Provider.of<EnrollmentFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    Provider.of<EnrollmentFormState>(context, listen: false).setFormFieldState(
        'location',
        isEditableMode
            ? educationBeneficiary.orgUnit
            : educationBeneficiary.location);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('trackedEntityInstance', educationBeneficiary.id);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('orgUnit', educationBeneficiary.orgUnit);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('enrollment', educationBeneficiary.enrollment);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('enrollmentDate', educationBeneficiary.createdDate);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('incidentDate', educationBeneficiary.createdDate);
    if (educationBeneficiary.trackedEntityInstanceData != null) {
      for (Map attributeObj
          in educationBeneficiary.trackedEntityInstanceData!.attributes) {
        Provider.of<EnrollmentFormState>(context, listen: false)
            .setFormFieldState(
                attributeObj['attribute'], attributeObj['value']);
      }
    }
  }

  void onAddLbseBeneficiary(BuildContext context) async {
    String beneficiaryId = "";
    String formAutoSaveId =
        "${LbseRoutesConstant.enrollmentPageModule}_$beneficiaryId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
      redirectToLbseEnrollmentForm(context);
    }
  }

  void redirectToLbseEnrollmentForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EducationLbseEnrollmentFormPage();
        },
      ),
    );
  }

  void onViewBeneficiary(
    BuildContext context,
    EducationBeneficiary educationBeneficiary,
  ) {
    bool isEditableMode = false;
    onUpdateFormState(context, educationBeneficiary, isEditableMode);
    redirectToLbseEnrollmentForm(context);
  }

  void onEditBeneficiary(
    BuildContext context,
    EducationBeneficiary educationBeneficiary,
  ) async {
    String beneficiaryId = educationBeneficiary.id!;
    String formAutoSaveId =
        "${LbseRoutesConstant.enrollmentPageModule}_$beneficiaryId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      bool isEditableMode = true;
      onUpdateFormState(context, educationBeneficiary, isEditableMode);
      redirectToLbseEnrollmentForm(context);
    }
  }

  void onOpenBeneficiaryLearningOutcome(
    BuildContext context,
    EducationBeneficiary educationBeneficiary,
  ) {
    Provider.of<EducationInterventionCurrentSelectionState>(context,
            listen: false)
        .setCurrentBeneficiary(educationBeneficiary);
    Provider.of<ServiceEventDataState>(context, listen: false)
        .resetServiceEventDataState(educationBeneficiary.id);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return PpPrevInterventionServiceHome();
    //     },
    //   ),
    // );
  }

  void onOpenBeneficiaryReferrals(
    BuildContext context,
    EducationBeneficiary educationBeneficiary,
  ) {
    Provider.of<EducationInterventionCurrentSelectionState>(context,
            listen: false)
        .setCurrentBeneficiary(educationBeneficiary);
    Provider.of<ServiceEventDataState>(context, listen: false)
        .resetServiceEventDataState(educationBeneficiary.id);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return PpPrevInterventionServiceHome();
    //     },
    //   ),
    // );
  }

  Center _getEmptyListContainer(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 10.0,
            ),
            child: Text(
              'There is no LBSE beneficiaries enrolled at moment',
            ),
          ),
          Container(
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/add-beneficiary.svg',
                color: Colors.blueGrey,
              ),
              onPressed: () => onAddLbseBeneficiary(context),
            ),
          )
        ],
      ),
    );
  }

  Container _buildBody() {
    return Container(
      child: Container(
        child: Consumer<EducationLbseInterventionState>(
          builder: (context, educationLbseInterventionState, child) {
            return CustomPaginatedListView(
              childBuilder: (context, lbseBeneficiary, child) => Container(
                child: EducationBeneficiaryCard(
                  canEdit: canEdit,
                  canView: canView,
                  canExpand: canExpand,
                  isExpanded: toggleCardId == lbseBeneficiary.id,
                  isLbseLearningOutcomeVisible: true,
                  isLbseReferralVisible: true,
                  isBursarySchoolVisible: false,
                  isBursaryClubVisible: false,
                  educationBeneficiary: lbseBeneficiary,
                  onEdit: () => {print("onEdit")},
                  onView: () => {print("onView")},
                  onCardToggle: () => onCardToggle(context, lbseBeneficiary.id),
                  onOpenLbseLearningOutcome: () =>
                      {print("onOpenLbseLearningOutcome")},
                  onOpenLbseReferral: () => {print("onOpenLbseReferral")},
                ),
              ),
              pagingController:
                  educationLbseInterventionState.pagingController!,
              emptyListWidget: _getEmptyListContainer(context),
              errorWidget: _getEmptyListContainer(context),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EducationLbseInterventionState>(
      builder: (context, educationLbseInterventionState, child) {
        return SubModuleHomeContainer(
          header:
              '$title : ${educationLbseInterventionState.numberOfEducationLbse} beneficiaries',
          bodyContents: _buildBody(),
        );
      },
    );
  }
}
