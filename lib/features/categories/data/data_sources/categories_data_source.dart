import 'package:cardy/features/categories/data/models/category_model.dart';
import 'package:cardy/features/categories/domain/category_key.dart';

abstract class CategoriesDataSource {
    Future<Map<CategoryKey, CategoryModel>> fetchCategories(); 
}