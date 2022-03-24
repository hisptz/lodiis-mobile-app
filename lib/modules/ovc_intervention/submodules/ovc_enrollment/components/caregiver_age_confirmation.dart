import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:provider/provider.dart';

class CaregiverAgeConfirmation extends StatelessWidget {
  const CaregiverAgeConfirmation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
      String? currentLanguage = languageTranslationState.currentLanguage;
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        margin: const EdgeInsets.only(
          bottom: 20.0,
        ),
        child: Column(
          children: [
            Visibility(
              visible: true,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 15.0,
                ),
                child: Text(
                  'You cannot enroll child headed Household',
                  style: const TextStyle().copyWith(
                    color: const Color(0XFF1A3518),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    currentLanguage != 'lesotho' ? 'Exit' : 'Koala',
                    style: const TextStyle().copyWith(
                      color: const Color(0xFF1A3518),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(
                    currentLanguage != 'lesotho' ? 'Go Back' : 'Khutlela morao',
                    style: const TextStyle().copyWith(
                      color: const Color(0xFF4B9F46),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
