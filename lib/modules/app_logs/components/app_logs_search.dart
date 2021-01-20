import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/text_input_field_container.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class AppLogsSearch extends StatelessWidget {
  AppLogsSearch({
    Key key,
    this.onSearchLogs,
  }) : super(key: key);

  final Function onSearchLogs;

  final InputField inputField = InputField(
    id: 'search',
    name: '',
    valueType: 'TEXT',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: 65.0,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.black12,
          ),
        ),
        child: TextInputFieldContainer(
          inputField: inputField,
          inputValue: '',
          showInputCheckedIcon: false,
          showInputSearchIcon: true,
          onInputValueChange: (dynamic value) => onSearchLogs(value),
        ),
      ),
    );
  }
}
