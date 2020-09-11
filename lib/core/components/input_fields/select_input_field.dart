import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class SelectInputField extends StatefulWidget {
  const SelectInputField({Key key, this.color, @required this.options})
      : super(key: key);

  final Color color;
  final List<InputFieldOption> options;

  @override
  _SelectInputFieldState createState() => _SelectInputFieldState();
}

class _SelectInputFieldState extends State<SelectInputField> {
  String _selectedOption;

  @override
  void initState() {
    super.initState();
  }

  void onValueChange(String value) {
    setState(() {
      _selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: DropdownButton<String>(
        value: _selectedOption,
        isExpanded: true,
        icon: Container(
          height: 20.0,
          child: SvgPicture.asset(
            'assets/icons/chevron_down.svg',
            color: widget.color,
          ),
        ),
        elevation: 16,
        style: TextStyle(color: widget.color ?? Colors.black),
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
        onChanged: onValueChange,
        items: widget.options
            .map<DropdownMenuItem<String>>((InputFieldOption option) {
          return DropdownMenuItem<String>(
            value: option.code,
            child: Text(option.name),
          );
        }).toList(),
      )),
      Container(
        child: _selectedOption == null
            ? Text('')
            : Container(
                height: 20.0,
                margin: EdgeInsets.only(left: 10),
                child: SvgPicture.asset(
                  'assets/icons/checked-icon.svg',
                  color: widget.color,
                ),
              ),
      )
    ]);
  }
}
