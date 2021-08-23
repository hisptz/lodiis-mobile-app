import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class InputField {
  String id;
  String name;
  String? translatedName;
  String? description;
  String? translatedDescription;
  String valueType;
  Color? labelColor;
  Color? inputColor;
  Color? background;
  bool? renderAsRadio;
  bool? isReadOnly;
  bool? allowFuturePeriod;
  bool? showCountryLevelTree;
  bool? disablePastPeriod;
  bool? hasError;
  int? minAgeInYear;
  int? maxAgeInYear;
  int? numberOfMonth;
  bool? shouldUserCustomAgeLimit;
  String? suffixLabel;
  String? hint;
  String? translatedHint;
  List<InputFieldOption>? options;
  bool? hasSubInputField;
  InputField? subInputField;
  List<int>? allowedSelectedLevels;
  List<String>? filteredPrograms;

  InputField({
    required this.id,
    required this.name,
    required this.valueType,
    this.hasSubInputField,
    this.description,
    this.inputColor,
    this.labelColor,
    this.background,
    this.renderAsRadio,
    this.isReadOnly,
    this.options,
    this.subInputField,
    this.allowedSelectedLevels,
    this.allowFuturePeriod,
    this.disablePastPeriod,
    this.translatedName,
    this.translatedDescription,
    this.hint,
    this.translatedHint,
    this.maxAgeInYear,
    this.minAgeInYear,
    this.numberOfMonth,
    this.suffixLabel,
    this.filteredPrograms,
    this.hasError,
    this.shouldUserCustomAgeLimit,
    this.showCountryLevelTree,
  }) {
    this.showCountryLevelTree = this.showCountryLevelTree ?? false;
    this.allowedSelectedLevels = this.allowedSelectedLevels ?? [];
    this.allowFuturePeriod = this.allowFuturePeriod ?? false;
    this.disablePastPeriod = this.disablePastPeriod ?? false;
    this.isReadOnly = this.isReadOnly ?? false;
    this.description = this.description ?? '';
    this.hasSubInputField = this.hasSubInputField ?? false;
    this.renderAsRadio = this.renderAsRadio ?? false;
    this.options = this.options ?? [];
    this.filteredPrograms = this.filteredPrograms ?? [];
    this.inputColor = this.inputColor ?? Colors.black;
    this.labelColor = this.labelColor ?? Color(0xFF1A3518);
    this.background = this.background ?? Colors.transparent;
    this.suffixLabel = this.suffixLabel ?? '';
  }

  @override
  String toString() {
    return '$id - $name - $isReadOnly';
  }
}
