import 'package:cardy/features/categories/domain/categories_repository.dart';
import 'package:cardy/features/categories/domain/entites/category_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPrimaryCategoriesUsecase {
  final CategoriesRepository _repo;

  GetPrimaryCategoriesUsecase(this._repo);

  Future<List<CategoryEntity>> call() async {
    final categories = await _repo.fetchCategories();
    return categories.values.where((category) {
      return category.isPrimary;
    }).toList();
  }
}
