import 'package:flutter/material.dart';

class InterventionProgram {
  String id;
  String name;
  String shortName;
  String svgIcon;
  Color primmaryColor;
  Color secondaryColor;

  InterventionProgram({
    this.id,
    this.name,
    this.shortName,
    this.svgIcon,
    this.primmaryColor,
    this.secondaryColor,
  });

  static List<InterventionProgram> getInterventions() {
    return [
      InterventionProgram(
        id: 'ovc',
        name: 'OVCs and caregivers',
        shortName: 'OVC',
        svgIcon: '',
        primmaryColor: Color(0xFF4B9F46),
        secondaryColor: Color(0xFF63BC48),
      ),
      InterventionProgram(
        id: 'dreams',
        name: 'DREAMS - AGYW',
        shortName: 'DREAMS',
        svgIcon: '',
        primmaryColor: Color(0xFFC7461F),
        secondaryColor: Color(0xFFF1592A),
      ),
    ];
  }
}
