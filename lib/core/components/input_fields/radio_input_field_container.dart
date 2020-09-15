import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class RadioInputFieldContainer extends StatefulWidget {
  const RadioInputFieldContainer(
      {Key key,
      @required this.options,
      @required this.currentValue,
      @required this.onInputValueChange})
      : super(key: key);

  final List<InputFieldOption> options;
  final dynamic currentValue;
  final Function onInputValueChange;

  @override
  _RadioInputFieldContainerState createState() =>
      _RadioInputFieldContainerState();
}

class _RadioInputFieldContainerState extends State<RadioInputFieldContainer> {
  bool _currentValue;

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
                  color: Colors.redAccent,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                            value: option.code,
                            groupValue: _currentValue,
                            onChanged: setSelectedOption),
                        Text(option.name)
                      ]),
                ))
            .toList(),
      ),
    );
  }
}
