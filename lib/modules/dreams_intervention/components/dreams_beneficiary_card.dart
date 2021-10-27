import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_dreams_enrollment_edit_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agwy_dreams_enrollment_view_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/pages/none_agyw_enrollment_edit_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/pages/none_agyw_enrollment_view_form.dart';
import 'package:provider/provider.dart';

class DreamsBeneficiaryCard extends StatelessWidget {
  const DreamsBeneficiaryCard({
    Key? key,
    required this.canEdit,
    required this.canView,
    required this.canExpand,
    required this.isExpanded,
    required this.beneficiaryName,
    required this.cardBody,
    required this.cardButtonActions,
    required this.cardButtonContent,
    required this.agywDream,
    required this.isAgywEnrollment,
    this.onCardToggle,
  }) : super(key: key);

  final Widget cardBody;
  final Widget cardButtonActions;
  final Widget cardButtonContent;
  final bool canEdit;
  final bool canView;
  final bool canExpand;
  final bool isExpanded;
  final String beneficiaryName;
  final AgywDream agywDream;
  final bool isAgywEnrollment;
  final VoidCallback? onCardToggle;
  final String svgIcon = 'assets/icons/dreams-header-icon.svg';

  void onEdit(BuildContext context) async {
    String? beneficiaryId = agywDream.id;
    String formAutoSaveId = isAgywEnrollment
        ? "${DreamsRoutesConstant.agywEnrollmentFormEditPage}_$beneficiaryId"
        : "${DreamsRoutesConstant.noneAgywEnrollmentPage}_$beneficiaryId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges =
        await AppResumeRoute().shouldResumeWithUnSavedChanges(
      context,
      formAutoSave,
      beneficiaryName: agywDream.toString(),
    );
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      updateEnrollmentFormStateData(context, true);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => isAgywEnrollment
              ? AgywDreamsEnrollmentEditForm()
              : NoneAgywEnrollmentEditForm(),
        ),
      );
    }
  }

  void updateEnrollmentFormStateData(BuildContext context, bool edit) {
    TrackedEntityInstance teiData = agywDream.trackedEntityInstanceData!;
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Provider.of<EnrollmentFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: edit);
    Provider.of<EnrollmentFormState>(context, listen: false).setFormFieldState(
        'location', edit ? agywDream.orgUnit : agywDream.location);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('trackedEntityInstance', agywDream.id);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('orgUnit', agywDream.orgUnit);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('enrollment', agywDream.enrollment);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('enrollmentDate', agywDream.createdDate);
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('incidentDate', agywDream.createdDate);
    Provider.of<EnrollmentFormState>(context, listen: false).setFormFieldState(
        isAgywEnrollment ? 'KvmQjZbGZQU' : 'd8uBlGOpFhJ', agywDream.primaryUIC);

    for (Map attributeObj in teiData.attributes) {
      if (attributeObj['value'] != '' && '${attributeObj['value']}' != 'null') {
        Provider.of<EnrollmentFormState>(context, listen: false)
            .setFormFieldState(
                attributeObj['attribute'], attributeObj['value']);
      }
    }
  }

  void onView(BuildContext context) {
    updateEnrollmentFormStateData(context, false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => isAgywEnrollment
            ? AgywDreamsEnrollmentViewForm()
            : NoneAgywEnrollmentViewForm(),
      ),
    );
  }

  bool _syncStatusOfAgyw(
    AgywDream agywDream,
    List<String> unsyncedTeiReferences,
  ) {
    int teiIndex = unsyncedTeiReferences.indexOf(agywDream.id!);
    return teiIndex == -1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 16.0,
        right: 13.0,
        left: 13.0,
      ),
      child: MaterialCard(
        body: Container(
          child: Column(
            children: [
              Container(
                child: Consumer<SynchronizationStatusState>(
                    builder: (context, synchronizationStatusState, child) {
                  List<String> unsyncedTeiReferences =
                      synchronizationStatusState.unsyncedTeiReferences;
                  return DreamsBeneficiaryCardHeader(
                    svgIcon: svgIcon,
                    isSynced:
                        _syncStatusOfAgyw(agywDream, unsyncedTeiReferences),
                    beneficiaryName: beneficiaryName,
                    canEdit: canEdit,
                    canExpand: canExpand,
                    canView: canView,
                    isExpanded: isExpanded,
                    onToggleCard: onCardToggle,
                    onEdit: () => onEdit(context),
                    onView: () => onView(context),
                  );
                }),
              ),
              cardBody,
              cardButtonActions,
              Visibility(
                visible: isExpanded,
                child: Container(
                  child: cardButtonContent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
