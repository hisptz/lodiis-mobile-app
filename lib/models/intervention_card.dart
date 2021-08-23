import 'package:flutter/material.dart';

class InterventionCard {
  String? id;
  String? name;
  String? translatedName;
  String? shortName;
  String? translatedShortName;
  String? svgIcon;
  Color? primaryColor;
  Color? secondaryColor;
  Color? svgIconColor;
  Color? svgIconBorderColor;
  Color? svgBackgroundColor;
  Color? background;
  Color? nameColor;
  Color? countLabelColor;
  Color? countColor;

  InterventionCard({
    this.id,
    this.name,
    this.translatedName,
    this.translatedShortName,
    this.shortName,
    this.svgIcon,
    this.primaryColor,
    this.secondaryColor,
    this.svgIconColor,
    this.svgIconBorderColor,
    this.svgBackgroundColor,
    this.background,
    this.nameColor,
    this.countColor,
    this.countLabelColor,
  });

  static List<InterventionCard> getInterventions() {
    return [
      InterventionCard(
        id: 'ovc',
        name: 'OVCs and caregivers',
        shortName: 'OVC',
        svgIcon: 'assets/icons/ovc-icon.svg',
        primaryColor: Color(0xFF4B9F46),
        secondaryColor: Color(0xFF63BC48),
        svgIconColor: Color(0xFFB9F8A6),
        svgIconBorderColor: Color(0xFF6CBA63),
        svgBackgroundColor: Color(0xFFE5F1E4),
        background: Color(0xFFEEF2ED),
        nameColor: Color(0xFF1A3518),
        countColor: Color(0xFF4B9F46),
        countLabelColor: Color(0xFF8EA58C),
      ),
      InterventionCard(
        id: 'dreams',
        name: 'DREAMS - AGYW',
        shortName: 'DREAMS',
        svgIcon: 'assets/icons/dreams-icon.svg',
        primaryColor: Color(0xFF1C7AB2),
        secondaryColor: Color(0xFF1F8ECE),
        svgIconColor: Color(0xFF8FD6FF),
        svgIconBorderColor: Color(0xFF8FD6FF),
        svgBackgroundColor: Color(0xFFE2F1F9),
        background: Color(0xFFF4F7F9),
        nameColor: Color(0xFF071E2C),
        countColor: Color(0xFF1F8ECE),
        countLabelColor: Color(0xFF8CC5E6),
      ),
      InterventionCard(
        id: 'ogac',
        name: '9-14 OGAC',
        shortName: 'OGAC',
        svgIcon: 'assets/icons/ogac-icon.svg',
        primaryColor: Color(0xFFF05A2A),
        secondaryColor: Color(0xFFF05A2A).withOpacity(0.8),
        svgIconColor: Colors.white,
        svgIconBorderColor: Colors.white,
        svgBackgroundColor: Color(0xFFF05A2A).withOpacity(0.1),
        background: Color(0xFFF05A2A).withOpacity(0.09),
        nameColor: Color(0xFF651900),
        countColor: Color(0xFF651900).withOpacity(0.8),
        countLabelColor: Color(0xFF651900).withOpacity(0.3),
      ),
    ];
  }

  @override
  String toString() {
    return '$name - $id';
  }
}
