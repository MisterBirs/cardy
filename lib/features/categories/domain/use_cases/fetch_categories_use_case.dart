import 'package:cardy/features/categories/domain/categories_repository.dart';
import 'package:cardy/features/categories/domain/category_key.dart';
import 'package:cardy/features/categories/domain/entites/category_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchCategoriesUseCase {
  final CategoriesRepository _repo;

  FetchCategoriesUseCase(this._repo);

  Future<Map<CategoryKey,CategoryEntity>> call() async {
    return _repo.fetchCategories();
  }
}

