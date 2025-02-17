import 'package:flutter/material.dart';
import 'package:flutter_recipe/domain/repository/recent_search_recipe_repository.dart';
import 'package:flutter_recipe/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/filter/filter_state.dart';
import 'package:flutter_recipe/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecentSearchRecipeRepository _recentSearchRecipeRepository;
  final SearchRecipesUseCase _searchRecipesUseCase;

  SearchViewModel({
    required RecentSearchRecipeRepository recentSearchRecipeRepository,
    required SearchRecipesUseCase searchRecipesUseCase,
  })  : _recentSearchRecipeRepository = recentSearchRecipeRepository,
        _searchRecipesUseCase = searchRecipesUseCase {
    _loadRecentSearchRecipes();
  }

  SearchState _state = const SearchState();

  SearchState get state => _state;

  // 최근 검색 결과 로드
  void _loadRecentSearchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final recentSearches =
        await _recentSearchRecipeRepository.getRecentSearchRecipes();

    //print('Loaded recent searches: ${recentSearches.length} items');

    _state = state.copyWith(
      recipes: recentSearches,
      isLoading: false,
    );
    notifyListeners();
  }

  // 검색 메서드
  void searchRecipes(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final results = await _searchRecipesUseCase.execute(query);

    _state = state.copyWith(
      recipes: results,
      isLoading: false,
    );
    notifyListeners();
  }

  void onChangeFilter(FilterState filterState) async {
    _state = state.copyWith(filterState: filterState);
    notifyListeners();

    print(state.toString());
  }
}
