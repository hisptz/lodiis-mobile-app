import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_icon.dart';
import 'package:kb_mobile_app/core/components/input_fields/radio_input_field_container.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class SelectInputField extends StatefulWidget {
  const SelectInputField({
    Key key,
    this.color,
    @required this.options,
    @required this.selectedOption,
    @required this.onInputValueChange,
    @required this.isReadOnly,
    @required this.currentLanguage,
    this.renderAsRadio,
  }) : super(key: key);

  final Color color;
  final bool isReadOnly;
  final List<InputFieldOption> options;
  final dynamic selectedOption;
  final Function onInputValueChange;
  final bool renderAsRadio;
  final String currentLanguage;

  @override
  _SelectInputFieldState createState() => _SelectInputFieldState();
}

class _SelectInputFieldState extends State<SelectInputField> {
  dynamic _selectedOption;

  @override
  void initState() {
    super.initState();
    updateInputValueState(widget.selectedOption);
  }

  updateInputValueState(dynamic value) {
    setState(() {
      _selectedOption = value == '' ? null : value;
    });
  }

  @override
  void didUpdateWidget(covariant SelectInputField oldWidget) {
    super.didUpdateWidget(widget);
    if (oldWidget.selectedOption != widget.selectedOption)
      updateInputValueState(widget.selectedOption);
  }

  void onValueChange(dynamic value) {
    widget.onInputValueChange(value);
    updateInputValueState(value);
  }

  @override
  Widget build(BuildContext context) {
    return widget.renderAsRadio
        ? Container(
            child: RadioInputFieldContainer(
              options: widget.options,
              currentLanguage: widget.currentLanguage,
              isReadOnly: widget.isReadOnly,
              currentValue: _selectedOption,
              activeColor: widget.color,
              onInputValueChange: widget.onInputValueChange,
            ),
          )
        : Row(
            children: [
              Expanded(
                child: DropdownButton<dynamic>(
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
                  onChanged: widget.isReadOnly ? null : onValueChange,
                  items: widget.options.map<DropdownMenuItem<dynamic>>(
                    (InputFieldOption option) {
                      return DropdownMenuItem<dynamic>(
                        value: option.code,
                        child: Text(
                          widget.currentLanguage == 'lesotho' &&
                                  option.translatedName != null
                              ? option.translatedName
                              : option.name,
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              InputCheckedIcon(
                showTickedIcon: _selectedOption != null,
                color: widget.color,
              )
            ],
          );
  }
}
