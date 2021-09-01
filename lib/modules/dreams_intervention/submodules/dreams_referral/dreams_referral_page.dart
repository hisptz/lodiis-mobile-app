import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/referral_notification_state/referral_notification_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/agyw_dreams_enrollment_service.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/components/dreams_outgoing_referrals_outcome.dart';
import 'package:provider/provider.dart';
import 'pages/dream_referral_page_home.dart';

class DreamsReferralPage extends StatefulWidget {
  const DreamsReferralPage({Key? key}) : super(key: key);
  @override
  _DreamsReferralPageState createState() => _DreamsReferralPageState();
}

class _DreamsReferralPageState extends State<DreamsReferralPage> {
  final String title = 'BENEFICIARY LIST';
  final bool canEdit = false;
  final bool canView = false;
  final bool canExpand = true;
  final bool isIncommingReferral = false;

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

  void onOpenReferralForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    Provider.of<DreamsBeneficiarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywBeneficiary);
    Provider.of<ServiceEventDataState>(context, listen: false)
        .resetServiceEventDataState(agywBeneficiary.id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DreamsAgywReferralPage(
          isIncommingReferral: isIncommingReferral,
        ),
      ),
    );
  }

  void onViewOutgoingReferralWithOutcome(BuildContext context) async {
    List<String> incomingTeiWithOutcome =
        Provider.of<ReferralNotificationState>(context, listen: false)
            .teiWithIncomingResolvedReferrals;
    List<AgywDream> agywList = await AgywDreamsEnrollmentService()
        .getAgywBenficiariesWithIncomingReferralList(
            teiList: incomingTeiWithOutcome);
    Widget modal = DreamsOutgoingReferralsOutcome(
      agywList: agywList,
      isIncommingReferral: isIncommingReferral,
    );
    await AppUtil.showPopUpModal(context, modal, false,
        title: 'Beneficiaries with referral outcome');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DreamsInterventionListState>(
      builder: (context, dreamInterventionListState, child) {
        return Consumer<ReferralNotificationState>(
            builder: (context, referralNotificationState, child) {
          String incomingReferralsResolved =
              referralNotificationState.incomingReferralsResolvedIndicator;
          return SubModuleHomeContainer(
            header:
                '$title : ${dreamInterventionListState.numberOfAgywDreamsBeneficiaries} beneficiaries',
            onOpenInfo: () => onViewOutgoingReferralWithOutcome(context),
            hasInfo: incomingReferralsResolved != '',
            bodyContents: _buildBody(),
          );
        });
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
                onCardToggle(
                  context,
                  agywBeneficiary.id,
                );
              },
              cardBody: DreamsBeneficiaryCardBody(
                agywBeneficiary: agywBeneficiary,
                canViewServiceCategory: true,
                isVerticalLayout: agywBeneficiary.id == toggleCardId,
              ),
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
                        child: Text(
                          'REFERRAL',
                          style: TextStyle().copyWith(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F8ECE),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              cardButtonContent: Container(),
            ),
            pagingController: dreamInterventionListState.agywPagingController,
            emptyListWidget: Center(
              child: Text(
                'There is no beneficiary list at a moment',
              ),
            ),
            errorWidget: Center(
              child: Text(
                'There is no beneficiary list at a moment',
              ),
            ),
          );
        });
      }),
    );
  }
}
