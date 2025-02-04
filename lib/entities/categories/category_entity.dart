import 'package:cardy/entities/categories/category_key.dart';
import 'package:flutter/material.dart';

class CategoryEntity {
  final bool _isPrimaryCategory;
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
        _isPrimaryCategory = isPrimaryCategory;

  static void setParentToAll(List<CategoryEntity> children, CategoryEntity parent){
    for(CategoryEntity subCategory in children){
      subCategory.parent = parent;
    }
  }

  CategoryKey get key => _key;
  String get name => _name;
  List<String> get allies => _allies;
  IconData get icon => _icon;
  bool get isPrimaryCategory => _isPrimaryCategory;
}
