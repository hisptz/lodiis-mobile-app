import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/pages/none_agyw_enrollment_client_intake_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/sub_pages/none_agyw_prep/none_agyw_prep.dart';
import 'package:provider/provider.dart';

class NoneAgyw extends StatefulWidget {
  const NoneAgyw({Key key}) : super(key: key);

  @override
  _NoneAgywState createState() => _NoneAgywState();
}

class _NoneAgywState extends State<NoneAgyw> {
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

  void onOpenPrep(BuildContext context, AgywDream agywDream) {
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywDream);
    Provider.of<ServiveEventDataState>(context, listen: false)
        .resetServiceEventDataState(agywDream.id);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoneAgywPrep(),
        ));
  }

  void onAddNoneAgywBeneficiary(BuildContext context) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return NoneAgywEnrollmentClientInTakeForm();
      },
    ));
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

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Consumer<DreamsInterventionListState>(
        builder: (context, dreamInterventionListState, child) {
          bool isLoading = dreamInterventionListState.isLoading;
          List<AgywDream> noneAgywDreamsInterventionList =
              dreamInterventionListState.noneAgywDreamsInterventionList;
          return isLoading
              ? Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: CircularProcessLoader(color: Colors.blueGrey),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: noneAgywDreamsInterventionList.length == 0
                      ? Center(
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                    'There is no beneficiary list at a moment'),
                              ),
                              Container(
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/icons/add-beneficiary.svg',
                                    color: Colors.blueGrey,
                                  ),
                                  onPressed: () =>
                                      onAddNoneAgywBeneficiary(context),
                                ),
                              )
                            ],
                          ),
                        )
                      : Column(
                          children: noneAgywDreamsInterventionList
                              .map((AgywDream agywBeneficiary) {
                            return DreamsBeneficiaryCard(
                              isAgywEnrollment: false,
                              agywDream: agywBeneficiary,
                              canEdit: canEdit,
                              canExpand: canExpand,
                              beneficiaryName: agywBeneficiary.toString(),
                              canView: canView,
                              isExpanded:
                                  agywBeneficiary.benefecaryId == toggleCardId,
                              onCardToogle: () {
                                onCardToogle(agywBeneficiary.benefecaryId);
                              },
                              cardBody: DreamBeneficiaryCardBody(
                                  agywBeneficiary: agywBeneficiary,
                                  isVerticalLayout:
                                      agywBeneficiary.benefecaryId ==
                                          toggleCardId),
                              cardBottonActions: Container(
                                child: Column(
                                  children: [
                                    LineSeperator(
                                      color: Color(0xFFE9F4FA),
                                    ),
                                    Container(
                                      child: MaterialButton(
                                        onPressed: () => onOpenPrep(
                                          context,
                                          agywBeneficiary,
                                        ),
                                        child: Text('PREP',
                                            style: TextStyle().copyWith(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF1F8ECE),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              cardBottonContent: Container(),
                            );
                          }).toList(),
                        ));
        },
      ),
    );
  }
}
