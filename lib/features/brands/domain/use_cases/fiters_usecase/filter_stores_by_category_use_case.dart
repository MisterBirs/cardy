import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/categories/domain/categories_repository.dart';
import 'package:cardy/features/categories/domain/category_key.dart';
import 'package:injectable/injectable.dart';

@injectable
class FilterBrandsByCategoryUseCase {
  final CategoriesRepository _repo;

  FilterBrandsByCategoryUseCase(this._repo);

  Future<List<BrandEntity>> call(List<BrandEntity> brands, CategoryKey categoryKeyFilter) async {
    final categoires = await _repo.fetchCategories();
    
    return brands.where((store) {
      final storeCategories = store.categoriesKeys;

      // Check if any of the store's categories is descendant of the given categoryKey
      return storeCategories.any((storeCategoryKey) {
        final storeCategory = categoires[storeCategoryKey];
        return storeCategory!.isDescendantOf(categoryKeyFilter);
      });
    }).toList();
  }
  
}