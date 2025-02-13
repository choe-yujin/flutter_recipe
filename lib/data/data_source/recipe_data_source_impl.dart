import 'package:flutter_recipe/data/mock/recipe_mock_data.dart';
import 'package:flutter_recipe/data/data_source/recipe_data_source.dart';

class RecipeDataSourceImpl implements RecipeDataSource {
  @override
  Future<List<Map<String, dynamic>>> getRecipes() async {
    // mock 데이터를 사용하되, 실제 API 호출처럼 약간의 지연 추가
    await Future.delayed(const Duration(milliseconds: 500));
    return recipeData['recipes']!;
  }
}