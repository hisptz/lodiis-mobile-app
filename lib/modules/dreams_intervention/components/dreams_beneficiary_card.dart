import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/login_form_field_seperator.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_card_header.dart';

class DreamsBeneficiaryCard extends StatefulWidget {
  const DreamsBeneficiaryCard({
    Key key,
    @required this.canEdit,
    @required this.canView,
    @required this.canExpand,
    @required this.cardBody,
    @required this.cardBottonActions,
    @required this.cardBottonContent,
  }) : super(key: key);

  final Widget cardBody;
  final Widget cardBottonActions;
  final Widget cardBottonContent;
  final bool canEdit;
  final bool canView;
  final bool canExpand;

  @override
  _DreamsBeneficiaryCardState createState() => _DreamsBeneficiaryCardState();
}

class _DreamsBeneficiaryCardState extends State<DreamsBeneficiaryCard> {
  final String svgIcon = 'assets/icons/dreams-header-icon.svg';
  final String beneficiaryName = 'Amohelang Thuso';
  bool isExpanded;

  void onEdit() {}
  void onView() {}
  void onToggleCard() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    isExpanded = false;
  }

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
                canEdit: widget.canEdit,
                canExpand: widget.canExpand,
                canView: widget.canView,
                isExpanded: isExpanded,
                onToggleCard: onToggleCard,
              ),
              LineSeperator(
                color: Color(0xFFE9F4FA),
              ),
              Row(
                children: [Text('body')],
              ),
              Row(
                children: [Text('button actions')],
              ),
              Visibility(
                  visible: isExpanded,
                  child: Row(
                    children: [Text('bottom content')],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
