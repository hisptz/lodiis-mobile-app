import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kb_mobile_app/core/components/input_fields/input_checked_icon.dart';
import 'package:kb_mobile_app/core/services/data_quality_service.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class NumericalInputFieldContainer extends StatefulWidget {
  const NumericalInputFieldContainer({
    Key? key,
    required this.inputField,
    this.lastUpdatedId,
    required this.onInputValueChange,
    this.inputValue,
  }) : super(key: key);

  final InputField inputField;
  final String? lastUpdatedId;
  final Function onInputValueChange;
  final String? inputValue;

  @override
  State<NumericalInputFieldContainer> createState() =>
      _NumericalInputFieldContainerState();
}

class _NumericalInputFieldContainerState
    extends State<NumericalInputFieldContainer> {
  TextEditingController? numericalController;
  String? _value;

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.inputValue;
    });
    updateNumericalValue(value: widget.inputValue);
  }

  updateNumericalValue({String? value = ''}) {
    setState(() {
      _value = value;
    });
    numericalController = TextEditingController(text: widget.inputValue);
  }

  void onValueChange(String value) {
    String sanitizedValue =
        DataQualityService.getSanitizedNumericalValue(value);
    setState(() {
      _value = sanitizedValue;
    });
    widget.onInputValueChange(sanitizedValue.trim());
  }

  @override
  void didUpdateWidget(covariant NumericalInputFieldContainer oldWidget) {
    super.didUpdateWidget(widget);
    if (oldWidget.inputValue != widget.inputValue) {
      if (widget.inputField.isReadOnly! ||
          (widget.lastUpdatedId!.isNotEmpty &&
              widget.lastUpdatedId != widget.inputField.id)) {
        updateNumericalValue(value: widget.inputValue);
      }
      if (widget.inputValue == null || widget.inputValue == '') {
        updateNumericalValue();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            readOnly: widget.inputField.isReadOnly!,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  widget.inputField.regExpValidation as Pattern),
              LengthLimitingTextInputFormatter(
                  widget.inputField.limitingNumericLength),
            ],
            controller: widget.inputField.isReadOnly!
                ? TextEditingController(
                    text: widget.inputValue,
                  )
                : numericalController,
            keyboardType: TextInputType.number,
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
        Visibility(
          visible: widget.inputField.suffixLabel != '' &&
              _value != null &&
              '$_value'.trim() != '',
          child: Text(widget.inputField.suffixLabel ?? '',
              style: const TextStyle().copyWith(
                color: widget.inputField.inputColor,
              )),
        ),
        InputCheckedIcon(
          showTickedIcon: _value != null && '$_value'.trim() != '',
          color: widget.inputField.inputColor,
        )
      ],
    );
  }
}
