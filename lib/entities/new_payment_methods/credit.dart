import 'package:cardy/entities/new_payment_methods/gift_cards/single_store_gift_card.dart';

class Credit extends SingleStoreGiftCard {
  Credit({required super.id, required super.store});

  @override
  String get displaySingleName => 'זיכוי';

  @override
  String get displayPluralName => 'זיכויים';
}
