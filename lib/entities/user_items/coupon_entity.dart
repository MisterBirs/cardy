import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/entities/user_items/item_entity.dart';
import 'package:cardy/entities/user_items/items_group_enum.dart';

class CouponEntity extends ItemEntity {
  CouponEntity({
    required super.id,
    required super.code,
    super.cvv,
    required super.typeId,
    required StoreEntity type,
    required super.initialAmount,
    required super.balance,
    required super.addTime,
    required super.expirationDate,
    super.notes,
  }):super(type: type);

  @override
  ItemsGroupEnum get itemGroupType => ItemsGroupEnum.coupon;
}
