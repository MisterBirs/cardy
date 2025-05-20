import 'package:cardy/features/brands/domain/entities/brand_types_enum.dart';
import 'package:cardy/features/categories/domain/category_key.dart';

abstract class BrandEntity {
  const BrandEntity();

  //#region Getters
  String get id;

  String get name;

  List<String> get aliases;

  String get imagePath;

  List<CategoryKey> get categoriesKeys;

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
