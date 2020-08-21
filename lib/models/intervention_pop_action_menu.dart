import 'package:flutter/material.dart';

class InterventionPopActionMenu {
  String id;
  String name;
  Color color;

  InterventionPopActionMenu(
      {this.id, this.name, this.color = const Color(0xFF1A3518)});

  static List<InterventionPopActionMenu>
      getDefaultInterventionPopActionMenus() {
    return [
      InterventionPopActionMenu(id: 'logout', name: 'Logout'),
      InterventionPopActionMenu(id: 'sync', name: 'Sync'),
      InterventionPopActionMenu(id: 'settings', name: 'Settings'),
      InterventionPopActionMenu(id: 'report', name: 'Report'),
      InterventionPopActionMenu(id: 'profile', name: 'Profiles'),
    ];
  }

  @override
  String toString() {
    return '$name - $id';
  }
}
