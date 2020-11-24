import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_sub_form_container.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_field_container.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:provider/provider.dart';

class EntryFormContainer extends StatelessWidget {
  const EntryFormContainer(
      {Key key,
      @required this.formSections,
      @required this.dataObject,
      @required this.mandatoryFieldObject,
      this.hiddenFields,
      this.hiddenSections,
      this.isEditableMode = true,
      this.onInputValueChange,
      this.elevation = 1.0})
      : super(key: key);

  final List<FormSection> formSections;
  final Function onInputValueChange;
  final Map dataObject;
  final Map hiddenFields;
  final Map hiddenSections;
  final Map mandatoryFieldObject;
  final bool isEditableMode;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String currentLanguage = languageTranslationState.currentLanguage;

          return Column(
            children: formSections
                .map((FormSection formSection) => Visibility(
                      visible: hiddenSections == null ||
                          '${hiddenSections[formSection.id]}'.trim() != 'true',
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: MaterialCard(
                            elevation: elevation,
                            body: Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                        color: formSection.borderColor,
                                        width: 8.0),
                                  ),
                                  color: formSection.backgroundColor),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Visibility(
                                    visible: formSection.name != '',
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      margin: EdgeInsets.only(left: 5.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            currentLanguage == 'lesotho' &&
                                                    formSection
                                                            .translatedName !=
                                                        null
                                                ? formSection.translatedName
                                                : formSection.name,
                                            style: TextStyle().copyWith(
                                                color: formSection.color,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: formSection.description != '',
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 10.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              currentLanguage == 'lesotho' &&
                                                      formSection
                                                              .translatedDescription !=
                                                          null
                                                  ? formSection
                                                      .translatedDescription
                                                  : formSection.description,
                                              style: TextStyle().copyWith(
                                                  color: formSection.color,
                                                  fontSize: 14.0,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: formSection.name != '',
                                    child: Container(
                                        child: LineSeperator(
                                            color: formSection.color
                                                .withOpacity(0.1))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 10.0),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: formSection.inputFields
                                          .map((InputField inputField) =>
                                              Visibility(
                                                visible: hiddenFields == null ||
                                                    '${hiddenFields[inputField.id]}'
                                                            .trim() !=
                                                        'true',
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10.0),
                                                  child: InputFieldContainer(
                                                    inputField: inputField,
                                                    currentLanguage:
                                                        currentLanguage,
                                                    isEditableMode:
                                                        isEditableMode,
                                                    mandatoryFieldObject:
                                                        isEditableMode
                                                            ? mandatoryFieldObject
                                                            : Map(),
                                                    dataObject: dataObject,
                                                    onInputValueChange: (String
                                                                id,
                                                            dynamic value) =>
                                                        onInputValueChange(
                                                            id, value),
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                  EntrySubFormContainer(
                                    hiddenFields: hiddenFields ?? Map(),
                                    hiddenSections: hiddenSections ?? Map(),
                                    currentLanguage: currentLanguage,
                                    subSections: formSection.subSections,
                                    dataObject: dataObject,
                                    isEditableMode: isEditableMode,
                                    mandatoryFieldObject: mandatoryFieldObject,
                                    onInputValueChange: onInputValueChange,
                                  )
                                ],
                              ),
                            )),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
