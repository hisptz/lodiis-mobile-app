import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/select_input_field.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class InputFieldContainer extends StatelessWidget {
  const InputFieldContainer({
    Key key,
    @required this.inputField,
  }) : super(key: key);

  final InputField inputField;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      decoration: BoxDecoration(color: inputField.background),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  inputField.name,
                  style: TextStyle()
                      .copyWith(color: inputField.color, fontSize: 14.0),
                ))
              ],
            ),
          ),
          Visibility(
              visible: inputField.hasSubInputField,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 3, child: Container(child: Text('Main input'))),
                  Expanded(flex: 2, child: Container(child: Text('Sub input'))),
                ],
              )),
          Visibility(
              visible:
                  !inputField.hasSubInputField && inputField.options.length > 0,
              child: Container(
                  child: SelectInputField(
                selectedOption: inputField.value,
                options: inputField.options,
                color: inputField.color,
              ))),
          LineSeperator(color: inputField.color ?? Colors.transparent)
        ],
      ),
    );
  }
}
