import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../model/employee_model.dart';


class CacheManager {
  static const String _employeesKey = 'cached_employees';

  Future<void> cacheEmployees(List<User> employees) async {
    final prefs = await SharedPreferences.getInstance();
    final employeesJson = employees.map((e) => e.toJson()).toList();
    await prefs.setString(_employeesKey, jsonEncode(employeesJson));
  }

  Future<List<User>> getCachedEmployees() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final employeesJson = prefs.getString(_employeesKey);

      if (employeesJson != null) {
        final List<dynamic> decodedJson = jsonDecode(employeesJson);
        return decodedJson.map((json) => User.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}