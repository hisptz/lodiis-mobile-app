import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_cion.dart';
import 'package:kb_mobile_app/core/components/input_fields/radio_input_field_container.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class SelectInputField extends StatefulWidget {
  const SelectInputField(
      {Key key,
      this.color,
      @required this.options,
      @required this.selectedOption,
      @required this.onInputValueChange,
      this.renderAsRadio})
      : super(key: key);

  final Color color;
  final List<InputFieldOption> options;
  final String selectedOption;
  final Function onInputValueChange;
  final bool renderAsRadio;

  @override
  _SelectInputFieldState createState() => _SelectInputFieldState();
}

class _SelectInputFieldState extends State<SelectInputField> {
  String _selectedOption;

  @override
  void initState() {
    super.initState();
    this._selectedOption = widget.selectedOption;
  }

  void onValueChange(dynamic value) {
    widget.onInputValueChange(value);
    setState(() {
      _selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.renderAsRadio
        ? Container(
            child: RadioInputFieldContainer(
                options: widget.options,
                currentValue: _selectedOption,
                onInputValueChange: widget.onInputValueChange))
        : Row(children: [
            Expanded(
                child: DropdownButton<String>(
              value: _selectedOption,
              isExpanded: true,
              icon: Container(
                height: 20.0,
                child: SvgPicture.asset(
                  'assets/icons/chevron_down.svg',
                  color: widget.color ?? Colors.black,
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
            InputCheckedIcon(
              showTickedIcon: _selectedOption == null,
              color: widget.color,
            )
          ]);
  }
}
