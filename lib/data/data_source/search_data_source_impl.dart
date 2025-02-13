import 'dart:convert';
import 'package:flutter_recipe/data/data_source/search_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchDataSourceImpl implements SearchDataSource {
  static const String _recentSearchKey = 'recent_searches';
  final SharedPreferences _prefs;

  SearchDataSourceImpl({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  @override
  Future<List<Map<String, dynamic>>> getRecentSearches() async {
    final jsonString = _prefs.getString(_recentSearchKey);
    if (jsonString == null) return [];

    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.cast<Map<String, dynamic>>();
  }

  @override
  Future<void> saveRecentSearches(List<Map<String, dynamic>> recipes) async {
    final jsonString = jsonEncode(recipes);
    await _prefs.setString(_recentSearchKey, jsonString);
  }
}