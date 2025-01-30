import 'package:cardy/entities/categories/category_entity.dart';
import 'package:flutter/material.dart';

abstract class BasePaymentMethodTypeEntity {
  final String _id;
  final String _name;
  final String _imagePath;
  final List<CategoryEntity> _categories;
  //TODO: Add aliases property whose function is to conatin all nameing options.

  BasePaymentMethodTypeEntity(
      {required String id,
      required String name,
      required String imagePath,
      required List<CategoryEntity> categories})
      : _id = id,
        _name = name,
        _imagePath = imagePath,
        _categories = categories;

  String get id => _id;
  String get name => _name;
  String get imagePath => _imagePath;
  List<CategoryEntity> get categories => [..._categories];
}
