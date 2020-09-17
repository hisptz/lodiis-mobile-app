import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class FormSection {
  String name;
  Color color;
  Color backgroundColor;
  Color borderColor;
  List<FormSection> subSections;
  List<InputField> inputFields;

  FormSection(
      {@required this.name,
      @required this.color,
      this.backgroundColor,
      this.borderColor,
      this.subSections,
      this.inputFields}) {
    this.backgroundColor = this.backgroundColor ?? Colors.transparent;
    this.borderColor = this.borderColor ?? Colors.transparent;
    this.subSections = this.subSections ?? [];
    this.inputFields = this.inputFields ?? [];
  }

  @override
  String toString() {
    return '$name';
  }
}
