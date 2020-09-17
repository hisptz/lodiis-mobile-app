import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class RadioInputFieldContainer extends StatefulWidget {
  const RadioInputFieldContainer(
      {Key key,
      @required this.options,
      @required this.currentValue,
      @required this.onInputValueChange,
      this.activeColor})
      : super(key: key);

  final List<InputFieldOption> options;
  final dynamic currentValue;
  final Function onInputValueChange;
  final Color activeColor;

  @override
  _RadioInputFieldContainerState createState() =>
      _RadioInputFieldContainerState();
}

class _RadioInputFieldContainerState extends State<RadioInputFieldContainer> {
  dynamic _currentValue;

  void setSelectedOption(dynamic value) {
    setState(() {
      _currentValue = value;
    });
    widget.onInputValueChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Wrap(
        children: widget.options
            .map((InputFieldOption option) => Container(
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            activeColor: widget.activeColor,
                            value: option.code,
                            groupValue: _currentValue,
                            onChanged: setSelectedOption),
                        Container(
                          child: Text(option.name),
                        )
                      ]),
                ))
            .toList(),
      ),
    );
  }
}
