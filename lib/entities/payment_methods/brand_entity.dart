import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/payment_methods/payment_methods.dart';

abstract class BrandEntity {

  const BrandEntity();

  //#region Getters
  String get id;

  String get name;

  List<String> get aliases;

  String get imagePath;

  bool get isCard => type.isCard;

  List<CategoryEntity> get categories;

  bool get hasMultiStores;

  bool get hasBalance;

  bool get hasCvv;

  bool get hasDescription;

  PaymentMethod get type;
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
