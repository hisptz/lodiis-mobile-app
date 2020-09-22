import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_cion.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class PhoneNumberInputFieldContainer extends StatefulWidget {
  const PhoneNumberInputFieldContainer(
      {Key key,
      @required this.inputField,
      @required this.onInputValueChange,
      this.inputValue})
      : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;
  final String inputValue;

  @override
  _PhoneNumberInputFieldContainerState createState() =>
      _PhoneNumberInputFieldContainerState();
}

class _PhoneNumberInputFieldContainerState
    extends State<PhoneNumberInputFieldContainer> {
  Color valueColor = Color(0xFF182E35);
  TextEditingController phoneNumberController;
  String _value;

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.inputValue;
    });
    phoneNumberController = TextEditingController(text: widget.inputValue);
  }

  void onValueChange(String value) {
    // @TODO handling error messages
    setState(() {
      _value = value;
    });
    widget.onInputValueChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  onChanged: onValueChange,
                  style: TextStyle().copyWith(color: valueColor),
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorText: null,
                  ))),
          InputCheckedIcon(
            showTickedIcon: _value != null,
            color: widget.inputField.inputColor,
          )
        ],
      ),
    );
  }
}
