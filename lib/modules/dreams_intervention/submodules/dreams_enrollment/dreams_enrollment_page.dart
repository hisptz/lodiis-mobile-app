import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_home_container.dart';
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

  @override
  Widget build(BuildContext context) {
    return DreamsHomeContainer(header: title, bodyContents: _buildBody());
  }

  //DreamsInterventionListState

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Consumer<DreamsInterventionListState>(
        builder: (context, dreamInterventionListState, child) {
          bool isLoading = dreamInterventionListState.isLoading;

          List<AgywDream> agywDream = dreamInterventionListState.agywDreamList;

          return isLoading
              ? Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: CircularProcessLoader(color: Colors.blueGrey),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: agywDream.length == 0
                      ? Center(
                          child:
                              Text('There is no beneficiary list at a moment'),
                        )
                      : Column(
                          children: agywDream.map((AgywDream agywDream) {
                            return DreamsBeneficiaryCard(
                              canEdit: canEdit,
                              canExpand: canExpand,
                              beneficiaryName: agywDream.firstname +
                                  ' ' +
                                  agywDream.middlename +
                                  ' ' +
                                  agywDream.surname,
                              canView: canView,
                              isExpanded:
                                  agywDream.benefecaryId == toggleCardId,
                              onCardToogle: () {
                                onCardToogle(agywDream.benefecaryId);
                              },
                              cardBody: DreamBeneficiaryCardBody(
                                  agywDream: agywDream,
                                  isVerticalLayout:
                                      agywDream.benefecaryId == toggleCardId),
                              cardBottonActions: Container(),
                              cardBottonContent: Container(),
                            );
                          }).toList(),
                        ));
        },
      ),
    );
  }
}
