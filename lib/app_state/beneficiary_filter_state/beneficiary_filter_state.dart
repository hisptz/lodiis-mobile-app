import 'package:flutter/material.dart';

class BeneficiaryFilterState with ChangeNotifier {
  final Map<String, List<Map<String, dynamic>>> _filters = {
    'dreams': [],
    'ovc': [],
    'ogac': [],
    'pp_prev': [],
    'lbse': [],
    'bursary': [],
  };

  Map<String, List<Map<String, dynamic>>> get filters => _filters;

  void addOrUpdateFilter(String program, String key, dynamic value) {
    if (_filters.containsKey(program)) {
      List<Map<String, dynamic>> programFilters = _filters[program]!;
      programFilters.removeWhere((filter) => filter.keys.contains(key));
      programFilters.add({key: value});

      _filters[program] = programFilters;
      notifyListeners();
    }
  }

  dynamic getFilterValue(String program, String key) {
    try {
      if (_filters.containsKey(program)) {
        return (_filters[program] ?? []).firstWhere(
              (filter) => filter.keys.contains(key),
            )[key] ??
            '';
      }
    } catch (e) {
      return '';
    }
  }

  List<Map<String, dynamic>> getFiltersByProgram(String program) {
    return _filters[program] ?? [];
  }

  void clearFilterById(String program, String filterId) {
    if (_filters.containsKey(program)) {
      List<Map<String, dynamic>> programFilters = _filters[program]!;
      programFilters.removeWhere((filter) => filter.keys.contains(filterId));

      _filters[program] = programFilters;
      notifyListeners();
    }
  }

  void clearFiltersByProgram(String program) {
    _filters[program] = [];
    notifyListeners();
  }

  void clearFilters() {
    _filters.clear();
    notifyListeners();
  }
}
