import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/constant/non_agyw_hts_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/pages/non_agyw_dreams_hts_consent_form.dart';
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
        return NonAgywDreamsHTSConsentForm();
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
          return CustomPaginatedListView(
              childBuilder: (context, agywBeneficiary, child) {
                List dataObject =
                    agywBeneficiary.trackeEntityInstanceData.attributes;

                            List filteredDataObject = dataObject.where((element) => element['attribute'] == NonAgywDreamsHTSConstant.hivResultStatus).toList();
                            bool isBeneficiaryHIVNegative = false;
                            if(filteredDataObject.isNotEmpty){
                                isBeneficiaryHIVNegative = filteredDataObject.first['value'] == 'Negative';
                            }
                            return DreamsBeneficiaryCard(
                              isAgywEnrollment: false,
                              agywDream: agywBeneficiary,
                              canEdit: canEdit,
                              canExpand: canExpand,
                              beneficiaryName: agywBeneficiary.toString(),
                              canView: canView,
                              isExpanded:
                                  agywBeneficiary.primaryUIC == toggleCardId,
                              onCardToogle: () {
                                onCardToogle(agywBeneficiary.primaryUIC);
                              },
                              cardBody: DreamBeneficiaryCardBody(
                                  agywBeneficiary: agywBeneficiary,
                                  isVerticalLayout:
                                      agywBeneficiary.primaryUIC ==
                                          toggleCardId),
                              cardBottonActions: isBeneficiaryHIVNegative
                                  ? Container(
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xFF1F8ECE),
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(),
                              cardBottonContent: Container(),
                            );
                          }).toList(),
                        ));
        },
      ),
    );
  }
}
