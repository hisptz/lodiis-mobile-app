import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:provider/provider.dart';

class AddChildConfirmation extends StatelessWidget {
  const AddChildConfirmation({Key key, @required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
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
                  visible: name != '',
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: Text(
                      '$name added successfully',
                      style: TextStyle().copyWith(
                        color: Color(0XFF1A3518),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currentLanguage == 'lesotho'
                        ? 'Kenya ngoana e mong'
                        : 'Add Another Child?',
                    style: TextStyle().copyWith(
                      color: Color(0XFF1A3518),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
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
                          currentLanguage == 'lesotho'
                              ? 'Eseng joale'
                              : 'Not Now',
                          style: TextStyle().copyWith(
                            color: Color(0xFF1A3518),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text(
                          currentLanguage == 'lesotho' ? 'Eea' : 'Yes',
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
        },
      ),
    );
  }
}
