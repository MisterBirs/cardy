import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/payment_methods/brand_entity.dart';
import 'package:cardy/entities/payment_methods/store_entity.dart';
import 'package:cardy/entities/payment_methods/payment_methods.dart';

class MultiStoresBrandEntity extends BrandEntity {
  //#region Attributes
  final String _id;
  final PaymentMethod _type;
  final String _name;
  final List<String> _aliases;
  final String _imagePath;
  final List<CategoryEntity> _categories;
  final List<StoreEntity> _redeemableStores;
  final bool _hasBalance;
  final bool _hasCvv;
  final bool _hasDescription;
  //#endregion

  //#region Constructor
  MultiStoresBrandEntity({
    required String id,
    required PaymentMethod type,
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
        _type = type,
        _aliases = aliases != null ? [name, ...aliases] : [name],
        _imagePath = imagePath,
        _categories = categories,
        _redeemableStores = redeemableStores,
        _hasBalance = hasBalance,
        _hasCvv = hasCvv,
        _hasDescription = hasDescription;

  //#endregion

  //#region Getters
  @override
  String get id => _id;

  @override
  PaymentMethod get type => _type;

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
  bool get hasBalance => _hasBalance;

  @override
  bool get hasCvv => _hasCvv;

  @override
  bool get hasDescription => _hasDescription;
  //#endregion
}
