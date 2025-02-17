import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/di/di_setup.dart';
import 'package:flutter_recipe/presentation/search/filter_state.dart';
import 'package:flutter_recipe/presentation/components/search_filter_sheet.dart';
import 'package:flutter_recipe/presentation/search/screen/search_screen.dart';
import 'package:flutter_recipe/presentation/search/search_view_model.dart';

class SearchRoot extends StatelessWidget {
  const SearchRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<SearchViewModel>();

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return SearchScreen(
          state: viewModel.state,
          onChanged: viewModel.searchRecipes,
          onTapFilter: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SearchFilterSheet(
                  state: viewModel.state.filterState,
                  onChangeFilter: (FilterState state) {
                    viewModel.onChangeFilter(state);
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}