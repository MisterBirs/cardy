import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/payment_methods/brand_entity.dart';
import 'package:cardy/entities/payment_methods/store_entity.dart';
import 'package:cardy/entities/payment_methods/enums.dart';

class MultiStoresBrandEntity extends BrandEntity {
  //#region Attributes
  final String _id;
  final BrandTypesEnum _brand;
  final String _name;
  final List<String> _aliases;
  final String _imagePath;
  final List<CategoryEntity> _categories;
  final List<StoreEntity> _redeemableStores;
  final bool _hasCvv;
  //#endregion

  //#region Constructor
  MultiStoresBrandEntity({
    required String id,
    required BrandTypesEnum brand,
    required String name,
    required String imagePath,
    List<String>? aliases,
    required List<CategoryEntity> categories,
    required List<StoreEntity> redeemableStores,
    required bool hasBalance,
    required bool hasCvv,
    required bool hasDescription,
  })  : _id = id,
        _name = name,
        _brand = brand,
        _aliases = aliases != null ? [name, ...aliases] : [name],
        _imagePath = imagePath,
        _categories = categories,
        _redeemableStores = redeemableStores,
        _hasCvv = hasCvv;

  //#endregion

  //#region Getters
  @override
  String get id => _id;

  @override
  BrandTypesEnum get type => _brand;

  @override
  String get name => _name;

  @override
  List<String> get aliases => _aliases;

  @override
  String get imagePath => _imagePath;

  @override
  List<CategoryEntity> get categories => _categories;

  @override
  bool get hasMultiStores => true;

  List<StoreEntity> get redeemableStores => _redeemableStores;

  @override
  bool get hasCvv => _hasCvv;

  //#endregion
}
