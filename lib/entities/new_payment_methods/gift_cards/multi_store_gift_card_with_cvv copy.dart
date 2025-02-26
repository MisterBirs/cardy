import 'package:cardy/entities/new_payment_methods/gift_cards/gift_card_mixin.dart';
import 'package:cardy/entities/new_payment_methods/abstract_classes/multi_stores_payment_method.dart';

class MultiStoreGiftCardWithCvv extends MultiStoresPaymentMethod with GiftCardMixin{
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
}