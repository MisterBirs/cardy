import 'package:cardy/features/wallet/data/models/brand_model.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/enums.dart';

class StoreModel implements BrandModel {
  //#region Attributes
  final String _id;
  final String _name;
  final List<String> _aliases;
  final String _imagePath;
  final List<String> _categoriesIds;
  //#endregion

  //#region Constructor
  StoreModel({
    required String id,
    required String name,
    List<String>? aliases,
    required String imagePath,
    required List<String> categoriesIds,
  })  : _id = id,
        _name = name,
        _aliases = aliases != null ? [name, ...aliases] : [name],
        _imagePath = imagePath,
        _categoriesIds = categoriesIds;
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
  bool get hasMultiStores => false;

  @override
  BrandTypesEnum get type => BrandTypesEnum.store;
}
