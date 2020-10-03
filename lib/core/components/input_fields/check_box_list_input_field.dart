import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/check_box_input_field.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class CheckBoxListInputField extends StatefulWidget {
  const CheckBoxListInputField(
      {Key key,
      @required this.inputField,
      @required this.dataObject,
      this.isReadOnly = false,
      this.onInputValueChange})
      : super(key: key);

  final InputField inputField;
  final Map dataObject;
  final Function onInputValueChange;
  final bool isReadOnly;

  @override
  _CheckBoxListInputFieldState createState() => _CheckBoxListInputFieldState();
}

class _CheckBoxListInputFieldState extends State<CheckBoxListInputField> {
  Map _inputValue = Map();

  @override
  void initState() {
    super.initState();
    setState(() {
      for (InputFieldOption option in widget.inputField.options) {
        _inputValue[option.code] = widget.dataObject[option.code] ?? false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: widget.inputField.options
            .map((InputFieldOption option) => CheckBoxInputField(
                  isReadOnly: widget.isReadOnly,
                  label: option.name,
                  value: widget.dataObject[option.code],
                  color: widget.inputField.inputColor,
                  onInputValueChange: (dynamic value) =>
                      widget.onInputValueChange(option.code, '$value'),
                ))
            .toList(),
      ),
    );
  }
}
