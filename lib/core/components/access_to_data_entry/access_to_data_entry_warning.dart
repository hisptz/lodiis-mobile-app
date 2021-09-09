import 'dart:io' show Platform, exit;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/access_to_data_entry/access_to_data_entry_action_button.dart';
import 'package:kb_mobile_app/core/components/access_to_data_entry/access_to_data_entry_message.dart';
import 'package:kb_mobile_app/core/utils/app_bar_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class AccessToDataEntryWarning extends StatelessWidget {
  const AccessToDataEntryWarning({
    Key? key,
  }) : super(key: key);

  void onLogout(BuildContext context) {
    AppBarUtil.onLogOut(context);
  }

  void onCloseApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<CurrentUserState>(
        builder: (context, currentUserState, child) {
          CurrentUser? currentUser = currentUserState.currentUser;
          return Consumer<InterventionCardState>(
              builder: (context, interventionCardState, child) {
            InterventionCard activeInterventionProgram =
                interventionCardState.currentInterventionProgram;
            return Container(
              decoration: BoxDecoration(
                color: activeInterventionProgram.background,
              ),
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AccessToDataEntryMessage(
                      message: "Hello ${currentUser?.name},",
                      color: Color(0xFFFAFAFA),
                    ),
                    AccessToDataEntryMessage(
                      message:
                          "Your account has some problems on enrolling or providing services to beneficiaries, kindly contact your supervisor or system administartor to correct the access",
                      color: Colors.redAccent,
                    ),
                    AccessToDataEntryActionButton(
                      activeInterventionProgram: activeInterventionProgram,
                      onLogout: () => onLogout(context),
                      onCloseApp: onCloseApp,
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
