import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class TrueOnlyInputFieldContainer extends StatefulWidget {
  const TrueOnlyInputFieldContainer({
    Key key,
    @required this.inputField,
    @required this.onInputValueChange,
    @required this.currentLanguage,
    this.inputValue,
  }) : super(key: key);

  final InputField inputField;
  final String currentLanguage;
  final Function onInputValueChange;
  final dynamic inputValue;

  @override
  _TrueOnlyInputFieldContainerState createState() =>
      _TrueOnlyInputFieldContainerState();
}

class _TrueOnlyInputFieldContainerState
    extends State<TrueOnlyInputFieldContainer> {
  bool _value;
  String _swithLabel;
  Color inActiveColor = Color(0xFF737373);
  String yesLabel = 'Yes';
  String noLabel = 'Yes';

  @override
  void initState() {
    super.initState();
    //@TODO Translation for switch values
    yesLabel = widget.currentLanguage == 'lesotho' ? 'Yes' : yesLabel;
    noLabel = widget.currentLanguage == 'lesotho' ? 'No' : noLabel;
    updateInputValueState();
  }

  updateInputValueState() {
    bool value = false;
    value = '${widget.inputValue}' == 'true' ? true : false;
    onSetValue(value);
  }

  @override
  void didUpdateWidget(covariant TrueOnlyInputFieldContainer oldWidget) {
    super.didUpdateWidget(widget);
    if (oldWidget.inputValue != widget.inputValue) updateInputValueState();
  }

  onSetValue(bool value) {
    setState(() {
      _value = value;
      _swithLabel = value ? yesLabel : noLabel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 30.0,
          margin: EdgeInsets.only(
            left: 5.0,
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: 1.0,
          ),
          child: Text(
            '$_swithLabel',
            style: TextStyle().copyWith(
              fontSize: 12.0,
              color: _value ? widget.inputField.inputColor : inActiveColor,
            ),
          ),
        ),
        Container(
          child: CupertinoSwitch(
            activeColor: widget.inputField.inputColor,
            trackColor: inActiveColor,
            value: _value,
            onChanged: widget.inputField.isReadOnly
                ? null
                : (bool value) {
                    onSetValue(value);
                    widget.onInputValueChange(
                      value ? value : '',
                    );
                  },
          ),
        ),
      ],
    );
  }
}
