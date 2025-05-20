import 'package:cardy/features/categories/domain/entites/category_entity.dart';
import 'package:cardy/features/categories/domain/category_key.dart';

abstract class CategoriesRepository {
  Future<Map<CategoryKey, CategoryEntity>> fetchCategories(); 
}