import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:provider/provider.dart';

class InterventionSelectionButton extends StatelessWidget {
  const InterventionSelectionButton(
      {Key? key,
      required this.isInterventionSelected,
      this.onInterventionButtonClick})
      : super(key: key);

  final bool isInterventionSelected;
  final VoidCallback? onInterventionButtonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 60, bottom: 50),
        width: double.infinity,
        child: TextButton(
          onPressed: !isInterventionSelected ? null : onInterventionButtonClick,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isInterventionSelected
                    ? const Color(0xFFFAFAFA)
                    : const Color(0xFF7FBA7C),
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
          child: Consumer<LanguageTranslationState>(
            builder: (context, languageTranslationState, child) => Text(
              languageTranslationState.currentLanguage == 'lesotho'
                  ? 'Tsoela-pele'
                  : 'Continue',
              style: TextStyle(
                color: isInterventionSelected
                    ? const Color(0xFFFAFAFA)
                    : const Color(0xFF7FBA7C),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
