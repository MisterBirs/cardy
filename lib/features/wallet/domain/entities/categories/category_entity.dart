import 'package:cardy/features/wallet/domain/entities/categories/categories.dart';
import 'package:cardy/features/wallet/domain/entities/categories/category_key.dart';
import 'package:cardy/features/brands/domain/entities/store_entity.dart';
import 'package:flutter/material.dart';


class CategoryEntity {
  final bool _isPrimary;
  final CategoryKey _key;
  final String _name;
  final List<String> _allies;
  final IconData _icon;
  final Image? _image;
  Map<CategoryKey, CategoriesRelationship>? subCategories;
  Map<CategoryKey, CategoryEntity>? _parents;

  CategoryEntity({
    required CategoryKey key,
    required String name,
    required List<String> allies,
    required IconData icon,
    Image? image,
    bool isPrimaryCategory = false,
  })  : _key = key,
        _name = name,
        _allies = allies,
        _icon = icon,
        _image = image,
        _isPrimary = isPrimaryCategory;

  static void setParentToAll(
      List<CategoryEntity> children, CategoryEntity parent) {
    for (CategoryEntity child in children) {
      child.addParent(parent);
    }
  }

  List<CategoryEntity> get primaryCategorirs => _getPrimariesParents(this);

  void addSubCategory(
      {required CategoryEntity category, String? name, IconData? icon}) {
    subCategories ??= {};
    subCategories![category.key] = CategoriesRelationship(
        child: category,
        name: name ?? category.name,
        icon: icon ?? category.icon);
  }

  bool childOf(CategoryKey parentKey) {
    if (key == CategoryKey.all) {
      return true;
    }

    if (key == parentKey) {
      return true;
    }

    if (parents == null) {
      return false;
    }

    if (isContainParnet(parentKey)) {
      return true;
    }

    if (parents!.length <= 1 && isContainParnet(CategoryKey.all)) {
      return false;
    }

    return parents!.values
        .where((parents) => parents.key != CategoryKey.all)
        .any((parent) => parent.childOf(parentKey));
  }

  CategoryEntity convertDataByParentRelation(CategoryKey parentKey) {
    if (key == parentKey || parents == null) {
      return this;
    }

    final CategoryEntity? parent = parents![parentKey];
    if (parent == null ||
        parent.subCategories == null ||
        parent.subCategories![key] == null) {
      return this;
    }

    final CategoriesRelationship parentRelation = parent.subCategories![key]!;

    return CategoryEntity(
      key: key,
      name: parentRelation.name,
      allies: allies,
      icon: parentRelation.icon,
      image: image,
      isPrimaryCategory: isPrimary,
    );
  }

  List<CategoryEntity> _getPrimariesParents(categoryEntity) {
    if (parents == null || isPrimary) {
      return [this];
    }
    return parents!.values
        .expand((parent) => parent._getPrimariesParents(this))
        .toSet()
        .toList();
  }

  void addParent(CategoryEntity parent) {
    _parents ??= {};
    _parents![parent.key] = parent;
  }

  static List<CategoryEntity> filterPrimaryCategories(
      List<CategoryEntity> categories) {
    return categories.where((category) => category.isPrimary).toSet().toList();
  }

  static List<String> filterStoresByKey(
      List<String> stores, CategoryKey key, String searchValue) {
    List<String> filteredStores = stores;

    if (key != CategoryKey.all) {
      filteredStores = stores
          .where((store) =>
              store.categories.any((category) => category.childOf(key)))
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

  bool isContainParnet(CategoryKey parentKey) =>
      parents?.containsKey(parentKey) ?? false;

  CategoryKey get key => _key;
  String get name => _name;
  List<String> get allies => _allies;
  IconData get icon => _icon;
  bool get isPrimary => _isPrimary;
  Image? get image => _image;
  Map<CategoryKey, CategoryEntity>? get parents => _parents;
}
