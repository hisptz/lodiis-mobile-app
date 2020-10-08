import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_home_container.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/components/service_card_botton_action.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/agyw_prep.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/srh/enrol_srh_page.dart';
import 'package:provider/provider.dart';
import 'sub_modules/hiv _reg/hiv_reg_page.dart';
import 'sub_modules/hiv_prev/dreams_hiv_prev_home.dart';
import 'sub_modules/hts/hts_page.dart';

class DreamsServicesPage extends StatefulWidget {
  const DreamsServicesPage({Key key}) : super(key: key);

  @override
  _DreamsServicesPageState createState() => _DreamsServicesPageState();
}

class _DreamsServicesPageState extends State<DreamsServicesPage> {
  final String title = 'BENEFICIARY LIST';
  final bool canEdit = false;
  final bool canView = false;
  final bool canExpand = true;

  String toggleCardId = '';

  void onCardToogle(String cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
  }

  void onOpenHTSForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywBeneficiary);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DreamHtsPage()));
  }

  void onOpenSRHForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywBeneficiary);
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DreamSrhPage()));
  }

  void onOpenHIVPrepForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywBeneficiary);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DreamsHIVPrevHome()));
  }

  void onOpenHIVRegForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywBeneficiary);
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DreamHIVRegPage()));
  }

  void onOpenPrepForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywBeneficiary);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DreamPrepPage()));
  }

  @override
  Widget build(BuildContext context) {
    return DreamsHomeContainer(header: title, bodyContents: _buildBody());
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        child: Consumer<DreamsInterventionListState>(
          builder: (context, dreamInterventionListState, child) {
            bool isLoading = dreamInterventionListState.isLoading;
            List<AgywDream> agywDreamsInterventionList =
                dreamInterventionListState.agywDreamsInterventionList;
            return isLoading
                ? Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: CircularProcessLoader(color: Colors.blueGrey),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: agywDreamsInterventionList.length == 0
                        ? Center(
                            child: Text(
                                'There is no beneficiary list at a moment'),
                          )
                        : Column(
                            children: agywDreamsInterventionList
                                .map((AgywDream agywBeneficiary) {
                              return DreamsBeneficiaryCard(
                                isAgywEnrollment: true,
                                agywDream: agywBeneficiary,
                                canEdit: canEdit,
                                canExpand: canExpand,
                                beneficiaryName: agywBeneficiary.toString(),
                                canView: canView,
                                isExpanded: agywBeneficiary.benefecaryId ==
                                    toggleCardId,
                                onCardToogle: () {
                                  onCardToogle(agywBeneficiary.benefecaryId);
                                },
                                cardBody: DreamBeneficiaryCardBody(
                                    agywBeneficiary: agywBeneficiary,
                                    isVerticalLayout:
                                        agywBeneficiary.benefecaryId ==
                                            toggleCardId),
                                cardBottonActions: ServiceCardBottonAction(
                                  onOpenPrepForm: () =>
                                      onOpenPrepForm(context, agywBeneficiary),
                                  onOpenHIVPrepForm: () => onOpenHIVPrepForm(
                                      context, agywBeneficiary),
                                  onOpenHIVRegForm: () => onOpenHIVRegForm(
                                      context, agywBeneficiary),
                                  onOpenSRHForm: () =>
                                      onOpenSRHForm(context, agywBeneficiary),
                                  onOpenHTSForm: () =>
                                      onOpenHTSForm(context, agywBeneficiary),
                                ),
                                cardBottonContent: Container(),
                              );
                            }).toList(),
                          ));
          },
        ),
      ),
    );
  }
}
