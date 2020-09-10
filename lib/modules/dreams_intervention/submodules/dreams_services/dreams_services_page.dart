import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_card_body.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_home_container.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/components/service_card_botton_action.dart';

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

  void onOpenAssessmentForm() {}

  void onOpenServiceForm() {}

  void onOpenPrepForm() {}

  @override
  Widget build(BuildContext context) {
    return DreamsHomeContainer(header: title, bodyContents: _buildBody());
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.only(
        top: 16.0,
      ),
      child: Column(
        children: ['1', '2', '3', '4']
            .map((String cardId) => DreamsBeneficiaryCard(
                  canEdit: canEdit,
                  canExpand: canExpand,
                  canView: canView,
                  isExpanded: cardId == toggleCardId,
                  onCardToogle: () {
                    onCardToogle(cardId);
                  },
                  cardBody: DreamBeneficiaryCardBody(
                    isVerticalLayout: cardId == toggleCardId,
                  ),
                  cardBottonActions: ServiceCardBottonAction(
                    onOpenAssessmentForm: onOpenAssessmentForm,
                    onOpenServiceForm: onOpenServiceForm,
                    onOpenPrepForm: onOpenPrepForm,
                  ),
                  cardBottonContent: Container(),
                ))
            .toList(),
      ),
    );
  }
}
