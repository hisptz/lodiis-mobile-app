import 'package:flutter/material.dart';

class InputFieldOption {
  String name;
  String translatedName;
  dynamic code;

  InputFieldOption({
    @required this.code,
    @required this.name,
    this.translatedName,
  });

  @override
  String toString() => '$name $code';
}
