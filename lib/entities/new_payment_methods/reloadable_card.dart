import 'package:cardy/entities/new_payment_methods/abstract_classes/multi_stores_payment_method.dart';

class ReloadableCard extends MultiStoresPaymentMethod {
  ReloadableCard(
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
  String get displayPluralName => 'כרטיס נטען';

  @override
  String get displaySingleName => 'כרטיסים נטענים';
}
