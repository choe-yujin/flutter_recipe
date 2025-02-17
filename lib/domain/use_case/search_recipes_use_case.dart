import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:flutter_recipe/domain/repository/recent_search_recipe_repository.dart';
import 'package:flutter_recipe/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe/presentation/search/filter_state.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final RecentSearchRecipeRepository _recentSearchRecipeRepository;

  const SearchRecipesUseCase({
    required RecipeRepository recipeRepository,
    required RecentSearchRecipeRepository recentSearchRecipeRepository,
  })  : _recipeRepository = recipeRepository,
        _recentSearchRecipeRepository = recentSearchRecipeRepository;

  Future<List<Recipe>> execute(
    String query,
    FilterState filterState,
  ) async {
    if (query.isEmpty) {
      return [];
    }

    final results = (await _recipeRepository.getRecipes())
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
        .where(
          (e) {
            if (filterState.time == 'All') {
              return true;
            } else {
              return filterState.time == e.time;
            }
          },
        )
        .where((e) => e.rating >= filterState.rate)
        .where((e) {
          if (filterState.category == 'All') {
            return true;
          } else {
            return filterState.category == e.category;
          }
        });

    // 최근 검색 결과를 메모리에 저장
    //print('Updating recent search recipes: ${results.length} items');
    _recentSearchRecipeRepository.updateRecentSearchRecipes(
      results.toList(),
    );

    return results.toList();
  }
}
