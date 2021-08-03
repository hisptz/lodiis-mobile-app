import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/referral_notification_state/referral_notification_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:provider/provider.dart';
import 'pages/dream_referral_page_home.dart';

class DreamsIncomingReferralPage extends StatefulWidget {
  const DreamsIncomingReferralPage({Key key}) : super(key: key);
  @override
  _DreamsIncomingReferralPageState createState() =>
      _DreamsIncomingReferralPageState();
}

class _DreamsIncomingReferralPageState
    extends State<DreamsIncomingReferralPage> {
  final String title = 'BENEFICIARY LIST';
  final bool canEdit = false;
  final bool canView = false;
  final bool canExpand = true;

  String toggleCardId = '';

  void onCardToggle(String cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
  }

  void onOpenReferralForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    Provider.of<DreamBeneficiarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywBeneficiary);
    Provider.of<ServiceEventDataState>(context, listen: false)
        .resetServiceEventDataState(agywBeneficiary.id);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DreamAgywReferralPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DreamsInterventionListState>(
      builder: (context, dreamInterventionListState, child) {
        return SubModuleHomeContainer(
          header:
              '$title : ${dreamInterventionListState.numberOfAgywDreamsIncomingReferralBeneficiaries} beneficiaries',
          bodyContents: _buildBody(),
        );
      },
    );
  }

  Widget _buildBody() {
    return Container(
      child: Consumer<ReferralNotificationState>(
          builder: (context, referralNotificationState, child) {
        return Consumer<DreamsInterventionListState>(
            builder: (context, dreamInterventionListState, child) {
          return CustomPaginatedListView(
              childBuilder: (context, agywBeneficiary, child) =>
                  DreamsBeneficiaryCard(
                    isAgywEnrollment: false,
                    agywDream: agywBeneficiary,
                    canEdit: canEdit,
                    canExpand: canExpand,
                    beneficiaryName: agywBeneficiary.toString(),
                    canView: canView,
                    isExpanded: agywBeneficiary.id == toggleCardId,
                    onCardToggle: () {
                      onCardToggle(agywBeneficiary.id);
                    },
                    cardBody: DreamBeneficiaryCardBody(
                        agywBeneficiary: agywBeneficiary,
                        isVerticalLayout: agywBeneficiary.id == toggleCardId),
                    cardButtonActions: Container(
                      child: Column(
                        children: [
                          LineSeparator(
                            color: Color(0xFFE9F4FA),
                          ),
                          Container(
                            child: MaterialButton(
                              onPressed: () => onOpenReferralForm(
                                context,
                                agywBeneficiary,
                              ),
                              child: Text('REFERRAL',
                                  style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1F8ECE),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    cardButtonContent: Container(),
                  ),
              pagingController: dreamInterventionListState
                  .agywIncomingReferralPagingController,
              emptyListWidget: Center(
                child: Text(
                  'There is no beneficiary list at a moment',
                ),
              ),
              errorWidget: Center(
                child: Text(
                  'There is no beneficiary list at a moment',
                ),
              ));
        });
      }),
    );
  }
}
