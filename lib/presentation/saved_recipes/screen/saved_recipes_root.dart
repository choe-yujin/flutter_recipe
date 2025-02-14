import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/di/di_setup.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe/presentation/saved_recipes/screen/saved_recipes_screen.dart';

class SavedRecipesRoot extends StatelessWidget {
  const SavedRecipesRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<SavedRecipesViewModel>(); // 호출할 때마다 새로운 인스턴스 받을 수 있음

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        final state = viewModel.state;
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return SavedRecipesScreen(recipes: state.recipes);
      },
    );
  }
}