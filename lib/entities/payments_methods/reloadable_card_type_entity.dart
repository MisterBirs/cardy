import 'package:cardy/entities/payments_methods/gift_card_type_entity.dart';

class ReloadableCardTypeEntity extends GiftCardTypeEntity {
  ReloadableCardTypeEntity(
      {required super.id,
      required super.name,
      required super.imagePath,
      super.isCard = true,
      required super.storesToRedeem,
      required super.categories});

}
