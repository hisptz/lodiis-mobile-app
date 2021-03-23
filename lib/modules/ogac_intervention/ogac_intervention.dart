import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/intervention_app_bar.dart';
import 'package:kb_mobile_app/core/constants/auto_synchronization.dart';
import 'package:kb_mobile_app/core/services/auto_synchronization_service.dart';
import 'package:kb_mobile_app/core/utils/app_bar_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/pages/ogac_enrollment_form.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/pages/ogac_intervention_home.dart';
import 'package:provider/provider.dart';

class OgacIntervention extends StatefulWidget {
  OgacIntervention({Key key}) : super(key: key);

  @override
  _OgacInterventionState createState() => _OgacInterventionState();
}

class _OgacInterventionState extends State<OgacIntervention> {
  final bool disableSelectionOfActiveIntervention = true;
  bool isViewReady = false;
  Timer periodicTimer;
  StreamSubscription connectionSubscription;
  int syncTimeout = AutoSynchronization.syncTimeout;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        isViewReady = true;
      });
    });
    connectionSubscription = AutoSynchronizationService()
        .checkChangeOfDeviceConnectionStatus(context);
    periodicTimer =
        Timer.periodic(Duration(minutes: syncTimeout), (Timer timer) {
      AutoSynchronizationService().startAutoDownload(context);
    });
  }

  @override
  void dispose() {
    periodicTimer.cancel();
    connectionSubscription.cancel();
    super.dispose();
  }

  void onOpenMoreMenu(
    BuildContext context,
    InterventionCard activeInterventionProgram,
  ) async {
    AppBarUtil.onOpenMoreMenu(
      context,
      activeInterventionProgram,
      disableSelectionOfActiveIntervention,
    );
  }

  void onClickHome() {
    // print('on onClickHome');
  }

  void onAddOgacBeneficiary(BuildContext context) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return OgacEnrollemntForm();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer<IntervetionCardState>(
        builder: (context, intervetionCardState, child) {
          InterventionCard activeInterventionProgram =
              intervetionCardState.currentIntervetionProgram;
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: InterventionAppBar(
                activeInterventionProgram: activeInterventionProgram,
                onClickHome: onClickHome,
                onAddOgacBeneficiary: () => onAddOgacBeneficiary(context),
                onOpenMoreMenu: () =>
                    onOpenMoreMenu(context, activeInterventionProgram),
              ),
            ),
            body: Container(
              child: !isViewReady
                  ? Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: CircularProcessLoader(
                        color: Colors.blueGrey,
                      ),
                    )
                  : Container(
                      child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: activeInterventionProgram.background),
                        ),
                        Container(
                          child: OgacInterventionHome(),
                        ),
                      ],
                    )),
            ),
          );
        },
      ),
    ));
  }
}
