import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/ogac_intervention_list_state/ogac_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/intervention_pop_up_menu.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/dreams_intervention.dart';
import 'package:kb_mobile_app/modules/language_selection/language_selection.dart';
import 'package:kb_mobile_app/modules/login/login.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/ogac_intervention.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/ovc_intervention.dart';
import 'package:kb_mobile_app/modules/synchronization/synchronization.dart';
import 'package:provider/provider.dart';

class AppBarUtil {
  static void onOpenMoreMenu(
    BuildContext context,
    InterventionCard activeInterventionProgram,
    final bool disableSelectionOfActiveIntervention,
  ) async {
    var modal = InterventionPopUpMenu(
      activeInterventionProgram: activeInterventionProgram,
      disableSelectionOfActiveIntervention:
          disableSelectionOfActiveIntervention,
    );
    var response = await AppUtil.showPopUpModal(context, modal, false);
    if (response != null) {
      if (response.id == 'dreams' ||
          response.id == 'ovc' ||
          response.id == 'ogac') {
        _onSwitchToIntervention(context, response.id);
      } else if (response.id == 'logout') {
        _onLogOut(context);
      } else if (response.id == 'sync') {
        _onOpenSyncModule(context);
      } else if (response.id == 'language_setting') {
        _onOpenLanguageSettingModule(context);
      }
    }
  }

  static void _onOpenLanguageSettingModule(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LanguageSelection(
          showLanguageSettingAppBar: true,
        ),
      ),
    );
  }

  static void _onOpenSyncModule(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Synchronization(),
      ),
    );
  }

  static void _onLogOut(BuildContext context) async {
    await UserService().logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  static void _onSwitchToIntervention(BuildContext context, String id) {
    if (id == 'ovc') {
      Provider.of<OvcInterventionListState>(context, listen: false)
          .refreshOvcList();
    } else if (id == 'dreams') {
      Provider.of<DreamsInterventionListState>(context, listen: false)
          .refreshDreamsList();
    } else if (id == 'ogac') {
      Provider.of<OgacInterventionListState>(context, listen: false)
          .refreshOgacList();
    }
    Provider.of<IntervetionCardState>(context, listen: false)
        .setCurrentInterventionProgramId(id);
    Provider.of<InterventionBottomNavigationState>(context, listen: false)
        .setCurrentInterventionBottomNavigationStatus(0, null);
    Timer(
      Duration(milliseconds: 10),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return id == 'ovc'
                ? OvcIntervention()
                : id == 'ogac'
                    ? OgacIntervention()
                    : DreamsIntervention();
          },
        ),
      ),
    );
  }
}
