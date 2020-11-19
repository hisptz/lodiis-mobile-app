import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/language_selection_container.dart';
import 'package:kb_mobile_app/core/services/language_selection_service.dart';
import 'package:kb_mobile_app/modules/login/login.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({Key key}) : super(key: key);

  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  void onSetSelectedLanguage(
    BuildContext context,
    String selectionLanguageCode,
  ) async {
    await LanguageSelectionService.setCurrentLanguageSelection(
      selectionLanguageCode,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: LanguageSelectionContainer(
              selectionLanguageCode: '',
              onSetSelectedLanguage: (String selectionLanguageCode) =>
                  onSetSelectedLanguage(
                    context,
                    selectionLanguageCode,
                  )),
        ),
      ),
    );
  }
}
