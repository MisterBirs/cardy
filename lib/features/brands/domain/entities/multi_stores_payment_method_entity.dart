import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/brands/domain/entities/enums.dart';
import 'package:cardy/features/wallet/domain/entities/categories/category_key.dart';

class MultiStoresBrandEntity extends BrandEntity {
  //#region Attributes
  final String _id;
  final BrandTypesEnum _type;
  final String _name;
  final List<String> _aliases;
  final String _imagePath;
  final List<CategoryKey> _categoriesKeys;
  final List<String> _redeemableStoresIds;
  final bool _hasCvv;
  //#endregion

  //#region Constructor
  MultiStoresBrandEntity({
    required String id,
    required BrandTypesEnum type,
    required String name,
    required String imagePath,
    List<String>? aliases,
    required List<CategoryKey> categoriesKeys,
    required List<String> redeemableStoresIds,
    required bool hasCvv,
  })  : _id = id,
        _name = name,
        _type = type,
        _aliases = aliases != null ? [name, ...aliases] : [name],
        _imagePath = imagePath,
        _categoriesKeys = categoriesKeys,
        _redeemableStoresIds = redeemableStoresIds,
        _hasCvv = hasCvv;

  //#endregion

  //#region Getters
  @override
  String get id => _id;

  @override
  BrandTypesEnum get type => _type;

  @override
  String get name => _name;

  @override
  List<String> get aliases => _aliases;

  @override
  String get imagePath => _imagePath;

  @override
  List<CategoryKey> get categoriesKeys => _categoriesKeys;

  @override
  bool get hasMultiStores => true;

  List<String> get redeemableStoresIds => _redeemableStoresIds;

  @override
  bool get hasCvv => _hasCvv;

  //#endregion
}
