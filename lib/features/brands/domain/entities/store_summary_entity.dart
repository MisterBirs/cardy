

import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:cardy/features/brands/domain/entities/store_entity.dart';
import 'package:cardy/features/user_items/domain/entites/payment_methods_enum.dart';

class StoreSummaryEntity {

  final String _store;
  final Map<PaymentMethodsEnum, List<UserItemEntity>> _itemsGroupsMap;
  double _totalBalance = 0;

  StoreSummaryEntity({
    required String store,
    required Map<PaymentMethodsEnum, List<UserItemEntity>> itemsGroupsMap,
  })  : _store = store,
        _itemsGroupsMap = itemsGroupsMap {
    _initTotalBalance(itemsGroupsMap);
  }

  void _initTotalBalance(
      Map<PaymentMethodsEnum, List<UserItemEntity>> itemsGroupsMap) {
    final allItems =
        itemsGroupsMap.values.expand((groupItems) => groupItems).toList();
    _totalBalance = allItems.fold(
        0.0, (sumOfBalances, item) => sumOfBalances + (item.balance ?? 0.0));
  }

  void addItem(UserItemEntity item) {
    final itemGroupType = item.paymentMethod;
    final itemsGroup = _itemsGroupsMap[itemGroupType];
    if (itemsGroup != null) {
      itemsGroup.add(item);
    } else {
      _itemsGroupsMap[itemGroupType] = [item];
    }
    if (item.balance != null) {
      _totalBalance += item.balance!;
    }
  }

  String get store => _store;

  Map<PaymentMethodsEnum, List<UserItemEntity>> get itemsGroupsMap =>
      _itemsGroupsMap;

  double get totalBalance => _totalBalance;
}
