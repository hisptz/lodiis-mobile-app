import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card_body.dart';
import 'package:provider/provider.dart';

class NonAgywRecords extends StatefulWidget {
  const NonAgywRecords({Key? key}) : super(key: key);

  @override
  State<NonAgywRecords> createState() => _NonAgywRecordsState();
}

class _NonAgywRecordsState extends State<NonAgywRecords> {
  final String title = 'BENEFICIARY LIST';
  final bool canEdit = false;
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

  void refreshBeneficiaryList(
      DreamsInterventionListState dreamInterventionListState) {
    dreamInterventionListState.refreshBeneficiariesNumber();
  }

  Widget _buildBody() {
    return Consumer<DreamsInterventionListState>(
        builder: (context, dreamInterventionListState, child) {
      return RefreshIndicator(
        onRefresh: () async {
          refreshBeneficiaryList(dreamInterventionListState);
        },
        child: CustomPaginatedListView(
          emptyListWidget: const Center(
            child: Column(
              children: [
                Text(
                  'There is no beneficiary list at a moment',
                ),
              ],
            ),
          ),
          errorWidget: const Center(
            child: Text(
              'There is no beneficiary list at a moment',
            ),
          ),
          pagingController: dreamInterventionListState.nonAgywPagingController,
          childBuilder: (context, beneficiary, child) {
            return DreamsBeneficiaryCard(
              isAgywEnrollment: false,
              agywDream: beneficiary,
              canEdit: canEdit,
              canExpand: canExpand,
              beneficiaryName: beneficiary.toString(),
              canView: canView,
              isExpanded: beneficiary.id == toggleCardId,
              onCardToggle: () {
                onCardToggle(
                  context,
                  beneficiary.id,
                );
              },
              cardBody: DreamsBeneficiaryCardBody(
                agywBeneficiary: beneficiary,
                canViewServiceCategory: false,
                isVerticalLayout: beneficiary.id == toggleCardId,
              ),
              cardButtonActions: Container(),
              cardButtonContent: Container(),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DreamsInterventionListState>(
      builder: (context, dreamInterventionListState, child) {
        return SubModuleHomeContainer(
          header:
              '$title : ${dreamInterventionListState.numberOfNoneAgywDreamsBeneficiaries} beneficiaries',
          bodyContents: _buildBody(),
        );
      },
    );
  }
}
