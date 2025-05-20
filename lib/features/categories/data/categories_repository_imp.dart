import 'package:cardy/features/categories/data/data_sources/categories_data_source.dart';
import 'package:cardy/features/categories/data/models/category_model.dart';
import 'package:cardy/features/categories/domain/categories_repository.dart';
import 'package:cardy/features/categories/domain/entites/categories_relationship_entity.dart';
import 'package:cardy/features/categories/domain/entites/category_entity.dart';
import 'package:cardy/features/categories/domain/category_key.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesRepositoryImp implements CategoriesRepository {
  CategoriesDataSource _ds;

  CategoriesRepositoryImp(this._ds);

  @override
  Future<Map<CategoryKey, CategoryEntity>> fetchCategories() async {
    final categoriesModelsMap = await _ds.fetchCategories();
    final categoriesModelList = categoriesModelsMap.values.toList();

    Map<CategoryKey, CategoryEntity> entitiesWithoutRelationships =
        _createEntites(categoriesModelList);

    _initializeRelationships(
        entitiesWithoutRelationships, categoriesModelsMap.values.toList());

    return entitiesWithoutRelationships;
  }  

  Map<CategoryKey, CategoryEntity> _createEntites(List<CategoryModel> models) {
    final Map<CategoryKey, CategoryEntity> entities = {};
    for (var model in models) {
      entities[model.key] = model.toEntityWithoutRelationships();
    }
    return entities;
    }

  void _initParentsFromModelToEntity(
      CategoryModel model, Map<CategoryKey, CategoryEntity> entities) {
    if (model.parents == null || model.parents!.isEmpty) {
      return;
    }

    final entity = entities[model.key];

    List<CategoryEntity> parentsEntites = model.parents!.map((parentKey) {
      final parentEntity = entities[parentKey];
      if (parentEntity == null) {
        throw Exception('Parent entity not found for key: $parentKey');
      }
      return parentEntity;
    }).toList();

    entity!.addAllParents(parentsEntites);
  }

  void _initSubCategoriesFromModelToEntity(
      CategoryModel model, Map<CategoryKey, CategoryEntity> entities) {
    if (model.subCategories == null || model.subCategories!.isEmpty) {
      return;
    }

    final entity = entities[model.key];

    List<CategoriesRelationshipEntity> subCategoryEntites =
        model.subCategories!.map((subCategoryModel) {
      final subCategoryEntity = entities[subCategoryModel.childKey];
      if (subCategoryEntity == null) {
        throw Exception(
            'Subcategory entity not found for key: ${subCategoryModel.childKey}');
      }
      return CategoriesRelationshipEntity(
        child: subCategoryEntity,
        shlowName: subCategoryModel.showName,
      );
    }).toList();

    entity!.addAllSubCategories(subCategoryEntites);
  }

  Future<void> _initializeRelationships(
    Map<CategoryKey, CategoryEntity> entities,
    List<CategoryModel> models,
  ) async {
    for (var model in models) {
      _initParentsFromModelToEntity(model, entities);
      _initSubCategoriesFromModelToEntity(model, entities);
    }
  }
}
