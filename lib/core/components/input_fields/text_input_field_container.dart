import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_cion.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class TextInputFieldContainer extends StatefulWidget {
  const TextInputFieldContainer({
    Key key,
    @required this.inputField,
    this.onInputValueChange,
  }) : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;

  @override
  _TextInputFieldContainerState createState() =>
      _TextInputFieldContainerState();
}

class _TextInputFieldContainerState extends State<TextInputFieldContainer> {
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    this.textController = TextEditingController(text: widget.inputField.value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                  controller: textController,
                  onChanged: widget.onInputValueChange,
                  maxLines:
                      widget.inputField.valueType == 'LONG_TEXT' ? null : 1,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  style: TextStyle().copyWith(color: Color(0xFF182E35)),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorText: null,
                  ))),
          InputCheckedIcon(
            showTickedIcon: false,
            color: widget.inputField.inputColor,
          )
        ],
      ),
    );
  }
}
