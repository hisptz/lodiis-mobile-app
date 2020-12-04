import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/radio_input_field_container.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class BooleanInputFieldContainer extends StatefulWidget {
  const BooleanInputFieldContainer(
      {Key key,
      @required this.inputField,
      @required this.onInputValueChange,
      @required this.currentLanguage,
      this.inputValue})
      : super(key: key);

  final InputField inputField;
  final String currentLanguage;
  final Function onInputValueChange;
  final dynamic inputValue;

  @override
  _BooleanInputFieldContainerState createState() =>
      _BooleanInputFieldContainerState();
}

class _BooleanInputFieldContainerState
    extends State<BooleanInputFieldContainer> {
  //@TODO add translation on options codes
  final List<InputFieldOption> options = [
    InputFieldOption(
      name: 'Yes',
      translatedName: 'E',
      code: true,
    ),
    InputFieldOption(
      name: 'No',
      translatedName: 'Che',
      code: false,
    ),
  ];
  bool _inputValue;

  @override
  void initState() {
    super.initState();
    updateInputFieldState();
  }

  updateInputFieldState() {
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
  void didUpdateWidget(covariant BooleanInputFieldContainer oldWidget) {
    super.didUpdateWidget(widget);
    if (oldWidget.inputValue != widget.inputValue) updateInputFieldState();
  }

  @override
  Widget build(BuildContext context) {
    return RadioInputFieldContainer(
      options: options,
      currentLanguage: widget.currentLanguage,
      isReadOnly: widget.inputField.isReadOnly,
      activeColor: widget.inputField.inputColor,
      currentValue: _inputValue,
      onInputValueChange: widget.onInputValueChange,
    );
  }
}
