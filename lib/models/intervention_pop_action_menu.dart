import 'package:flutter/material.dart';

class InterventionPopActionMenu {
  String? id;
  String? name;
  String? translatedName;
  Color? color;
  FontWeight fontWeight;

  InterventionPopActionMenu({
    this.id,
    this.name,
    this.translatedName,
    this.color = const Color(0xFF1A3518),
    this.fontWeight = FontWeight.normal,
  });

  static List<InterventionPopActionMenu>
      getDefaultInterventionPopActionMenus() {
    return [
      InterventionPopActionMenu(
        id: 'logout',
        name: 'Logout',
        translatedName: ''
      ),
      InterventionPopActionMenu(
        id: 'about',
        name: 'About App',
      ),
      InterventionPopActionMenu(
        id: 'sync',
        name: 'Sync',
      ),
      InterventionPopActionMenu(
        id: 'language_setting',
        name: 'Language Settings',
        translatedName: 'Khetha Puo',
      ),
      InterventionPopActionMenu(
        id: 'application_logs',
        name: 'Application Logs',
      ),
    ];
  }

  @override
  String toString() {
    return '$name - $id';
  }
}
