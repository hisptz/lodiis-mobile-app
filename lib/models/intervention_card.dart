import 'package:flutter/material.dart';

class InterventionCard {
  String id;
  String uid;
  String name;
  String shortName;
  String svgIcon;
  Color primmaryColor;
  Color secondaryColor;
  Color svgIconColor;
  Color svgBackgroundColor;
  Color background;
  Color nameColor;
  Color countLabelColor;
  Color countColor;

  InterventionCard(
      {this.id,
      this.uid = '',
      this.name,
      this.shortName,
      this.svgIcon,
      this.primmaryColor,
      this.secondaryColor,
      this.svgIconColor,
      this.svgBackgroundColor,
      this.background,
      this.nameColor,
      this.countColor,
      this.countLabelColor});

  static List<InterventionCard> getInterventions() {
    return [
      InterventionCard(
        id: 'ovc',
        name: 'OVCs and caregivers',
        shortName: 'OVC',
        svgIcon: 'assets/icons/ovc-icon.svg',
        primmaryColor: Color(0xFF4B9F46),
        secondaryColor: Color(0xFF63BC48),
        svgIconColor: Color(0xFF4B9F46),
        svgBackgroundColor: Color(0xFFE5F1E4),
        background: Color(0xFFF6FAF6),
        nameColor: Color(0xFF1A3518),
        countColor: Color(0xFF4B9F46),
        countLabelColor: Color(0xFF8EA58C),
      ),
      InterventionCard(
        id: 'dreams',
        name: 'DREAMS - AGYW',
        shortName: 'DREAMS',
        svgIcon: 'assets/icons/dreams-icon.svg',
        primmaryColor: Color(0xFFC7461F),
        secondaryColor: Color(0xFFF1592A),
        svgIconColor: Color(0xFFF1592A),
        svgBackgroundColor: Color(0xFFFEEAE4),
        background: Color(0xFFFFFAF9),
        nameColor: Color(0xFF3F1A0F),
        countColor: Color(0xFFF1592A),
        countLabelColor: Color(0xFFCA9A8C),
      ),
    ];
  }
}
