import 'package:cardy/entities/payments_methods/reloadable_card_type_entity.dart';
import 'package:cardy/entities/user_items/item_entity.dart';
import 'package:cardy/entities/user_items/items_group_enum.dart';

class ReloadableCardEntity extends ItemEntity {
  ReloadableCardEntity(
      {super.id,
      required super.code,
      super.cvv,
      required super.typeId,
      required ReloadableCardTypeEntity type,
      required super.initialAmount,
      required super.balance,
      required super.addTime,
      required super.expirationDate,
      super.notes})
      : super(type: type);

  @override
  ItemsGroupEnum get itemGroupType => ItemsGroupEnum.reloadableCard;
}
