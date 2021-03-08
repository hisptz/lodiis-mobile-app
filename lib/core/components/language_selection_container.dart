import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';

import 'package:kb_mobile_app/core/components/language_selection_card.dart';
import 'package:kb_mobile_app/models/app_language.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class LanguageSelectionContainer extends StatefulWidget {
  const LanguageSelectionContainer({
    Key key,
    @required this.selectionLanguageCode,
    @required this.currentLanguage,
    @required this.showLanguageSettingAppBar,
    this.onSetSelectedLanguage,
  }) : super(key: key);

  final String selectionLanguageCode;
  final String currentLanguage;
  final bool showLanguageSettingAppBar;
  final Function onSetSelectedLanguage;

  @override
  _LanguageSelectionContainerState createState() =>
      _LanguageSelectionContainerState();
}

class _LanguageSelectionContainerState
    extends State<LanguageSelectionContainer> {
  List<AppLanguage> supportedLangauges = AppLanguage.getSupporttedLanguage();
  String _selectionLanguageCode = '';

  void onSelectLanguageCard(
    AppLanguage selectionLanguage,
  ) {
    _selectionLanguageCode = selectionLanguage.id;
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant LanguageSelectionContainer oldWidget) {
    super.didUpdateWidget(widget);
    if (oldWidget.selectionLanguageCode != widget.selectionLanguageCode) {
      _selectionLanguageCode = widget.selectionLanguageCode;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Consumer<IntervetionCardState>(
        builder: (context, intervetionCardState, child) {
          InterventionCard currentIntervetionProgram =
              intervetionCardState.currentIntervetionProgram;
          Color color = currentIntervetionProgram.id == null
              ? Color(0xFF4B9F46) //Color(0XFF14A337)
              : currentIntervetionProgram.primmaryColor;
          return Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                color: Color(0xFFF3F3F3),
                height: size.height,
                width: size.width,
                padding: EdgeInsets.only(top: size.height * 0.1),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Choose Language',
                          style: TextStyle().copyWith(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Choose language',
                          style: TextStyle().copyWith(
                            fontSize: 20.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.5),
                color: color,
                height: size.height * 0.5,
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                  child: Container(
                    margin: EdgeInsets.only(top: size.height * 0.44),
                    height: size.height * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GridView.count(
                          crossAxisCount: 2,
                          primary: false,
                          mainAxisSpacing: 30.0,
                          crossAxisSpacing: 30.0,
                          shrinkWrap: true,
                          children: supportedLangauges
                              .map((AppLanguage supportedLangauge) => Container(
                                    child: GestureDetector(
                                      onTap: () => onSelectLanguageCard(
                                        supportedLangauge,
                                      ),
                                      child: LanguageSelectionCard(
                                        size: size,
                                        color: color,
                                        currentLanguage: widget.currentLanguage,
                                        appLanguage: supportedLangauge,
                                        selectionLanguage:
                                            _selectionLanguageCode,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: _selectionLanguageCode == ''
                                ? null
                                : () => widget.onSetSelectedLanguage(
                                      _selectionLanguageCode,
                                    ),
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: _selectionLanguageCode != ''
                                      ? Color(0xFFFAFAFA)
                                      : Color(0xFF7FBA7C),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                            ),
                            child: Container(
                              child: Text(
                                widget.showLanguageSettingAppBar
                                    ? widget.currentLanguage == 'lesotho'
                                        ? 'Boloka'
                                        : 'Save'
                                    : 'Agree',
                                style: TextStyle(
                                  color: _selectionLanguageCode != ''
                                      ? Color(0xFFFAFAFA)
                                      : Color(0xFF7FBA7C),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
