import 'package:cardy/entities/categories/category_key.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:flutter/material.dart';

class CategoryEntity {
  final bool _isPrimary;
  final CategoryKey _key;
  final String _name;
  final List<String> _allies;
  final IconData _icon;
  List<CategoryEntity>? subCategories;
  CategoryEntity? parent;

  CategoryEntity({
    required CategoryKey key,
    required String name,
    required List<String> allies,
    required IconData icon,
    bool isPrimaryCategory = false,
  })  : _key = key,
        _name = name,
        _allies = allies,
        _icon = icon,
        _isPrimary = isPrimaryCategory;

  static void setParentToAll(
      List<CategoryEntity> children, CategoryEntity parent) {
    for (CategoryEntity subCategory in children) {
      subCategory.parent = parent;
    }
  }

  CategoryEntity get topParentCategory => _getTopParentCategory(this);

  CategoryEntity _getTopParentCategory(categoryEntity) {
    if (parent == null || isPrimary) {
      return this;
    }
    return parent!._getTopParentCategory(this);
  }

  static List<StoreEntity> filterStoresByKey(
      List<StoreEntity> stores, CategoryKey key, String searchValue) {
    List<StoreEntity> filteredStores = stores;

    if (key != CategoryKey.all) {
      filteredStores = stores
          .where((store) => store.categories
              .map((category) => category.topParentCategory.key)
              .contains(key))
          .toList();
    }

    if (searchValue.isNotEmpty) {
      filteredStores = filteredStores
          .where((store) => store.aliases
              .where((alias) =>
                  alias.toLowerCase().contains(searchValue.toLowerCase()))
              .isNotEmpty)
          .toList();
    }

    return filteredStores;
  }

  CategoryKey get key => _key;
  String get name => _name;
  List<String> get allies => _allies;
  IconData get icon => _icon;
  bool get isPrimary => _isPrimary;
}
