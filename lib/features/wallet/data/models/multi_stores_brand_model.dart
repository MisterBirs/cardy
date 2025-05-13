import 'package:cardy/features/wallet/data/models/brand_model.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/enums.dart';

class MultiStoresBrandModel implements BrandModel{
  //#region Attributes
  final String _id;
  final String _name;
  final BrandTypesEnum  _type;
  final List<String> _aliases;
  final String _imagePath;
  final List<String> _categoriesIds;
  final List<String> _redeemableStoresIds;
  final bool _hasCvv;
  //#endregion

  //#region Constructor
  MultiStoresBrandModel({
    required String id,
    required String name,
    required BrandTypesEnum type,
    List<String>? aliases,
    required String imagePath,
    required List<String> categoriesIds,
    required List<String> redeemableStoresIds,
    required bool hasCvv,
  })  : _id = id,
        _name = name,
        _type = type,
        _aliases = aliases != null ? [name, ...aliases] : [name],
        _imagePath = imagePath,
        _categoriesIds = categoriesIds,
        _redeemableStoresIds = redeemableStoresIds,
        _hasCvv = hasCvv;
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
  List<String> get categoriesIds => _categoriesIds;

  @override
  bool get hasCvv => false;

  @override
  bool get hasMultiStores => true;

  @override
  BrandTypesEnum get type => type;
}