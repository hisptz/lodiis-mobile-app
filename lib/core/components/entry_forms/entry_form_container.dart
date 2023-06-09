import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_sub_form_container.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_field_container.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:provider/provider.dart';

class EntryFormContainer extends StatelessWidget {
  const EntryFormContainer({
    Key? key,
    required this.formSections,
    required this.dataObject,
    required this.mandatoryFieldObject,
    this.lastUpdatedId = '',
    this.hiddenFields,
    this.hiddenSections,
    this.isEditableMode = true,
    this.onInputValueChange,
    this.elevation = 1.0,
    this.hiddenInputFieldOptions,
    this.unFilledMandatoryFields,
  }) : super(key: key);

  final List<FormSection>? formSections;
  final Function? onInputValueChange;
  final String? lastUpdatedId;
  final Map? dataObject;
  final Map? hiddenFields;
  final Map? hiddenSections;
  final Map? mandatoryFieldObject;
  final Map? hiddenInputFieldOptions;
  final bool isEditableMode;
  final double elevation;
  final List? unFilledMandatoryFields;

  bool shouldShowSection(FormSection formSection) {
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      [formSection],
      includeLocationId: true,
    );
    return !inputFieldIds.every((inputFieldId) {
      return hiddenFields != null &&
          hiddenFields!.containsKey(inputFieldId) &&
          hiddenFields![inputFieldId] == true;
    });
  }

  @override
  Widget build(BuildContext context) {
    setFieldErrors();
    return Consumer<LanguageTranslationState>(
      builder: (context, languageTranslationState, child) {
        String? currentLanguage = languageTranslationState.currentLanguage;
        return Consumer<CurrentUserState>(
          builder: (context, currentUserState, child) {
            List<String?> currentUserCountryLevelReferences =
                currentUserState.currentUserCountryLevelReferences;
            return Column(
              children: formSections!.map((FormSection formSection) {
                return Visibility(
                  visible: hiddenSections == null ||
                      '${hiddenSections![formSection.id]}'.trim() != 'true' &&
                          shouldShowSection(formSection),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: MaterialCard(
                        elevation: elevation,
                        body: Container(
                          margin: formSection.name != ''
                              ? const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                )
                              : const EdgeInsets.only(
                                  bottom: 10.0,
                                ),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: formSection.borderColor!,
                                width: 8.0,
                              ),
                            ),
                            color: formSection.backgroundColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: formSection.name != '',
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  margin: const EdgeInsets.only(left: 5.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        currentLanguage == 'lesotho' &&
                                                formSection.translatedName !=
                                                    null
                                            ? formSection.translatedName!
                                            : formSection.name,
                                        style: const TextStyle().copyWith(
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
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal: 10.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          currentLanguage == 'lesotho' &&
                                                  formSection
                                                          .translatedDescription !=
                                                      null
                                              ? formSection
                                                  .translatedDescription!
                                              : formSection.description!,
                                          style: const TextStyle().copyWith(
                                              color: formSection.color,
                                              fontSize: 14.0,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: formSection.name != '',
                                child: LineSeparator(
                                  color: formSection.color.withOpacity(0.1),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: formSection.name != '' ? 5.0 : 0.0,
                                  horizontal: 10.0,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: formSection.name != '' ? 10.0 : 0.0,
                                  horizontal: 10.0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: formSection.inputFields!
                                      .map(
                                        (InputField inputField) => Visibility(
                                          visible: hiddenFields == null ||
                                              '${hiddenFields![inputField.id]}'
                                                      .trim() !=
                                                  'true',
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10.0),
                                            child: InputFieldContainer(
                                              lastUpdatedId:
                                                  lastUpdatedId ?? '',
                                              currentUserCountryLevelReferences:
                                                  currentUserCountryLevelReferences,
                                              hiddenFields: hiddenFields,
                                              inputField: inputField,
                                              hiddenInputFieldOptions:
                                                  hiddenInputFieldOptions ?? {},
                                              currentLanguage: currentLanguage,
                                              isEditableMode: isEditableMode,
                                              mandatoryFieldObject:
                                                  isEditableMode
                                                      ? mandatoryFieldObject
                                                      : {},
                                              dataObject: dataObject,
                                              onInputValueChange:
                                                  (String id, dynamic value) =>
                                                      onInputValueChange!(
                                                          id, value),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              EntrySubFormContainer(
                                lastUpdatedId: lastUpdatedId ?? '',
                                currentUserCountryLevelReferences:
                                    currentUserCountryLevelReferences,
                                hiddenFields: hiddenFields ?? {},
                                hiddenSections: hiddenSections ?? {},
                                hiddenInputFieldOptions:
                                    hiddenInputFieldOptions ?? {},
                                currentLanguage: currentLanguage,
                                subSections: formSection.subSections,
                                dataObject: dataObject,
                                isEditableMode: isEditableMode,
                                mandatoryFieldObject: mandatoryFieldObject,
                                onInputValueChange: onInputValueChange,
                                unFilledMandatoryFields:
                                    unFilledMandatoryFields,
                              )
                            ],
                          ),
                        )),
                  ),
                );
              }).toList(),
            );
          },
        );
      },
    );
  }

  void setFieldErrors() {
    if (unFilledMandatoryFields != null &&
        unFilledMandatoryFields!.isNotEmpty) {
      for (var section in formSections!) {
        for (var inputField in section.inputFields!) {
          if (unFilledMandatoryFields!.contains(inputField.id)) {
            inputField.hasError = true;
          } else {
            inputField.hasError = false;
          }
        }
      }
    } else {
      for (var section in formSections!) {
        for (var inputField in section.inputFields!) {
          inputField.hasError = false;
        }
      }
    }
  }
}
