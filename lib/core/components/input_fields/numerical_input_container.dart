import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class NumericalInputFieldContainer extends StatefulWidget {
  const NumericalInputFieldContainer(
      {Key key, @required this.inputField, @required this.onInputValueChange})
      : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;

  @override
  _NumericalInputFieldContainerState createState() =>
      _NumericalInputFieldContainerState();
}

class _NumericalInputFieldContainerState
    extends State<NumericalInputFieldContainer> {
  Color valueColor = Color(0xFF182E35);

  void onValueChange(String value) {
    // @TODO handling error messages
    setState(() {});
    widget.onInputValueChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
          keyboardType: TextInputType.number,
          onChanged: onValueChange,
          style: TextStyle().copyWith(color: valueColor),
          decoration: InputDecoration(
            border: InputBorder.none,
            errorText: null,
          )),
    );
  }
}
