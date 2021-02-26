import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/boolean_input_field_container.dart';
import 'package:kb_mobile_app/core/components/input_fields/check_box_list_input_field.dart';
import 'package:kb_mobile_app/core/components/input_fields/coordinate_input_field_container.dart';
import 'package:kb_mobile_app/core/components/input_fields/date_input_field_container.dart';
import 'package:kb_mobile_app/core/components/input_fields/numerical_input_container.dart';
import 'package:kb_mobile_app/core/components/input_fields/organisation_unit_input_field_container.dart';
import 'package:kb_mobile_app/core/components/input_fields/phone_number_input_field_container.dart';
import 'package:kb_mobile_app/core/components/input_fields/select_input_field.dart';
import 'package:kb_mobile_app/core/components/input_fields/text_input_field_container.dart';
import 'package:kb_mobile_app/core/components/input_fields/true_only_input_field_container.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class InputFieldContainer extends StatelessWidget {
  const InputFieldContainer({
    Key key,
    @required this.inputField,
    @required this.currentLanguage,
    @required this.hiddenInputFieldOptions,
    this.onInputValueChange,
    this.dataObject,
    this.mandatoryFieldObject,
    @required this.hiddenFields,
    this.isEditableMode,
  }) : super(key: key);

  final InputField inputField;
  final String currentLanguage;
  final bool isEditableMode;
  final Function onInputValueChange;
  final Map dataObject;
  final Map mandatoryFieldObject;
  final Map hiddenInputFieldOptions;
  final Map hiddenFields;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: inputField.background),
      padding: inputField.background != Colors.transparent
          ? EdgeInsets.only(top: 10.0, bottom: 0.0, left: 10.0, right: 10.0)
          : EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 2.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: currentLanguage == 'lesotho' &&
                                inputField.translatedName != null
                            ? inputField.translatedName
                            : inputField.name,
                        style: TextStyle(
                          color:
                              inputField.hasError != null && inputField.hasError
                                  ? Colors.red
                                  : inputField.labelColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: mandatoryFieldObject != null &&
                                    mandatoryFieldObject[inputField.id] == true
                                ? ' *'
                                : '',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: inputField.description != '',
              child: Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        currentLanguage == 'lesotho' &&
                                inputField.translatedDescription != null
                            ? inputField.translatedDescription
                            : inputField.description,
                        style: TextStyle().copyWith(
                          color: inputField.labelColor,
                          fontSize: 12.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: inputField.hasSubInputField &&
                  inputField.subInputField != null &&
                  (hiddenFields == null ||
                      '${hiddenFields[inputField.id]}'.trim() != 'true'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: isEditableMode
                          ? _getInputField(inputField)
                          : _getInputFieldLabel(inputField),
                    ),
                  ),
                  Visibility(
                    visible: inputField.subInputField != null,
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              inputField.subInputField != null
                                  ? currentLanguage == 'lesotho' &&
                                          inputField.subInputField
                                                  .translatedName !=
                                              null
                                      ? inputField.subInputField.translatedName
                                      : inputField.subInputField.name
                                  : '',
                            ),
                          ),
                          Container(
                            child: isEditableMode
                                ? _getInputField(inputField.subInputField)
                                : _getInputFieldLabel(inputField.subInputField),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !inputField.hasSubInputField,
              child: Container(
                child: isEditableMode
                    ? _getInputField(inputField)
                    : _getInputFieldLabel(inputField),
              ),
            ),
            LineSeperator(
              color:
                  inputField.inputColor.withOpacity(0.3) ?? Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  Widget _getInputFieldLabel(InputField inputField) {
    //@TODO handling view for data  based on option sets
    //@TODO translation of boolean or true only values
    dynamic value =
        inputField != null && '${dataObject[inputField.id]}' != 'null'
            ? '${dataObject[inputField.id]}'
            : '   ';
    if (inputField != null) {
      if (inputField.valueType == "BOOLEAN") {
        value = value == 'true'
            ? currentLanguage == 'lesotho'
                ? 'Yes'
                : 'Yes'
            : value == 'false'
                ? currentLanguage == 'lesotho'
                    ? 'No'
                    : 'No'
                : value;
      } else if (inputField.valueType == 'TRUE_ONLY') {
        value = value == 'true'
            ? currentLanguage == 'lesotho'
                ? 'Yes'
                : 'Yes'
            : value;
      }
    }
    return Container(
      child: inputField != null && inputField.valueType == 'CHECK_BOX'
          ? CheckBoxListInputField(
              currentLanguage: currentLanguage,
              inputField: inputField,
              isReadOnly: true, //this.onInputValueChange,
              dataObject: dataObject,
            )
          : Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  child: Text(
                    value.toString(),
                    style: TextStyle().copyWith(
                      color: inputField != null && inputField.inputColor != null
                          ? inputField.inputColor
                          : null,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _getInputField(InputField inputField) {
    return Container(
      child: inputField != null
          ? inputField.valueType == 'CHECK_BOX'
              ? CheckBoxListInputField(
                  currentLanguage: currentLanguage,
                  inputField: inputField,
                  onInputValueChange: (id, value) {
                    this.onInputValueChange(id, value);
                  },
                  dataObject: dataObject,
                )
              : inputField.options.length > 0
                  ? SelectInputField(
                      hiddenInputFieldOptions:
                          hiddenInputFieldOptions[inputField.id] ?? Map(),
                      currentLanguage: currentLanguage,
                      color: inputField.inputColor,
                      isReadOnly: inputField.isReadOnly,
                      renderAsRadio: inputField.renderAsRadio,
                      onInputValueChange: (dynamic value) =>
                          this.onInputValueChange(inputField.id, value),
                      options: inputField.options,
                      selectedOption: dataObject[inputField.id],
                    )
                  : inputField.valueType == 'TEXT' ||
                          inputField.valueType == 'LONG_TEXT'
                      ? TextInputFieldContainer(
                          inputField: inputField,
                          inputValue: dataObject[inputField.id],
                          onInputValueChange: (dynamic value) =>
                              this.onInputValueChange(inputField.id, value),
                        )
                      : inputField.valueType == 'INTEGER_ZERO_OR_POSITIVE' ||
                              inputField.valueType == 'NUMBER'
                          ? NumericalInputFieldContainer(
                              inputField: inputField,
                              inputValue: dataObject[inputField.id],
                              onInputValueChange: (dynamic value) =>
                                  this.onInputValueChange(inputField.id, value),
                            )
                          : inputField.valueType == 'PHONE_NUMBER'
                              ? PhoneNumberInputFieldContainer(
                                  inputField: inputField,
                                  inputValue: dataObject[inputField.id],
                                  onInputValueChange: (dynamic value) => this
                                      .onInputValueChange(inputField.id, value),
                                )
                              : inputField.valueType == 'BOOLEAN'
                                  ? BooleanInputFieldContainer(
                                      currentLanguage: currentLanguage,
                                      inputField: inputField,
                                      inputValue: dataObject[inputField.id],
                                      onInputValueChange: (dynamic value) =>
                                          this.onInputValueChange(
                                              inputField.id, value),
                                    )
                                  : inputField.valueType == 'TRUE_ONLY'
                                      ? TrueOnlyInputFieldContainer(
                                          currentLanguage: currentLanguage,
                                          inputField: inputField,
                                          inputValue: dataObject[inputField.id],
                                          onInputValueChange: (dynamic value) =>
                                              this.onInputValueChange(
                                                  inputField.id, value),
                                        )
                                      : inputField.valueType == 'DATE'
                                          ? DateInputFieldContainer(
                                              inputField: inputField,
                                              currentLanguage: currentLanguage,
                                              inputValue:
                                                  dataObject[inputField.id],
                                              onInputValueChange:
                                                  (dynamic value) => this
                                                      .onInputValueChange(
                                                          inputField.id, value),
                                            )
                                          : inputField.valueType ==
                                                  'ORGANISATION_UNIT'
                                              ? OrganisationUnitInputFieldContainer(
                                                  inputField: inputField,
                                                  inputValue:
                                                      dataObject[inputField.id],
                                                  onInputValueChange:
                                                      (dynamic value) => this
                                                          .onInputValueChange(
                                                              inputField.id,
                                                              value),
                                                )
                                              : inputField.valueType ==
                                                      'COORDINATE'
                                                  ? CoordinteInputFieldContainer(
                                                      inputField: inputField,
                                                      inputValue: dataObject[
                                                          inputField.id],
                                                      onInputValueChange:
                                                          (dynamic value) => this
                                                              .onInputValueChange(
                                                                  inputField.id,
                                                                  value),
                                                    )
                                                  : Container(
                                                      child: Text(
                                                          '${inputField.valueType} is not supported'),
                                                    )
          : Text(''),
    );
  }
}
