import 'package:cardy/entities/payments_methods/gift_card_type_entity.dart';
import 'package:cardy/entities/user_items/item_entity.dart';
import 'package:cardy/entities/user_items/items_group_enum.dart';

class GiftCardEntity extends ItemEntity {
  GiftCardEntity({
    super.id,
    required super.code,
    super.cvv,
    required super.typeId,
    required GiftCardTypeEntity type,
    required super.initialAmount,
    required super.balance,
    required super.addTime,
    required super.expirationDate,
    super.notes,
  }) : super(type: type);

  @override
  ItemsGroupEnum get itemGroupType => ItemsGroupEnum.giftCard;
}
