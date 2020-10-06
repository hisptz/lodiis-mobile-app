import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_home_container.dart';
import 'package:provider/provider.dart';

import 'sub_pages/non_agyw_prep.dart';

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

  void onPrep(BuildContext context, AgywDream agywDream) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NonAgywPrepPage(
            agywDream: agywDream,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return DreamsHomeContainer(header: title, bodyContents: _buildBody());
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
                          child:
                              Text('There is no beneficiary list at a moment'),
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
                                        onPressed: () => onPrep(
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
