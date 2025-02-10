import 'dart:core';

import 'package:cardy/entities/categories/category_entity.dart';
import 'package:flutter/material.dart';

abstract class ItemGridTile extends StatelessWidget {
  final List<String> _alias;
  final double? _balance;
  final List<CategoryEntity> _categories;

  const ItemGridTile({
    super.key,
    required List<String> alias,
    double? amount,
    required List<CategoryEntity> categories,
  })  : _alias = alias,
        _balance = amount,
        _categories = categories;

  List<String> get alias => _alias;
  double? get balance => _balance;
  List<CategoryEntity> get categories => [..._categories];
}
