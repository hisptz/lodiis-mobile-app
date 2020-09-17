import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class InputField {
  String id;
  String name;
  String description;
  String valueType;
  dynamic value;
  Color labelColor;
  Color inputColor;
  Color background;
  List<InputFieldOption> options;
  bool hasSubInputField;
  InputField subInputField;

  InputField(
      {@required this.id,
      @required this.name,
      @required this.valueType,
      this.hasSubInputField,
      this.description,
      this.value,
      this.inputColor,
      this.labelColor,
      this.background,
      this.options,
      this.subInputField}) {
    this.description = this.description ?? '';
    this.hasSubInputField = this.hasSubInputField ?? false;
    this.value = this.value ?? null;
    this.options = this.options ?? [];
    this.inputColor = this.inputColor ?? Colors.black;
    this.labelColor = this.labelColor ?? Colors.black;
    this.background = this.background ?? Colors.transparent;
  }

  @override
  String toString() {
    return '$id - $name';
  }
}
