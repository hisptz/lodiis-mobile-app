import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_dreams_consent.dart';
import 'package:provider/provider.dart';

class DreamsEnrollmentPage extends StatefulWidget {
  const DreamsEnrollmentPage({Key key}) : super(key: key);

  @override
  _DreamsEnrollmentPageState createState() => _DreamsEnrollmentPageState();
}

class _DreamsEnrollmentPageState extends State<DreamsEnrollmentPage> {
  final String title = 'BENEFICIARY LIST';
  final bool canEdit = true;
  final bool canView = true;
  final bool canExpand = true;

  String toggleCardId = '';

  void onCardToogle(String cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
  }

  void onAddAgywBeneficiary(BuildContext context) {
    //@TODO logics for checking app resumefunctionalities
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AgywDreamsConsentForm();
        },
      ),
    );
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
              onCardToogle: () {
                onCardToogle(agywBeneficiary.id);
              },
              cardBody: DreamBeneficiaryCardBody(
                  agywBeneficiary: agywBeneficiary,
                  isVerticalLayout: agywBeneficiary.id == toggleCardId),
              cardBottonActions: Container(),
              cardBottonContent: Container(),
            ),
            pagingController: dreamInterventionListState.agywPagingController,
            emptyListWidget: Column(
              children: [
                Center(
                  child: Text(
                    'There is no beneficiary list at a moment',
                  ),
                ),
                Center(
                  child: Container(
                    child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/add-beneficiary.svg',
                        color: Colors.blueGrey,
                      ),
                      onPressed: () => onAddAgywBeneficiary(context),
                    ),
                  ),
                )
              ],
            ),
            errorWidget: Center(
              child: Text(
                'Error in loading beneficiary list ',
              ),
            ),
          );
        },
      ),
    );
  }
}
