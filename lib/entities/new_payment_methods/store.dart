import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/new_payment_methods/abstract_classes/payment_method.dart';

class Store extends PaymentMethod {
  final String _id;
  final String _name;
  final List<String> _aliases;
  final String _imagePath;
  final List<CategoryEntity> _categories;

  Store({
    required String id,
    required String name,
    required List<String> aliases,
    required String imagePath,
    required List<CategoryEntity> categories,
  })  : _id = id,
        _name = name,
        _aliases = aliases,
        _imagePath = imagePath,
        _categories = categories;

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
  String get displaySingleName => 'חנות';

  @override
  String get displayPluralName => 'חנויות';
}
