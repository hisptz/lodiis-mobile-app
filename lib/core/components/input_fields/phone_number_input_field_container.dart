import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_icon.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class PhoneNumberInputFieldContainer extends StatefulWidget {
  const PhoneNumberInputFieldContainer(
      {Key? key,
      required this.inputField,
      this.lastUpdatedId,
      required this.onInputValueChange,
      this.inputValue})
      : super(key: key);

  final InputField inputField;
  final String? lastUpdatedId;
  final Function onInputValueChange;
  final String? inputValue;

  @override
  State<PhoneNumberInputFieldContainer> createState() =>
      _PhoneNumberInputFieldContainerState();
}

class _PhoneNumberInputFieldContainerState
    extends State<PhoneNumberInputFieldContainer> {
  TextEditingController? phoneNumberController;
  String? _value;
  String? _lastInputValue = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.inputValue;
    });
    updatePhoneNumberValue(value: widget.inputValue);
  }

  updatePhoneNumberValue({String? value = ''}) {
    _value = value;
    setState(() {});
    phoneNumberController = TextEditingController(text: value);
  }

  @override
  void didUpdateWidget(covariant PhoneNumberInputFieldContainer oldWidget) {
    super.didUpdateWidget(widget);
    if (oldWidget.inputValue != widget.inputValue) {
      if (widget.inputField.isReadOnly! ||
          (widget.lastUpdatedId!.isNotEmpty &&
              widget.lastUpdatedId != widget.inputField.id)) {
        updatePhoneNumberValue(value: widget.inputValue);
      }
      if (widget.inputValue == null || widget.inputValue == '') {
        updatePhoneNumberValue();
      }
    }
  }

  void onValueChange(String value) {
    if (_lastInputValue != value) {
      _value = value;
      _lastInputValue = _value;
      setState(() {});
      widget.onInputValueChange(value.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            readOnly: widget.inputField.isReadOnly!,
            controller: phoneNumberController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                widget.inputField.regExpValidation as Pattern,
              ),
              LengthLimitingTextInputFormatter(10),
            ],
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
