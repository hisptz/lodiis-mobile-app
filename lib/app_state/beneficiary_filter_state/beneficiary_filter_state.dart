import 'package:flutter/material.dart';

class BeneficiaryFilterState with ChangeNotifier {
  List<Map<String, dynamic>> _filters = [];

  List<Map<String, dynamic>> get filters => _filters;

  void addOrUpdateFilter(String key, dynamic value) {
    _filters.removeWhere((filter) => filter.keys.contains(key));
    _filters.add({'$key': value});
    notifyListeners();
  }

  dynamic getFilterValue(String key) {
    try {
      return _filters.firstWhere(
            (filter) => filter.keys.contains(key),
          )[key] ??
          '';
    } catch (e) {
      return '';
    }
  }

  void clearFilters() {
    _filters.clear();
    notifyListeners();
  }
}
