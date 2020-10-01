import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class FormSection {
  String id;
  String name;
  Color color;
  Color backgroundColor;
  Color borderColor;
  String description;
  List<FormSection> subSections;
  List<InputField> inputFields;

  FormSection({
    this.id,
    @required this.name,
    @required this.color,
    this.backgroundColor,
    this.borderColor,
    this.subSections,
    this.description,
    this.inputFields,
  }) {
    this.id = this.id ?? AppUtil.getUid();
    this.backgroundColor = this.backgroundColor ?? Colors.transparent;
    this.borderColor = this.borderColor ?? Colors.transparent;
    this.subSections = this.subSections ?? [];
    this.inputFields = this.inputFields ?? [];
    this.description = this.description ?? "";
  }

  @override
  String toString() {
    return '$name';
  }
}
