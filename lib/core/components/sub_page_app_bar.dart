import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_bar_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';

class SubPageAppBar extends StatelessWidget {
  const SubPageAppBar({
    Key key,
    @required this.label,
    this.isLeading = false,
    @required this.activeInterventionProgram,
  }) : super(key: key);

  final String label;
  final InterventionCard activeInterventionProgram;
  final bool isLeading;

  void onOpenMoreMenu(
      BuildContext context, InterventionCard activeInterventionProgram) async {
    AppBarUtil.onOpenMoreMenu(context, activeInterventionProgram);
  }
  void navigateBack(BuildContext context){
Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isLeading
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => navigateBack(context))
          : Text(" "),
      title: Text(
        label,
        style:
            TextStyle().copyWith(fontSize: 19.0, fontWeight: FontWeight.bold),
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
