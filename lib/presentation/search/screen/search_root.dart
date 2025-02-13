import 'package:flutter/material.dart';
import 'package:flutter_recipe/data/data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe/data/data_source/search_data_source_impl.dart';
import 'package:flutter_recipe/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_recipe/data/repository/recent_search_recipe_repository_impl.dart';
import 'package:flutter_recipe/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/search/screen/search_screen.dart';
import 'package:flutter_recipe/presentation/search/search_view_model.dart';

final _recentSearchRecipeRepository =
    RecentSearchRecipeRepositoryImpl(searchDataSource: SearchDataSourceImpl());

class SearchRoot extends StatelessWidget {
  const SearchRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SearchViewModel(
      recentSearchRecipeRepository: _recentSearchRecipeRepository,
      searchRecipesUseCase: SearchRecipesUseCase(
        recipeRepository: MockRecipeRepositoryImpl(
          recipeDataSource: RecipeDataSourceImpl(),
        ),
        recentSearchRecipeRepository: RecentSearchRecipeRepositoryImpl(
            searchDataSource: SearchDataSourceImpl()),
      ),
    );

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return SearchScreen(
          state: viewModel.state,
          onChanged: viewModel.searchRecipes,
        );
      },
    );
  }
}
