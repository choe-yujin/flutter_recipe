import 'package:flutter_recipe/data/data_source/search_data_source.dart';

class SearchDataSourceImpl implements SearchDataSource {
  // 싱글턴 인스턴스를 위한 private 생성자
  static final SearchDataSourceImpl _instance = SearchDataSourceImpl._internal();

  // private 생성자
  SearchDataSourceImpl._internal();

  // 싱글턴 인스턴스를 반환하는 getter
  factory SearchDataSourceImpl() {
    return _instance;
  }

  // 메모리 상에 저장된 최근 검색 리스트
  final List<Map<String, dynamic>> _recentSearches = [];

  @override
  Future<List<Map<String, dynamic>>> getRecentSearches() async {
    // 최근 검색 결과를 반환
    return _recentSearches;
  }

  @override
  Future<void> saveRecentSearches(List<Map<String, dynamic>> recipes) async {
    // 새로운 검색 결과를 저장
    print('Saving recent searches: ${recipes.length} items');
    _recentSearches
      ..clear() // 이전 검색결과를 지우고
      ..addAll(recipes); // 새로운 검색결과를 추가
  }
}
