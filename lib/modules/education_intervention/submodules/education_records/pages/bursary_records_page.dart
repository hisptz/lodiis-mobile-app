import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/education_intervention_state/education_bursary_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/modules/education_intervention/components/education_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/pages/education_bursary_enrollment_view_page.dart';
import 'package:provider/provider.dart';

class BursaryRecordsPage extends StatefulWidget {
  const BursaryRecordsPage({Key? key}) : super(key: key);

  @override
  _BursaryRecordsPageState createState() => _BursaryRecordsPageState();
}

class _BursaryRecordsPageState extends State<BursaryRecordsPage> {
  final String title = 'BURSARY List';
  final bool canEdit = false;
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
    EducationBeneficiary bursaryBeneficiary,
    bool isEditableMode,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Provider.of<EnrollmentFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    Provider.of<EnrollmentFormState>(context, listen: false).setFormFieldState(
        'location',
        isEditableMode
            ? bursaryBeneficiary.orgUnit
            : bursaryBeneficiary.location);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('trackedEntityInstance', bursaryBeneficiary.id);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('orgUnit', bursaryBeneficiary.orgUnit);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('enrollment', bursaryBeneficiary.enrollment);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('enrollmentDate', bursaryBeneficiary.createdDate);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('incidentDate', bursaryBeneficiary.createdDate);
    if (bursaryBeneficiary.trackedEntityInstanceData != null) {
      for (Map attributeObj
          in bursaryBeneficiary.trackedEntityInstanceData!.attributes) {
        Provider.of<EnrollmentFormState>(context, listen: false)
            .setFormFieldState(
                attributeObj['attribute'], attributeObj['value']);
      }
    }
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
        ],
      ),
    );
  }

  Container _buildBody() {
    return Container(
      child: Container(
        child: Consumer<EducationBursaryInterventionState>(
          builder: (context, educationBursaryInterventionState, child) {
            return CustomPaginatedListView(
              childBuilder: (context, bursaryBeneficiary, child) => Container(
                child: EducationBeneficiaryCard(
                  canEdit: canEdit,
                  canView: canView,
                  canExpand: canExpand,
                  isExpanded: toggleCardId == bursaryBeneficiary.id,
                  isLbseLearningOutcomeVisible: false,
                  isLbseReferralVisible: false,
                  isBursarySchoolVisible: true,
                  isBursaryClubVisible: true,
                  educationBeneficiary: bursaryBeneficiary,
                  onView: () => onViewBeneficiary(context, bursaryBeneficiary),
                  onCardToggle: () =>
                      onCardToggle(context, bursaryBeneficiary.id),
                ),
              ),
              pagingController:
                  educationBursaryInterventionState.pagingController!,
              emptyListWidget: _getEmptyListContainer(context),
              errorWidget: _getEmptyListContainer(context),
            );
          },
        ),
      ),
    );
  }

  void onViewBeneficiary(
    BuildContext context,
    EducationBeneficiary educationBeneficiary,
  ) {
    bool isEditableMode = false;
    onUpdateFormState(context, educationBeneficiary, isEditableMode);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EducationBursaryEnrollmentViewPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EducationBursaryInterventionState>(
      builder: (context, educationBursaryInterventionState, child) {
        return SubModuleHomeContainer(
          header:
              '$title : ${educationBursaryInterventionState.numberOfEducationBursary} beneficiaries',
          bodyContents: _buildBody(),
        );
      },
    );
  }
}
