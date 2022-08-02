import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:provider/provider.dart';

class CasePlanGapServiceMonitoringViewContainer extends StatelessWidget {
  const CasePlanGapServiceMonitoringViewContainer({
    Key? key,
    required this.domainId,
    required this.formSectionColor,
    required this.casePlanGap,
    required this.isHouseholdCasePlan,
    required this.hasEditAccess,
  }) : super(key: key);

  final String domainId;
  final Color formSectionColor;
  final Map casePlanGap;
  final bool isHouseholdCasePlan;
  final bool hasEditAccess;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(),
            child: Text(
              'Montoring $domainId $formSectionColor $casePlanGap $isHouseholdCasePlan $hasEditAccess',
            ),
          ),
          Visibility(
            child: Consumer<LanguageTranslationState>(
              builder: (context, languageTranslationState, child) {
                String? currentLanguage =
                    languageTranslationState.currentLanguage;
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: formSectionColor,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.all(15.0),
                    ),
                    onPressed: () => {},
                    child: Text(
                      currentLanguage != 'lesotho'
                          ? 'ADD SERVICE'
                          : 'KENYA LITSEBELETSO',
                      style: const TextStyle().copyWith(
                        color: formSectionColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
