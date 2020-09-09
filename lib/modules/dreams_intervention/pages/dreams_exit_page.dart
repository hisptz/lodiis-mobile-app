import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_home_container.dart';

class DreamsExitPage extends StatefulWidget {
  const DreamsExitPage({Key key}) : super(key: key);

  @override
  _DreamsExitPageState createState() => _DreamsExitPageState();
}

class _DreamsExitPageState extends State<DreamsExitPage> {
  final String title = 'BENEFICIARY LIST';
  final bool canEdit = false;
  final bool canView = false;
  final bool canExpand = true;

  String toggleCardId = '';

  void onCardToogle(String cardId) {
    setState(() {
      toggleCardId = cardId != toggleCardId ? cardId : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return DreamsHomeContainer(header: title, bodyContents: _buildBody());
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
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
                  cardBody: Container(
                    child: cardId == toggleCardId
                        ? Column(
                            children: [Text('Body - vertical')],
                          )
                        : Row(
                            children: [Text('Body - horizontal')],
                          ),
                  ),
                  cardBottonActions: Container(),
                  cardBottonContent: cardId == toggleCardId
                      ? Container(
                          child: Text('cardBottonContent'),
                        )
                      : Container(),
                ))
            .toList(),
      ),
    );
  }
}
