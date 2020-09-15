import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class CoordinteInputFieldContainer extends StatelessWidget {
  const CoordinteInputFieldContainer(
      {Key key, @required this.inputField, @required this.onInputValueChange})
      : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('COORDINATE'));
  }
}
