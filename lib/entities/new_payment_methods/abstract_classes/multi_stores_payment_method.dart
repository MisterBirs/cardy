import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/new_payment_methods/abstract_classes/payment_method.dart';
import 'package:cardy/entities/new_payment_methods/store.dart';

abstract class MultiStoresPaymentMethod extends PaymentMethod {
  final String _id;
  final String _name;
  final List<String> _aliases;
  final String _imagePath;
  final List<CategoryEntity> _categories;
  final List<Store> _stores;

  MultiStoresPaymentMethod({
    required String id,
    required String name,
    required String imagePath,
    List<String> aliases = const [],
    required List<CategoryEntity> categories,
    required List<Store> stores,
  })  : _id = id,
        _name = name,
        _aliases = [name, ...aliases],
        _imagePath = imagePath,
        _categories = categories,
        _stores = stores;

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
  bool get hasMultiStores => true;

  List<Store> get stores => _stores;
}
