import 'package:cardy/entities/new_payment_methods/gift_cards/gift_card_mixin.dart';
import 'package:cardy/entities/new_payment_methods/abstract_classes/single_store_payment_method.dart';

class SingleStoreGiftCard extends SingleStorePaymentMethod with GiftCardMixin {
  SingleStoreGiftCard({required super.id, required super.store});

  @override
  bool get hasBalance => true;

  @override
  bool get hasCvv => false;

  @override
  bool get hasDescription => false;

  @override
  bool get isCard => true;
}
