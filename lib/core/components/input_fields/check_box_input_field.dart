import 'package:flutter/material.dart';

class CheckBoxInputField extends StatefulWidget {
  const CheckBoxInputField(
      {Key key,
      @required this.onInputValueChange,
      @required this.label,
      @required this.value,
      @required this.color})
      : super(key: key);

  final Function onInputValueChange;
  final String label;
  final Color color;
  final dynamic value;

  @override
  _CheckBoxInputFieldState createState() => _CheckBoxInputFieldState();
}

class _CheckBoxInputFieldState extends State<CheckBoxInputField> {
  bool _inputValue;

  @override
  void initState() {
    super.initState();
    setState(() {
      _inputValue = widget.value != null && '${widget.value}' == 'true';
    });
  }

  void onInputValueChange(bool value) {
    setState(() {
      _inputValue = value;
    });
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
              onChanged: onInputValueChange),
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
