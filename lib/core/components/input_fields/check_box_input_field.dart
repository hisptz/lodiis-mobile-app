import 'package:flutter/material.dart';

class CheckBoxInputField extends StatefulWidget {
  const CheckBoxInputField({
    Key key,
    @required this.onInputValueChange,
    @required this.label,
    @required this.value,
    @required this.color,
    @required this.isReadOnly,
  }) : super(key: key);

  final Function onInputValueChange;
  final String label;
  final Color color;
  final dynamic value;
  final bool isReadOnly;

  @override
  _CheckBoxInputFieldState createState() => _CheckBoxInputFieldState();
}

class _CheckBoxInputFieldState extends State<CheckBoxInputField> {
  bool _inputValue;

  @override
  void initState() {
    super.initState();
    updateInputValueState();
  }

  updateInputValueState() {
    setState(() {
      _inputValue = widget.value != null && '${widget.value}' == 'true';
    });
  }

  @override
  void didUpdateWidget(covariant CheckBoxInputField oldWidget) {
    super.didUpdateWidget(widget);
    if (oldWidget.value != widget.value) updateInputValueState();
  }

  void onInputValueChange(bool value) {
    updateInputValueState();
    widget.onInputValueChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Checkbox(
              value: _inputValue,
              activeColor: _inputValue ? widget.color : null,
              checkColor: _inputValue ? Colors.white : null,
              onChanged: widget.isReadOnly ? null : onInputValueChange),
        ),
        Expanded(
            child: Text(
          widget.label,
          style: TextStyle().copyWith(color: _inputValue ? widget.color : null),
        ))
      ],
    );
  }
}
