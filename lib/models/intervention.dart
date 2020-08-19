import 'package:flutter/material.dart';

class InterventionProgram {
  String id;
  String name;
  String svgIcon;
  Color primmaryColor;
  Color secondaryColor;

  InterventionProgram(
      {this.id,
      this.name,
      this.svgIcon,
      this.primmaryColor,
      this.secondaryColor});

  static List<InterventionProgram> getInterventions() {
    return [
      InterventionProgram(
          id: 'ovc',
          name: 'OVC',
          svgIcon: '',
          primmaryColor: Color(0xFF),
          secondaryColor: Color(0xFF)),
      InterventionProgram(
          id: 'dreams',
          name: 'DREAMS',
          svgIcon: '',
          primmaryColor: Color(0xFF),
          secondaryColor: Color(0xFF)),
    ];
  }
}
