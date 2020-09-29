import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/radio_input_field_container.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class BooleanInputFieldContainer extends StatefulWidget {
  const BooleanInputFieldContainer(
      {Key key,
      @required this.inputField,
      @required this.onInputValueChange,
      this.inputValue})
      : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;
  final dynamic inputValue;

  @override
  _BooleanInputFieldContainerState createState() =>
      _BooleanInputFieldContainerState();
}

class _BooleanInputFieldContainerState
    extends State<BooleanInputFieldContainer> {
  final List<InputFieldOption> options = [
    InputFieldOption(name: 'Yes', code: true),
    InputFieldOption(name: 'No', code: false),
  ];
  bool _inputValue;

  @override
  void initState() {
    super.initState();
    setState(() {
      _inputValue =
          widget.inputValue != null && '${widget.inputValue}' == 'true'
              ? true
              : widget.inputValue != null && '${widget.inputValue}' == 'false'
                  ? false
                  : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RadioInputFieldContainer(
      options: options,
      isReadOnly: widget.inputField.isReadObly,
      activeColor: widget.inputField.inputColor,
      currentValue: _inputValue,
      onInputValueChange: widget.onInputValueChange,
    );
  }
}
