import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/select_input_field.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class InputFieldContainer extends StatelessWidget {
  const InputFieldContainer({Key key, @required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    final List<InputFieldOption> options = [
      InputFieldOption(code: 'one', name: 'One'),
      InputFieldOption(code: 'two', name: 'Two'),
      InputFieldOption(code: 'three', name: 'Three'),
      InputFieldOption(code: 'four', name: 'Four')
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Label',
                  style: TextStyle().copyWith(color: color, fontSize: 14.0),
                ))
              ],
            ),
          ),
          Container(
              child: SelectInputField(
            options: options,
            color: color,
          )),
          LineSeperator(color: color ?? Colors.transparent)
        ],
      ),
    );
  }
}
