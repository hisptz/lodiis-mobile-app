import 'dart:async';

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

class AppBarUtil {
  static void onOpenMoreMenu(
      BuildContext context, InterventionCard activeInterventionProgram) async {
    var modal = InterventionPopUpMenu(
        activeInterventionProgram: activeInterventionProgram);
    var response = await AppUtil.showPopUpModal(context, modal);
    if (response != null) {
      if (response.id == 'dreams' || response.id == 'ovc') {
        _onSwitchToIntervention(context, response.id);
      } else if (response.id == 'logout') {
        _onLogOut(context);
      }
    }
  }

  static void _onLogOut(BuildContext context) async {
    await UserService().logout();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  static void _onSwitchToIntervention(BuildContext context, String id) {
    Provider.of<IntervetionCardState>(context, listen: false)
        .setCurrentInterventionProgramId(id);
    Provider.of<InterventionBottomNavigationState>(context, listen: false)
        .setCurrentInterventionBottomNavigationIndex(0);
    Timer(
        Duration(milliseconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    id == 'ovc' ? OvcIntervention() : DreamsIntervention())));
  }
}
