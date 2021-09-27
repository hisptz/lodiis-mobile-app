import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/app_logs_state/app_logs_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/ogac_intervention_list_state/ogac_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/pp_prev_intervention_state/pp_prev_intervention_state.dart';
import 'package:kb_mobile_app/app_state/referral_notification_state/referral_notification_state.dart';
import 'package:kb_mobile_app/core/components/intervention_pop_up_menu.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/about_app/about_app.dart';
import 'package:kb_mobile_app/modules/app_logs/app_logs_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/dreams_intervention.dart';
import 'package:kb_mobile_app/modules/education_intervention/education_intervention.dart';
import 'package:kb_mobile_app/modules/language_selection/language_selection.dart';
import 'package:kb_mobile_app/modules/login/login.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/ogac_intervention.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/ovc_intervention.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/pp_prev_intervention.dart';
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
      List<String> interventionIds = InterventionCard.getInterventionIds();
      if (interventionIds.indexOf(response.id) > -1) {
        await _onSwitchToIntervention(context, response.id);
      } else if (response.id == 'logout') {
        onLogOut(context);
      } else if (response.id == 'sync') {
        _onOpenSyncModule(context);
      } else if (response.id == 'language_setting') {
        _onOpenLanguageSettingModule(context);
      } else if (response.id == 'about') {
        _onOpenAboutAppModule(context);
      } else if (response.id == 'application_logs') {
        _onOpenApplicationLogsModule(context);
      }
    }
  }

  static void _onOpenAboutAppModule(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AboutApp(),
      ),
    );
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

  static void onLogOut(BuildContext context) async {
    Provider.of<InterventionCardState>(context, listen: false)
        .resetCurrentInterventionProgram();
    Provider.of<InterventionBottomNavigationState>(context, listen: false)
        .resetCurrentInterventionBottomNavigationIndex();
    await UserService().logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  static Future<void> _onOpenApplicationLogsModule(BuildContext context) async {
    await Provider.of<AppLogsState>(context, listen: false)
        .refreshAppLogsNumber();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppLogsPage(),
      ),
    );
  }

  static Future<void> _onSwitchToIntervention(
    BuildContext context,
    String? id,
  ) async {
    if (id == 'ovc') {
      await Provider.of<OvcInterventionListState>(context, listen: false)
          .refreshOvcNumber();
    } else if (id == 'dreams') {
      List<String> teiWithIncomingReferral =
          Provider.of<ReferralNotificationState>(context, listen: false)
              .beneficiariesWithIncomingReferrals;
      Provider.of<DreamsInterventionListState>(context, listen: false)
          .setTeiWithIncomingReferral(
              teiWithIncomingReferral: teiWithIncomingReferral);
      await Provider.of<DreamsInterventionListState>(context, listen: false)
          .refreshBeneficiariesNumber();
    } else if (id == 'ogac') {
      await Provider.of<OgacInterventionListState>(context, listen: false)
          .refreshOgacNumber();
    } else if (id == 'ogac') {
      await Provider.of<OgacInterventionListState>(context, listen: false)
          .refreshOgacNumber();
    } else if (id == 'pp_prev') {
      await Provider.of<PpPrevInterventionListState>(context, listen: false)
          .refreshPpPrevList();
    } else if (id == 'education') {
      //@TODO refresg list of education module
    }
    Provider.of<InterventionCardState>(context, listen: false)
        .setCurrentInterventionProgramId(id);
    Provider.of<InterventionBottomNavigationState>(context, listen: false)
        .setCurrentInterventionBottomNavigationStatus(0, null);
    Timer(Duration(milliseconds: 10), () {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return id == 'ovc'
                ? OvcIntervention()
                : id == 'ogac'
                    ? OgacIntervention()
                    : id == 'pp_prev'
                        ? PpPrevIntervention()
                        : id == 'education'
                            ? EducationIntervention()
                            : DreamsIntervention();
          },
        ),
      );
    });
  }
}
