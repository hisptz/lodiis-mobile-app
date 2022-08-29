import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_icon.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class PhoneNumberInputFieldContainer extends StatefulWidget {
  const PhoneNumberInputFieldContainer(
      {Key? key,
      required this.inputField,
      required this.onInputValueChange,
      this.inputValue})
      : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;
  final String? inputValue;

  @override
  _PhoneNumberInputFieldContainerState createState() =>
      _PhoneNumberInputFieldContainerState();
}

class _PhoneNumberInputFieldContainerState
    extends State<PhoneNumberInputFieldContainer> {
  TextEditingController? phoneNumberController;
  String? _value;

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.inputValue;
    });
    phoneNumberController = TextEditingController(text: widget.inputValue);
  }

  void onValueChange(String value) {
    setState(() {
      _value = value;
    });
    widget.onInputValueChange(value.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            readOnly: widget.inputField.isReadOnly!,
            controller: phoneNumberController,
            inputFormatters: widget.inputField.regExpValidation != null
                ? [
                    FilteringTextInputFormatter.allow(
                        widget.inputField.regExpValidation as Pattern),
                    LengthLimitingTextInputFormatter(10),
                  ]
                : [],
            keyboardType: TextInputType.phone,
            onChanged: onValueChange,
            style: const TextStyle().copyWith(
              color: widget.inputField.inputColor,
            ),
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
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
    );
  }
}
