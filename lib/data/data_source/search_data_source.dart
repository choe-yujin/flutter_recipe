abstract interface class SearchDataSource {
  Future<List<Map<String, dynamic>>> getRecentSearches();
  Future<void> saveRecentSearches(List<Map<String, dynamic>> recipes);
}