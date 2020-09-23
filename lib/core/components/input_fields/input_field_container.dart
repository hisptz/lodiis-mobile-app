import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/boolean_input_field_container.dart';
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
  const InputFieldContainer(
      {Key key,
      @required this.inputField,
      this.onInputValueChange,
      this.inputValue})
      : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;
  final dynamic inputValue;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(color: inputField.background),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  inputField.name,
                  style: TextStyle()
                      .copyWith(color: inputField.labelColor, fontSize: 14.0),
                ))
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
                      inputField.description,
                      style: TextStyle().copyWith(
                          color: inputField.labelColor,
                          fontSize: 12.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal),
                    ))
                  ],
                ),
              )),
          Visibility(
              visible: inputField.hasSubInputField,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Container(child: _getInputField(inputField))),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Text(inputField.subInputField != null
                            ? inputField.subInputField.name
                            : ''),
                      ),
                      Container(
                          child: _getInputField(inputField.subInputField)),
                    ],
                  )),
                ],
              )),
          Visibility(
              visible: !inputField.hasSubInputField,
              child: Container(child: _getInputField(inputField))),
          LineSeperator(
              color:
                  inputField.inputColor.withOpacity(0.5) ?? Colors.transparent)
        ],
      ),
    );
  }

  Widget _getInputField(InputField inputField) {
    return Container(
      child: inputField != null
          ? inputField.options.length > 0
              ? SelectInputField(
                  renderAsRadio: inputField.renderAsRadio,
                  onInputValueChange: (dynamic value) =>
                      this.onInputValueChange(inputField.id, value),
                  options: inputField.options,
                  selectedOption: inputValue)
              : inputField.valueType == 'TEXT' ||
                      inputField.valueType == 'LONG_TEXT'
                  ? TextInputFieldContainer(
                      inputField: inputField,
                      inputValue: inputValue,
                      onInputValueChange: (dynamic value) =>
                          this.onInputValueChange(inputField.id, value),
                    )
                  : inputField.valueType == 'INTEGER_ZERO_OR_POSITIVE' ||
                          inputField.valueType == 'NUMBER'
                      ? NumericalInputFieldContainer(
                          inputField: inputField,
                          inputValue: inputValue,
                          onInputValueChange: (dynamic value) =>
                              this.onInputValueChange(inputField.id, value))
                      : inputField.valueType == 'PHONE_NUMBER'
                          ? PhoneNumberInputFieldContainer(
                              inputField: inputField,
                              inputValue: inputValue,
                              onInputValueChange: (dynamic value) =>
                                  this.onInputValueChange(inputField.id, value))
                          : inputField.valueType == 'BOOLEAN'
                              ? BooleanInputFieldContainer(
                                  inputField: inputField,
                                  inputValue: inputValue,
                                  onInputValueChange: (dynamic value) => this
                                      .onInputValueChange(inputField.id, value))
                              : inputField.valueType == 'TRUE_ONLY'
                                  ? TrueOnlyInputFieldContainer(
                                      inputField: inputField,
                                      inputValue: inputValue,
                                      onInputValueChange: (dynamic value) =>
                                          this.onInputValueChange(
                                              inputField.id, value))
                                  : inputField.valueType == 'DATE'
                                      ? DateInputFieldContainer(
                                          inputField: inputField,
                                          inputValue: inputValue,
                                          onInputValueChange: (dynamic value) =>
                                              this.onInputValueChange(inputField.id, value))
                                      : inputField.valueType == 'ORGANISATION_UNIT'
                                          ? OrganisationUnitInputFieldContainer(inputField: inputField, inputValue: inputValue, onInputValueChange: (dynamic value) => this.onInputValueChange(inputField.id, value))
                                          : inputField.valueType == 'COORDINATE'
                                              ? CoordinteInputFieldContainer(inputField: inputField, inputValue: inputValue, onInputValueChange: (dynamic value) => this.onInputValueChange(inputField.id, value))
                                              : Container(
                                                  child: Text(
                                                      '${inputField.valueType} is not supported'),
                                                )
          : Text(''),
    );
  }
}
