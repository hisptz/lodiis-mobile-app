import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/app_info_state/app_info_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class AboutApp extends StatefulWidget {
  AboutApp({Key? key}) : super(key: key);

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  final String label = 'About App';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: Consumer<InterventionCardState>(
          builder: (context, interventionCardState, child) {
            InterventionCard activeInterventionProgram =
                interventionCardState.currentInterventionProgram;
            return SubPageAppBar(
              label: label,
              activeInterventionProgram: activeInterventionProgram,
              disableSelectionOfActiveIntervention: false,
            );
          },
        ),
      ),
      body: SubPageBody(
        body: Container(
          child: Consumer<LanguageTranslationState>(
            builder: (context, languageTranslationState, child) {
              String? currentLanguage =
                  languageTranslationState.currentLanguage;
              return Consumer<AppInfoState>(
                builder: (context, appInfoState, child) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 20.0,
                                ),
                                child: CircleAvatar(
                                  radius: size.width * 0.1,
                                  backgroundColor: Color(0xFFF3F3F3),
                                  backgroundImage:
                                      AssetImage('assets/logos/app-logo.png'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 5.0,
                                ),
                                child: Text(
                                  currentLanguage == 'lesotho'
                                      ? 'Lebitso la App : ${appInfoState.currentAppName}'
                                      : 'App Name : ${appInfoState.currentAppName}',
                                  style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 5.0,
                                ),
                                child: Text(
                                  'App Version : ${appInfoState.currentAppVersion}',
                                  style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 5.0,
                                ),
                                child: Text(
                                  'App Id : ${appInfoState.currentAppId}',
                                  style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
