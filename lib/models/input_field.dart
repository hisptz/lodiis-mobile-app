import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class InputField {
  String id;
  String name;
  String description;
  String valueType;
  String value;
  Color color;
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
      this.color,
      this.background,
      this.options,
      this.subInputField}) {
    this.description = this.description ?? '';
    this.hasSubInputField = this.hasSubInputField ?? false;
    this.value = this.value ?? '';
    this.options = this.options ?? [];
    this.color = this.color ?? Colors.black;
    this.background = this.background ?? Colors.transparent;
  }

  @override
  String toString() {
    return '$id - $name';
  }
}
