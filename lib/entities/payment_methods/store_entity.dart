import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/payment_methods/payment_method_entity.dart';
import 'package:cardy/entities/payment_methods/payment_method_type.dart';

class StoreEntity extends PaymentMethodEntity {

  //#region Attributes
  final String _id;
  final String _name;
  final List<String> _aliases;
  final String _imagePath;
  final List<CategoryEntity> _categories;
  //#endregion

  //#region Constructor
  StoreEntity({
    required String id,
    required String name,
    List<String>? aliases,
    required String imagePath,
    required List<CategoryEntity> categories,
  })  : _id = id,
        _name = name,
        _aliases = aliases != null ? [name, ...aliases] : [name],
        _imagePath = imagePath,
        _categories = categories;
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
  List<CategoryEntity> get categories => _categories;

  @override
  bool get hasBalance => false;

  @override
  bool get hasCvv => false;

  @override
  bool get hasDescription => false;

  @override
  bool get hasMultiStores => false;

  @override
  bool get isCard => false;

  @override
  PaymentMethodType get type => PaymentMethodType.store;
  //#endregion
}
