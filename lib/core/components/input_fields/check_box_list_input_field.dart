import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/check_box_input_field.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class CheckBoxListInputField extends StatefulWidget {
  const CheckBoxListInputField({
    Key? key,
    required this.inputField,
    required this.dataObject,
    required this.currentLanguage,
    required this.hiddenFields,
    this.isReadOnly = false,
    this.onInputValueChange,
  }) : super(key: key);

  final InputField inputField;
  final Map hiddenFields;
  final String? currentLanguage;
  final Map? dataObject;
  final Function? onInputValueChange;
  final bool isReadOnly;

  @override
  State<CheckBoxListInputField> createState() => _CheckBoxListInputFieldState();
}

class _CheckBoxListInputFieldState extends State<CheckBoxListInputField> {
  final Map _inputValue = {};

  @override
  void initState() {
    super.initState();
    updateInputValueState();
  }

  updateInputValueState() {
    setState(() {
      for (InputFieldOption option in widget.inputField.options!) {
        _inputValue[option.code] = widget.dataObject![option.code] ?? false;
      }
    });
  }

  @override
  void didUpdateWidget(covariant CheckBoxListInputField oldWidget) {
    super.didUpdateWidget(widget);
    if (oldWidget.dataObject != widget.dataObject) updateInputValueState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.inputField.options!
          .where((option) =>
              widget.hiddenFields[option.code] == null ||
              widget.hiddenFields[option.code] != true)
          .map((InputFieldOption option) => CheckBoxInputField(
                isReadOnly: widget.isReadOnly,
                label: widget.currentLanguage == 'lesotho' &&
                        option.translatedName != null
                    ? option.translatedName
                    : option.name,
                value: widget.dataObject![option.code],
                color: widget.inputField.inputColor,
                onInputValueChange: (dynamic value) =>
                    widget.onInputValueChange!(option.code, '$value'),
              ))
          .toList(),
    );
  }
}
