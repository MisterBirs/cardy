import 'package:cardy/features/categories/domain/entites/category_entity.dart';
import 'package:cardy/features/categories/presentation/view_models/category_to_icon_mapper.dart';
import 'package:flutter/material.dart';

class CategoryViewModel {
  final CategoryEntity entity;
  final IconData icon;
  final Image? image;

  CategoryViewModel._internal({
    required this.entity,
    required this.icon,
    required this.image,
  });

  factory CategoryViewModel.fromEntity(CategoryEntity entity) {
    final icon = CategoryToIconMapper().getIcon(categoryKey: entity.key);
    return CategoryViewModel._internal(
      entity: entity,
      icon: icon,
      image: null,
    );
  }
}