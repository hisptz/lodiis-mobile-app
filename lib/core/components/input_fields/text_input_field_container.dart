import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_icon.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class TextInputFieldContainer extends StatefulWidget {
  const TextInputFieldContainer({
    Key key,
    @required this.inputField,
    this.onInputValueChange,
    this.inputValue,
  }) : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;
  final String inputValue;

  @override
  _TextInputFieldContainerState createState() =>
      _TextInputFieldContainerState();
}

class _TextInputFieldContainerState extends State<TextInputFieldContainer> {
  TextEditingController textController;
  String _value;

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.inputValue;
    });
    this.textController = TextEditingController(text: widget.inputValue);
  }

  onValueChange(String value) {
    setState(() {
      _value = value;
    });
    widget.onInputValueChange(value.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              readOnly: widget.inputField.isReadObly,
              controller: widget.inputField.isReadObly
                  ? TextEditingController(text: widget.inputValue)
                  : textController,
              onChanged: onValueChange,
              maxLines: widget.inputField.valueType == 'LONG_TEXT' ? null : 1,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle().copyWith(color: Color(0xFF182E35)),
              decoration: InputDecoration(
                border: InputBorder.none,
                errorText: null,
              ),
            ),
          ),
          InputCheckedIcon(
            showTickedIcon: _value != null && '$_value'.trim() != '',
            color: widget.inputField.inputColor,
          )
        ],
      ),
    );
  }
}
