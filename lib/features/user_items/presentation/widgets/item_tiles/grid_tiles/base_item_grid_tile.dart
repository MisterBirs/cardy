import 'dart:core';

import 'package:cardy/features/wallet/domain/entities/categories/category_entity.dart';
import 'package:flutter/material.dart';

abstract class BaseItemGridTile extends StatelessWidget {
  final List<String> _alias;
  final double? _balance;
  final List<CategoryEntity> _categories;

  const BaseItemGridTile({
    super.key,
    required List<String> alias,
    double? balance,
    required List<CategoryEntity> categories,
  })  : _alias = alias,
        _balance = balance,
        _categories = categories;

  List<String> get alias => _alias;
  double? get balance => _balance;
  List<CategoryEntity> get categories => [..._categories];
}
