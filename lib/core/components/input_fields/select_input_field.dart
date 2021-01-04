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
    @required this.hiddenInputFieldOptions,
    this.renderAsRadio,
  }) : super(key: key);

  final Color color;
  final bool isReadOnly;
  final List<InputFieldOption> options;
  final dynamic selectedOption;
  final Function onInputValueChange;
  final bool renderAsRadio;
  final String currentLanguage;
  final Map hiddenInputFieldOptions;

  @override
  _SelectInputFieldState createState() => _SelectInputFieldState();
}

class _SelectInputFieldState extends State<SelectInputField> {
  dynamic _selectedOption;
  Map _hiddenInputFieldOptions = Map();
  List<InputFieldOption> _options;

  @override
  void initState() {
    super.initState();
    updateInputValueState(widget.selectedOption);
  }

  updateInputValueState(dynamic value) {
    _hiddenInputFieldOptions =
        widget.hiddenInputFieldOptions ?? _hiddenInputFieldOptions;
    _options = widget.options.where((InputFieldOption option) {
      return _hiddenInputFieldOptions[option.code] == null ||
          (_hiddenInputFieldOptions[option.code] != null &&
              '${_hiddenInputFieldOptions[option.code]}' != 'true');
    }).toList();
    setState(() {
      _selectedOption = value == '' ? null : value;
    });
  }

  @override
  void didUpdateWidget(covariant SelectInputField oldWidget) {
    super.didUpdateWidget(widget);
    if (oldWidget.selectedOption != widget.selectedOption ||
        oldWidget.hiddenInputFieldOptions != widget.hiddenInputFieldOptions)
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
              options: _options,
              currentLanguage: widget.currentLanguage,
              isReadOnly: widget.isReadOnly,
              currentValue: _selectedOption,
              activeColor: widget.color,
              onInputValueChange: widget.onInputValueChange,
            ),
          )
        : Container(
            child: SelectionOptionContainer(
              selectedOption: _selectedOption,
              options: _options,
              onValueChange: onValueChange,
              color: widget.color,
              isReadOnly: widget.isReadOnly,
              currentLanguage: widget.currentLanguage,
            ),
          );
  }
}

class SelectionOptionContainer extends StatelessWidget {
  const SelectionOptionContainer({
    Key key,
    @required selectedOption,
    @required List<InputFieldOption> options,
    this.color,
    this.isReadOnly,
    this.onValueChange,
    this.currentLanguage,
  })  : _selectedOption = selectedOption,
        _options = options,
        super(key: key);

  final dynamic _selectedOption;
  final List<InputFieldOption> _options;
  final Color color;
  final bool isReadOnly;
  final String currentLanguage;
  final Function onValueChange;
  @override
  Widget build(BuildContext context) {
    void onChange(value){
      FocusScope.of(context).requestFocus(new FocusNode());
      onValueChange(value);
    }
    return Row(
      children: [
        Expanded(
          child: DropdownButton<dynamic>(
            value: _selectedOption,
            isExpanded: true,
            icon: Container(
              height: 20.0,
              child: SvgPicture.asset(
                'assets/icons/chevron_down.svg',
                color: color ?? Colors.black,
              ),
            ),
            elevation: 16,
            style: TextStyle(color: color ?? Colors.black),
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            onChanged: isReadOnly ? null : onChange,
            disabledHint: Text(_selectedOption ?? '', style: TextStyle(color: color),),
            items: _options.map<DropdownMenuItem<dynamic>>(
              (InputFieldOption option) {
                return DropdownMenuItem<dynamic>(
                  value: option.code,
                  child: Text(
                    currentLanguage == 'lesotho' &&
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
          color: color,
        )
      ],
    );
  }
}
