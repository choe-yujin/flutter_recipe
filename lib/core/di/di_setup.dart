import 'package:flutter_recipe/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe/data/data_source/recipe_data_source_impl.dart';
import 'package:flutter_recipe/data/repository/mock_bookmark_repository_impl.dart';
import 'package:flutter_recipe/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_recipe/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  // data source, repository 인터페이스 구현체. 타입 명시해주기
  getIt.registerSingleton<RecipeDataSource>(
    RecipeDataSourceImpl(),
  );
  getIt.registerSingleton<RecipeRepository>(
    MockRecipeRepositoryImpl(
      recipeDataSource: getIt(),
    ),
  );
  getIt.registerSingleton<BookmarkRepository>(
    MockBookmarkRepositoryImpl(),
  );

  // usecase. 인터페이스 구현체 아니고 일반 클래스라서 타입 명시 필요 없음
  getIt.registerSingleton(
    GetSavedRecipesUseCase(
      recipeRepository: getIt(),
      bookmarkRepository: getIt(),
    ),
  );

  // ViewModel은 상태를 유지하거나 변경하는 객체이기 때문에 각 화면마다 별개의 인스턴스를 생성해야 하기에 Factory로
  // ViewModel을 요청할 때마다 새로운 인스턴스를 생성하고, ViewModel이 필요로 하는 의존성(UseCase)을 GetIt에서 가져와서 주입
  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(
      getSavedRecipesUseCase: getIt(),
    ),
  );
}
