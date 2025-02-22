import 'package:flutter_recipe/presentation/search/filter_state.dart';
import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
    @Default('Recent Search') String searchTitle,
    @Default('') String resultsCount,
    @Default(FilterState(time: 'All', rate: 1, category: 'All'))
    FilterState filterState,
    @Default('') String query,
  }) = _SearchState;
}