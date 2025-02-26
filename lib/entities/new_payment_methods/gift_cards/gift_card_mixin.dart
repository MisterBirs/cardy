import 'package:cardy/entities/new_payment_methods/abstract_classes/payment_method.dart';

mixin GiftCardMixin on PaymentMethod {
  @override
  String get displaySingleName => 'גיפטקארד';

  @override
  String get displayPluralName => 'גיפטקארדים';
}
