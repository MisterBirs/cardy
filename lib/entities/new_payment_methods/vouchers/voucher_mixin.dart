import 'package:cardy/entities/new_payment_methods/abstract_classes/payment_method.dart';

mixin VoucherMixin on PaymentMethod {
  @override
  String get displaySingleName => 'שובר';

  @override
  String get displayPluralName => 'שוברים';
}
