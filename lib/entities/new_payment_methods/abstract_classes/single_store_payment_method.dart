import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/new_payment_methods/abstract_classes/payment_method.dart';
import 'package:cardy/entities/new_payment_methods/store.dart';

abstract class SingleStorePaymentMethod extends PaymentMethod {
  final String _id;
  final Store _store;

  SingleStorePaymentMethod({
    required String id,
    required Store store,
  })  : _id = id,
        _store = store;

  @override
  String get id => _id;

  @override
  String get name => _store.name;

  @override
  String get imagePath => _store.imagePath;

  @override
  List<String> get aliases => _store.aliases;

  @override
  List<CategoryEntity> get categories => _store.categories;

  @override
  bool get hasMultiStores => false;
}
