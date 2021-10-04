import 'package:flutter/material.dart';

class InterventionCard {
  String? id;
  String? name;
  String? translatedName;
  String? shortName;
  String? translatedShortName;
  String? svgIcon;
  String? enrollmentIcon;
  Color? primaryColor;
  Color? secondaryColor;
  Color? svgIconColor;
  Color? svgIconBorderColor;
  Color? svgBackgroundColor;
  Color? background;
  Color? nameColor;
  Color? countLabelColor;
  Color? countColor;
  List<String>? supportedTabs;

  InterventionCard({
    this.id,
    this.name,
    this.translatedName,
    this.translatedShortName,
    this.shortName,
    this.svgIcon,
    this.enrollmentIcon,
    this.primaryColor,
    this.secondaryColor,
    this.svgIconColor,
    this.svgIconBorderColor,
    this.svgBackgroundColor,
    this.background,
    this.nameColor,
    this.countColor,
    this.countLabelColor,
    this.supportedTabs,
  });

  static List<String> getInterventionIds() {
    return getInterventions()
        .map((InterventionCard interventionCard) => interventionCard.id!)
        .toList()
        .toSet()
        .toList();
  }

  static List<InterventionCard> getInterventions() {
    return [
      InterventionCard(
        id: 'ovc',
        name: 'OVCs and caregivers',
        shortName: 'OVC',
        svgIcon: 'assets/icons/ovc-icon.svg',
        enrollmentIcon: 'assets/icons/add-house-hold.svg',
        primaryColor: Color(0xFF4B9F46),
        secondaryColor: Color(0xFF4B9F46).withOpacity(0.8),
        svgIconColor: Colors.white,
        svgIconBorderColor: Colors.white,
        svgBackgroundColor: Color(0xFF4B9F46).withOpacity(0.1),
        background: Color(0xFF4B9F46).withOpacity(0.09),
        nameColor: Color(0xFF4B9F46),
        countColor: Color(0xFF4B9F46).withOpacity(0.8),
        countLabelColor: Color(0xFF4B9F46).withOpacity(0.3),
        supportedTabs: [
          "services",
          "referral",
          "enrollment",
          "exit",
          "records"
        ],
      ),
      InterventionCard(
        id: 'dreams',
        name: 'DREAMS - AGYW',
        shortName: 'DREAMS',
        svgIcon: 'assets/icons/dreams-icon.svg',
        enrollmentIcon: 'assets/icons/add-beneficiary.svg',
        primaryColor: Color(0xFF1C7AB2),
        secondaryColor: Color(0xFF1C7AB2).withOpacity(0.8),
        svgIconColor: Colors.white,
        svgIconBorderColor: Colors.white,
        svgBackgroundColor: Color(0xFF1C7AB2).withOpacity(0.1),
        background: Color(0xFF1C7AB2).withOpacity(0.09),
        nameColor: Color(0xFF1C7AB2),
        countColor: Color(0xFF1C7AB2).withOpacity(0.8),
        countLabelColor: Color(0xFF1C7AB2).withOpacity(0.3),
        supportedTabs: [
          "services",
          "outGoingreferral",
          "incomingReferral",
          "enrollment",
          "noneAgyw",
          "records"
        ],
      ),
      InterventionCard(
        id: 'ogac',
        name: '9-14 OGAC',
        shortName: 'OGAC',
        svgIcon: 'assets/icons/ogac-icon.svg',
        enrollmentIcon: 'assets/icons/add-beneficiary.svg',
        primaryColor: Color(0xFFF05A2A),
        secondaryColor: Color(0xFFF05A2A).withOpacity(0.8),
        svgIconColor: Colors.white,
        svgIconBorderColor: Colors.white,
        svgBackgroundColor: Color(0xFFF05A2A).withOpacity(0.1),
        background: Color(0xFFF05A2A).withOpacity(0.09),
        nameColor: Color(0xFFF05A2A),
        countColor: Color(0xFFF05A2A).withOpacity(0.8),
        countLabelColor: Color(0xFFF05A2A).withOpacity(0.3),
        supportedTabs: [],
      ),
      InterventionCard(
        id: 'education',
        name: 'Education',
        shortName: 'Education',
        svgIcon: 'assets/icons/education-module-icon.svg',
        enrollmentIcon: 'assets/icons/add-beneficiary.svg',
        primaryColor: Color(0xFF2D9688),
        secondaryColor: Color(0xFF2D9688).withOpacity(0.8),
        svgIconColor: Colors.white,
        svgIconBorderColor: Colors.white,
        svgBackgroundColor: Color(0xFF2D9688).withOpacity(0.1),
        background: Color(0xFF2D9688).withOpacity(0.09),
        nameColor: Color(0xFF2D9688),
        countColor: Color(0xFF2D9688).withOpacity(0.8),
        countLabelColor: Color(0xFF2D9688).withOpacity(0.3),
        supportedTabs: ["lbse", "bursary"],
      ),
      InterventionCard(
        id: 'pp_prev',
        name: 'PP PREV',
        shortName: 'PP PREV',
        svgIcon: 'assets/icons/pp-prev-icon.svg',
        enrollmentIcon: 'assets/icons/add-beneficiary.svg',
        primaryColor: Color(0xFF9B2BAE),
        secondaryColor: Color(0xFF9B2BAE).withOpacity(0.8),
        svgIconColor: Colors.white,
        svgIconBorderColor: Colors.white,
        svgBackgroundColor: Color(0xFF9B2BAE).withOpacity(0.1),
        background: Color(0xFF9B2BAE).withOpacity(0.09),
        nameColor: Color(0xFF9B2BAE),
        countColor: Color(0xFF9B2BAE).withOpacity(0.8),
        countLabelColor: Color(0xFF9B2BAE).withOpacity(0.3),
        supportedTabs: [],
      ),
    ];
  }

  @override
  String toString() {
    return '$name - $id';
  }
}
