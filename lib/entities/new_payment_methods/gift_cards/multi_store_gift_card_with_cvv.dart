import 'package:cardy/entities/new_payment_methods/abstract_classes/multi_stores_payment_method.dart';

class MultiStoreGiftCardWithCvv extends MultiStoresPaymentMethod {
  MultiStoreGiftCardWithCvv(
      {required super.id,
      required super.name,
      required super.imagePath,
      required super.categories,
      required super.stores});

  @override
  bool get hasBalance => true;

  @override
  bool get hasCvv => true;

  @override
  bool get hasDescription => false;

  @override
  bool get isCard => true;

  @override
  String get displayPluralName => 'גיפטקארד';

  @override
  String get displaySingleName => 'גיפטקארדים';
  
}