import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
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
  final bool isIncomingReferral = false;

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
          isIncomingReferral: isIncomingReferral,
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

    var primaryColor =
        Provider.of<InterventionCardState>(context, listen: false)
            .currentInterventionProgram
            .primaryColor;

    AppUtil.showActionSheetModal(
        context: context,
        containerBody: DreamsOutgoingReferralsOutcome(
          agywList: agywList,
          isIncomingReferral: isIncomingReferral,
        ),
        title: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Beneficiaries with referral outcome',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14.0,
                    color: primaryColor ?? Colors.black),
              ),
            ),
            LineSeparator(
              color: primaryColor ?? Colors.black,
              height: 1.0,
            ),
          ],
        ),
        initialHeightRatio: 0.8,
        minHeightRatio: 0.8,
        maxHeightRatio: 0.85);
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
            showFilter: true,
            onOpenInfo: () => onViewOutgoingReferralWithOutcome(context),
            hasInfo: incomingReferralsResolved != '',
            bodyContents: _buildBody(),
          );
        });
      },
    );
  }

  Widget _buildBody() {
    return Consumer<ReferralNotificationState>(
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
            cardButtonActions: Column(
              children: [
                const LineSeparator(
                  color: Color(0xFFE9F4FA),
                ),
                MaterialButton(
                  onPressed: () => onOpenReferralForm(
                    context,
                    agywBeneficiary,
                  ),
                  child: Text(
                    'REFERRAL',
                    style: const TextStyle().copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1F8ECE),
                    ),
                  ),
                )
              ],
            ),
            cardButtonContent: Container(),
          ),
          pagingController: dreamInterventionListState.agywPagingController,
          emptyListWidget: const Center(
            child: Text(
              'There is no beneficiary list at a moment',
            ),
          ),
          errorWidget: const Center(
            child: Text(
              'There is no beneficiary list at a moment',
            ),
          ),
        );
      });
    });
  }
}
