

import 'package:cardy/features/wallet/domain/entities/categories/category_entity.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/enums.dart';

abstract class BrandEntity {

  const BrandEntity();

  //#region Getters
  String get id;

  String get name;

  List<String> get aliases;

  String get imagePath;

  List<CategoryEntity> get categories;

  bool get hasMultiStores;

  bool get hasCvv;

  BrandTypesEnum get type;
  //#endregion

  //#region Public methods
  bool hasAliasThatContains(String query) {
    final lowerCaseQuery = query.toLowerCase();
    return aliases.any((alias) => alias.toLowerCase().contains(lowerCaseQuery));
  }

  bool hasMatchingAlias(String query) {
    return aliases.any((alias) => alias.toLowerCase() == query.toLowerCase());
  }
  //#endregion
}
