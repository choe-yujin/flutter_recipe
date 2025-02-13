import 'package:flutter_recipe/data/data_source/search_data_source.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/repository/recent_search_recipe_repository.dart';

class RecentSearchRecipeRepositoryImpl implements RecentSearchRecipeRepository {
  final SearchDataSource _searchDataSource;

  RecentSearchRecipeRepositoryImpl({
    required SearchDataSource searchDataSource,
  }) : _searchDataSource = searchDataSource;

  @override
  Future<List<Recipe>> getRecentSearchRecipes() async {
    try {
      final recipesJson = await _searchDataSource.getRecentSearches();
      if (recipesJson.isEmpty) {
        return []; // 저장된 검색 결과가 없을 때
      }
      return recipesJson.map((e) => Recipe.fromJson(e)).toList();
    } catch (e) {
      return []; // SharedPreferences 접근 실패 등의 에러 상황
    }
  }

  @override
  Future<void> updateRecentSearchRecipes(List<Recipe> recipes) async {
    final recentRecipes = recipes.take(6).toList(); // 최근 6개만 저장
    final recipesJson = recentRecipes.map((e) => e.toJson()).toList();
    await _searchDataSource.saveRecentSearches(recipesJson);
  }
}