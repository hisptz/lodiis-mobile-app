import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:provider/provider.dart';

class AddChildConfirmation extends StatelessWidget {
  const AddChildConfirmation({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageTranslationState>(
      builder: (context, languageTranslationState, child) {
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
                visible: name != '',
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                  ),
                  child: Text(
                    '$name added successfully',
                    style: const TextStyle().copyWith(
                      color: const Color(0XFF1A3518),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  languageTranslationState.isSesothoLanguage
                      ? 'Kenya ngoana e mong'
                      : 'Add Another Child?',
                  style: const TextStyle().copyWith(
                    color: const Color(0XFF1A3518),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(
                      languageTranslationState.isSesothoLanguage
                          ? 'Eseng joale'
                          : 'Not Now',
                      style: const TextStyle().copyWith(
                        color: const Color(0xFF1A3518),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(
                      languageTranslationState.isSesothoLanguage
                          ? 'Eea'
                          : 'Yes',
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
      },
    );
  }
}
