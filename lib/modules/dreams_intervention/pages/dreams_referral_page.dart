import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_home_container.dart';

class DreamsReferralPage extends StatelessWidget {
  const DreamsReferralPage({Key key}) : super(key: key);

  final String title = 'BENEFICIARY LIST';

  final bool canEdit = false;
  final bool canView = false;
  final bool canExpand = true;

  @override
  Widget build(BuildContext context) {
    return DreamsHomeContainer(header: title, bodyContents: _buildBody());
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          DreamsBeneficiaryCard(
            canEdit: canEdit,
            canExpand: canExpand,
            canView: canView,
            cardBody: null,
            cardBottonActions: null,
            cardBottonContent: null,
          ),
        ],
      ),
    );
  }
}
