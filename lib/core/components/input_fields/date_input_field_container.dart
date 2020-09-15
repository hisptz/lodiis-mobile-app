import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_cion.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class DateInputFieldContainer extends StatelessWidget {
  const DateInputFieldContainer(
      {Key key, @required this.inputField, @required this.onInputValueChange})
      : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: Text(inputField.valueType)),
          InputCheckedIcon(
            showTickedIcon: false,
            color: inputField.color,
          )
        ],
      ),
    );
  }
}
