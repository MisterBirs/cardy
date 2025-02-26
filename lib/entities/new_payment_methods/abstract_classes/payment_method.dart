import 'package:cardy/entities/categories/category_entity.dart';
import 'package:flutter/material.dart';

abstract class PaymentMethod {
  @protected
  String get id;

  @protected
  String get name;

  @protected
  List<String> get aliases;

  @protected
  String get imagePath;

  @protected
  bool get isCard;

  @protected
  List<CategoryEntity> get categories;

  @protected
  bool get hasMultiStores;

  @protected
  bool get hasBalance;

  @protected
  bool get hasCvv;

  @protected
  bool get hasDescription;

  @protected
  String get displaySingleName;

  @protected
  String get displayPluralName;

  bool isAliasContains(String query) {
    final lowerCaseQuery = query.toLowerCase();
    return aliases.any((alias) => alias.toLowerCase().contains(lowerCaseQuery));
  }

  bool isMatchToAlias(String query) {
    final lowerCaseQuery = query.toLowerCase();
    return aliases.any((alias) => alias.toLowerCase() == lowerCaseQuery);
  }
}

