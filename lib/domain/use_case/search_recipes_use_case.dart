import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/repository/recent_search_recipe_repository.dart';
import 'package:flutter_recipe/domain/repository/recipe_repository.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final RecentSearchRecipeRepository _recentSearchRecipeRepository;

  const SearchRecipesUseCase({
    required RecipeRepository recipeRepository,
    required RecentSearchRecipeRepository recentSearchRecipeRepository,
  })  : _recipeRepository = recipeRepository,
        _recentSearchRecipeRepository = recentSearchRecipeRepository;

  Future<List<Recipe>> execute(String query) async {
    if (query.isEmpty) {
      return [];
    }

    final results = (await _recipeRepository.getRecipes())
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // 최근 검색 결과를 메모리에 저장
    //print('Updating recent search recipes: ${results.length} items');
    await _recentSearchRecipeRepository.updateRecentSearchRecipes(results);

    return results;
  }
}
