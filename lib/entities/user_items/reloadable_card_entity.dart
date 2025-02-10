import 'package:cardy/entities/user_items/item_entity.dart';


class ReloadableCardEntity extends ItemEntity {
  ReloadableCardEntity(
      {super.id,
      required super.code,
      super.cvv,
      required super.typeId,
      required super.type,
      required super.initialAmount,
      required super.balance,
      required super.addTime,
      required super.expirationDate, super.notes});
}
