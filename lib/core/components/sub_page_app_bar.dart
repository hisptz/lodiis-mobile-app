import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/intervention_pop_up_menu.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/dreams_intervention.dart';
import 'package:kb_mobile_app/modules/login/login.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/ovc_intervention.dart';
import 'package:provider/provider.dart';

class SubPageAppBar extends StatelessWidget {
  const SubPageAppBar({
    Key key,
    @required this.label,
    @required this.activeInterventionProgram,
  }) : super(key: key);

  final String label;
  final InterventionCard activeInterventionProgram;

  @override
  Widget build(BuildContext context) {
// state controllers
    IntervetionCardState intervetionCardState =
        Provider.of<IntervetionCardState>(context, listen: false);
    InterventionBottomNavigationState interventionBottomNavigationState =
        Provider.of<InterventionBottomNavigationState>(context, listen: false);

    void onLogOut() async {
      await UserService().logout();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    }

    void onSwitchToIntervention(String id) {
      intervetionCardState.setCurrentInterventionProgramId(id);
      interventionBottomNavigationState
          .setCurrentInterventionBottomNavigationIndex(0);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  id == 'ovc' ? OvcIntervention() : DreamsIntervention()));
    }

    void onOpenMoreMenu(InterventionCard activeInterventionProgram) async {
      var modal = InterventionPopUpMenu(
          activeInterventionProgram: activeInterventionProgram);
      var response = await AppUtil.showPopUpModal(context, modal);
      if (response != null) {
        if (response.id == 'dreams' || response.id == 'ovc') {
          onSwitchToIntervention(response.id);
        } else if (response.id == 'logout') {
          onLogOut();
        }
      }
    }

    return AppBar(
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
              onPressed: () => onOpenMoreMenu(activeInterventionProgram)),
        )
      ],
    );
  }
}
