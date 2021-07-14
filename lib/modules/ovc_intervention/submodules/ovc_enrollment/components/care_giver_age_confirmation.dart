import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:provider/provider.dart';

class CareGiverAgeConfirmation extends StatelessWidget {
  const CareGiverAgeConfirmation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
      String currentLanguage = languageTranslationState.currentLanguage;
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        margin: EdgeInsets.only(
          bottom: 20.0,
        ),
        child: Column(
          children: [
            Visibility(
              visible: true,
              child: Container(
                padding: EdgeInsets.only(
                  top: 15.0,
                ),
                child: Text(
                  'You cannot enroll child headed Household',
                  style: TextStyle().copyWith(
                    color: Color(0XFF1A3518),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(
                      currentLanguage != 'lesotho' ? 'Exit' : 'Koala',
                      style: TextStyle().copyWith(
                        color: Color(0xFF1A3518),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(
                      currentLanguage != 'lesotho'
                          ? 'Go Back'
                          : 'Khutlela morao',
                      style: TextStyle().copyWith(
                        color: Color(0xFF4B9F46),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
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
