import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_bar_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';

class OVCSubPageAppBar extends StatelessWidget {
  const OVCSubPageAppBar({
    Key key,
    @required this.label,
    @required this.activeInterventionProgram,
  }) : super(key: key);

  final String label;
  final InterventionCard activeInterventionProgram;

  void onOpenMoreMenu(
      BuildContext context, InterventionCard activeInterventionProgram) async {
    AppBarUtil.onOpenMoreMenu(context, activeInterventionProgram);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
              Navigator.pop(context);
           
          }),
      title: Text(
        label,
        style:
            TextStyle().copyWith(fontSize: 19.0, fontWeight: FontWeight.normal),
      ),
      backgroundColor: activeInterventionProgram.primmaryColor,
      actions: [
        Container(
          child: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () =>
                  onOpenMoreMenu(context, activeInterventionProgram)),
        )
      ],
    );
  }
}
