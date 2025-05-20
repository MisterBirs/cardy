import 'package:cardy/features/categories/data/models/categories_relationship_model.dart';
import 'package:cardy/features/categories/domain/category_key.dart';
import 'package:cardy/features/categories/domain/entites/category_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required CategoryKey key,
    required String name,
    required bool isPrimary,
    List<String>? allies,
    List<CategoriesRelationshipModel>? subCategories,
    List<CategoryKey>? parents,
    String? imagePath,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);  
}

extension CategoryModelExtension on CategoryModel {
  CategoryEntity toEntityWithoutRelationships() {
    return CategoryEntity(
      key: key,
      name: name,
      allies: allies ?? [],
      isPrimaryCategory: isPrimary,
      imagePath: imagePath,
    );
  }
}
