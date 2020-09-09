import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_card_header.dart';

class DreamsBeneficiaryCard extends StatelessWidget {
  const DreamsBeneficiaryCard({
    Key key,
    @required this.canEdit,
    @required this.canView,
    @required this.canExpand,
    @required this.isExpanded,
    @required this.cardBody,
    @required this.cardBottonActions,
    @required this.cardBottonContent,
    this.onCardToogle,
  }) : super(key: key);

  final Widget cardBody;
  final Widget cardBottonActions;
  final Widget cardBottonContent;
  final bool canEdit;
  final bool canView;
  final bool canExpand;
  final bool isExpanded;

  final VoidCallback onCardToogle;

  final String svgIcon = 'assets/icons/dreams-header-icon.svg';
  final String beneficiaryName = 'Amohelang Thuso';

  void onEdit() {}

  void onView() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0, right: 13.0, left: 13.0),
      child: Material(
        type: MaterialType.card,
        elevation: 1.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Container(
          child: Column(
            children: [
              DreamBeneficiaryCardHeader(
                svgIcon: svgIcon,
                beneficiaryName: beneficiaryName,
                canEdit: canEdit,
                canExpand: canExpand,
                canView: canView,
                isExpanded: isExpanded,
                onToggleCard: onCardToogle,
              ),
              cardBody,
              cardBottonActions,
              Visibility(
                  visible: isExpanded,
                  child: Row(
                    children: [cardBottonContent],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
