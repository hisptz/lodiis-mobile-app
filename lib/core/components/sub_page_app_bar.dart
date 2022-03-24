import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_bar_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';

class SubPageAppBar extends StatelessWidget {
  const SubPageAppBar({
    Key? key,
    required this.label,
    required this.activeInterventionProgram,
    this.disableSelectionOfActiveIntervention = true,
  }) : super(key: key);

  final String label;
  final InterventionCard activeInterventionProgram;
  final bool disableSelectionOfActiveIntervention;

  void onOpenMoreMenu(
      BuildContext context, InterventionCard activeInterventionProgram) async {
    AppBarUtil.onOpenMoreMenu(context, activeInterventionProgram,
        disableSelectionOfActiveIntervention);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        label,
        style: const TextStyle()
            .copyWith(fontSize: 19.0, fontWeight: FontWeight.bold),
      ),
      backgroundColor: activeInterventionProgram.primaryColor,
      actions: [
        Visibility(
          visible: disableSelectionOfActiveIntervention,
          child: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () =>
                  onOpenMoreMenu(context, activeInterventionProgram)),
        )
      ],
    );
  }
}
