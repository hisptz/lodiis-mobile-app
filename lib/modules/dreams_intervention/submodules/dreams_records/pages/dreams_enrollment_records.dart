import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card_body.dart';
import 'package:provider/provider.dart';

class DreamsEnrollmentRecords extends StatefulWidget {
  const DreamsEnrollmentRecords({Key? key}) : super(key: key);

  @override
  _DreamsEnrollmentRecordsState createState() =>
      _DreamsEnrollmentRecordsState();
}

class _DreamsEnrollmentRecordsState extends State<DreamsEnrollmentRecords> {
  final String title = 'AGYW/DREAMS BENEFICIARY';
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
                canViewServiceCategory: false,
                isVerticalLayout: agywBeneficiary.id == toggleCardId,
              ),
              cardButtonActions: Container(),
              cardButtonContent: Container(),
            ),
            pagingController: dreamInterventionListState.agywPagingController,
            emptyListWidget: Column(
              children: [
                Center(
                  child: Text(
                    'There is no beneficiary list at a moment',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            errorWidget: Center(
              child: Text(
                'Error in loading beneficiary list ',
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
