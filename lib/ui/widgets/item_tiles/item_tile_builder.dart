import 'dart:core';

import 'package:cardy/entities/categories/category_entity.dart';
import 'package:flutter/material.dart';

class ItemTileBuilder extends StatelessWidget {
  final List<String> _alias;
  final double? _amount;
  final List<CategoryEntity> _categories;
  final Widget _tile;

  const ItemTileBuilder({
    super.key,
    required List<String> alias,
    double? amount,
    required List<CategoryEntity> categories,
    required Widget tile,
  })  : _alias = alias,
        _amount = amount,
        _categories = categories,
        _tile = tile;

  @override
  Widget build(BuildContext context) {
    return _tile;
  }

  List<String> get alias => _alias;
  double? get amount => _amount;
  List<CategoryEntity> get categories => [..._categories];
  Widget get tile => _tile;
}
