import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_re_assessment_list_state.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card_body.dart';
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

  @override
  Widget build(BuildContext context) {
    return Consumer<DreamsRaAssessmentListState>(
      builder: (context, dreamsRaAssessmentListState, child) {
        return RefreshIndicator(
          onRefresh: () async {
            dreamsRaAssessmentListState.refreshList();
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
