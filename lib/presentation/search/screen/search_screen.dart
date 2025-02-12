import 'package:flutter/material.dart';
import 'package:flutter_recipe/presentation/components/recipe_grid_item.dart';
import 'package:flutter_recipe/presentation/components/search_input_field.dart';
import 'package:flutter_recipe/ui/color_styles.dart';
import 'package:flutter_recipe/ui/text_styles.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 임시 데이터
    final dummyRecipes = [
      Recipe(
        category: "Indian",
        id: 1,
        name: "Traditional spare ribs baked",
        image: "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg",
        chef: "Chef John",
        time: "20 min",
        rating: 4.0,
        ingredients: const [],
      ),
      Recipe(
        category: "Asian",
        id: 2,
        name: "Spice roasted chicken",
        image: "https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg",
        chef: "Mark Kelvin",
        time: "20 min",
        rating: 4.0,
        ingredients: const [],
      ),
    ];

    final isLoading = false; // 임시 로딩 상태

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search recipes',
          style: TextStyles.mediumTextBold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 17),
            Row(
              children: [
                const Expanded(
                  child: SearchInputField(placeHolder: 'Search Recipe'),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorStyles.primary100,
                  ),
                  child: const Icon(
                    Icons.tune,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Search',
              style: TextStyles.normalTextBold,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: isLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                ),
                itemCount: dummyRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = dummyRecipes[index];
                  return RecipeGridItem(recipe: recipe);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}