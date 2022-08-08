import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_re_assessment_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/agyw_dreams_common_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_dreams_re_assessment_form.dart';
import 'package:provider/provider.dart';

class AgywDreamForReAssessment extends StatefulWidget {
  const AgywDreamForReAssessment({Key? key}) : super(key: key);

  @override
  State<AgywDreamForReAssessment> createState() =>
      _AgywDreamForReAssessmentState();
}

class _AgywDreamForReAssessmentState extends State<AgywDreamForReAssessment> {
  final bool canEdit = true;

  final bool canView = true;

  final bool canExpand = true;

  String? toggleCardId = '';

  void onCardToggle(BuildContext context, String? trackedEntityInstance) {
    setState(() {
      toggleCardId = canExpand && trackedEntityInstance != toggleCardId
          ? trackedEntityInstance
          : '';
    });
  }

  void onReAssess(BuildContext context, AgywDream agywDream) {
    Provider.of<DreamsBeneficiarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywDream);
    Provider.of<ServiceEventDataState>(context, listen: false)
        .resetServiceEventDataState(agywDream.id);
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: true);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsReAssessmentForm(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DreamsRaAssessmentListState>(
      builder: (context, dreamsRaAssessmentListState, child) {
        return RefreshIndicator(
          onRefresh: () async {
            dreamsRaAssessmentListState.refreshBeneficiariesNumber();
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
              cardButtonActions: Column(
                children: [
                  const LineSeparator(
                    color: Color(0xFFE9F4FA),
                  ),
                  MaterialButton(
                    onPressed: () => onReAssess(
                      context,
                      agywBeneficiary,
                    ),
                    child: Text(
                      'RE-ASSESS',
                      style: const TextStyle().copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: AgywDreamsCommonConstant.defaultColor,
                      ),
                    ),
                  )
                ],
              ),
              cardButtonContent: Container(),
            ),
            pagingController: dreamsRaAssessmentListState.pagingController,
            emptyListWidget: Column(
              children: const [
                Center(
                  child: Text(
                    'There is no beneficiary list at a moment',
                  ),
                ),
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
