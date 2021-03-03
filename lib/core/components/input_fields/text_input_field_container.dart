import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_icon.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_search_icon.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class TextInputFieldContainer extends StatefulWidget {
  const TextInputFieldContainer({
    Key key,
    @required this.inputField,
    this.onInputValueChange,
    this.inputValue,
    this.showInputCheckedIcon = true,
    this.showInputSearchIcon = false,
  }) : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;
  final String inputValue;
  final bool showInputCheckedIcon;
  final bool showInputSearchIcon;

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
    updateTextValue();
  }

  updateTextValue() {
    this.textController = TextEditingController(text: widget.inputValue);
  }

  onValueChange(String value) {
    setState(() {
      _value = value;
    });
    widget.onInputValueChange(value.trim());
  }

  @override
  void didUpdateWidget(covariant TextInputFieldContainer oldWidget) {
    super.didUpdateWidget(widget);
    if (oldWidget.inputValue != widget.inputValue) {
      updateTextValue();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              readOnly: widget.inputField.isReadOnly,
              controller: widget.inputField.isReadOnly
                  ? TextEditingController(
                      text: widget.inputValue,
                    )
                  : textController,
              onChanged: onValueChange,
              maxLines: widget.inputField.valueType == 'LONG_TEXT' ? null : 1,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle().copyWith(
                color: widget.inputField.inputColor,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                errorText: null,
              ),
            ),
          ),
          InputCheckedIcon(
            showTickedIcon: widget.showInputCheckedIcon &&
                _value != null &&
                '$_value'.trim() != '',
            color: widget.inputField.inputColor,
          ),
          Visibility(
            child: InputSearchIcon(),
            visible: widget.showInputSearchIcon,
          )
        ],
      ),
    );
  }
}
