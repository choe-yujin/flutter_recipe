import 'package:flutter_recipe/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
  }) = _HomeState;
}