import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/brands/domain/entities/brand_types_enum.dart';
import 'package:cardy/features/categories/domain/category_key.dart';

class StoreEntity extends BrandEntity {

  //#region Attributes
  final String _id;
  final String _name;
  final List<String> _aliases;
  final String _imagePath;
  final List<CategoryKey> _categoriesKeys;
  //#endregion

  //#region Constructor
  StoreEntity({
    required String id,
    required String name,
    List<String>? aliases,
    required String imagePath,
    required List<CategoryKey> categoriesKeys,
  })  : _id = id,
        _name = name,
        _aliases = aliases != null ? [name, ...aliases] : [name],
        _imagePath = imagePath,
        _categoriesKeys = categoriesKeys;
  //#endregion

  //#region Getters
  @override
  String get id => _id;

  @override
  String get name => _name;

  @override
  List<String> get aliases => _aliases;

  @override
  String get imagePath => _imagePath;

  @override
  List<CategoryKey> get categoriesKeys => _categoriesKeys;

  @override
  bool get hasCvv => false;

  @override
  bool get hasMultiStores => false;

  @override
  BrandTypesEnum get type => BrandTypesEnum.store;
  //#endregion
}
