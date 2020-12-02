import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/components/service_card_botton_action.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/anc/agyw_dreams_anc.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/art_refill/agyw_dreams_art_refill.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/condoms/agyw_dreams_condoms.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/contraceptives/agyw_dreams_contraceptives.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hiv_prev/dreams_hiv_prev_home.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/msg_hiv/agyw_dreams_msg_hiv_register.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/pep/agyw_dreams_pep.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/post_gbv/agyw_dreams_post_gbv.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/agyw_dreams_prep.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/service_form/agyw_dreams_service_form_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/srh/agyw_dreams_srh.dart';
import 'package:provider/provider.dart';

import 'sub_modules/hts/hts_home_page.dart';

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

  void onCardToogle(
      BuildContext context, String cardId, String trackedEntityInstance) {
    Provider.of<ServiveEventDataState>(context, listen: false)
        .resetServiceEventDataState(trackedEntityInstance);
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
  }

  void onOpenHTSForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HTSHomePage()));
  }

  void onOpenSRHForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AgywDreamsSRH()));
  }

  void onOpenHIVPrepForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DreamsHIVPrevHome()));
  }

  void onOpenPrepForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);  
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AgywDreamsPrep()));
  }

  void onOpenMSGHIVForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamMSGHIVRegiser()));
  }

  void onOpenCondomForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AgywDreamCondoms()));
  }

  void onOpenContraceptivesForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamContraceptives()));
  }

  void onOpenANCForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AgywDreamANC()));
  }

  void onOpenPostGBVForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AgywDreamPostGBV()));
  }

  void onOpenArtRefillForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AgywDreamArtRefill()));
  }

  void onOpenPEPForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AgywDreamPEP()));
  }

  void onOpenServiceForm(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    updateStateData(context, agywBeneficiary);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamsServiceFormPage()));
  }

  void updateStateData(
    BuildContext context,
    AgywDream agywBeneficiary,
  ) {
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywBeneficiary);
    Provider.of<ServiveEventDataState>(context, listen: false)
        .resetServiceEventDataState(agywBeneficiary.id);
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: true);
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
                                  onCardToogle(
                                      context,
                                      agywBeneficiary.benefecaryId,
                                      agywBeneficiary.id);
                                },
                                cardBody: DreamBeneficiaryCardBody(
                                    agywBeneficiary: agywBeneficiary,
                                    canViewServiceCategory: true,
                                    isVerticalLayout:
                                        agywBeneficiary.benefecaryId ==
                                            toggleCardId),
                                cardBottonActions: ServiceCardBottonAction(
                                  onOpenPrepForm: () =>
                                      onOpenPrepForm(context, agywBeneficiary),
                                  onOpenHIVPrepForm: () => onOpenHIVPrepForm(
                                      context, agywBeneficiary),
      
                                  onOpenSRHForm: () =>
                                      onOpenSRHForm(context, agywBeneficiary),
                                  onOpenHTSForm: () =>
                                      onOpenHTSForm(context, agywBeneficiary),
                                  onOpenCondomForm: () => onOpenCondomForm(
                                      context, agywBeneficiary),
                                  onOpenContraceptivesForm: () =>
                                      onOpenContraceptivesForm(
                                          context, agywBeneficiary),
                                  onOpenMSGHIVForm: () => onOpenMSGHIVForm(
                                      context, agywBeneficiary),
                                  onOpenANCForm: () =>
                                      onOpenANCForm(context, agywBeneficiary),
                                  onOpenArtRefillForm: () =>
                                      onOpenArtRefillForm(
                                          context, agywBeneficiary),
                                  onOpenPEPForm: () =>
                                      onOpenPEPForm(context, agywBeneficiary),
                                  onOpenPostGBVForm: () => onOpenPostGBVForm(
                                      context, agywBeneficiary),
                                  onOpenServiceForm: () => onOpenServiceForm(
                                      context, agywBeneficiary),
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
