

import 'package:cardy/features/brands/domain/entities/enums.dart';
import 'package:cardy/features/brands/domain/entities/payment_item_entity.dart';
import 'package:cardy/features/brands/domain/entities/store_entity.dart';

class StoreSummaryEntity {

  final StoreEntity _store;
  final Map<PaymentMethodsEnum, List<PaymentItemEntity>> _itemsGroupsMap;
  double _totalBalance = 0;

  StoreSummaryEntity({
    required StoreEntity store,
    required Map<PaymentMethodsEnum, List<PaymentItemEntity>> itemsGroupsMap,
  })  : _store = store,
        _itemsGroupsMap = itemsGroupsMap {
    _initTotalBalance(itemsGroupsMap);
  }

  void _initTotalBalance(
      Map<PaymentMethodsEnum, List<PaymentItemEntity>> itemsGroupsMap) {
    final allItems =
        itemsGroupsMap.values.expand((groupItems) => groupItems).toList();
    _totalBalance = allItems.fold(
        0.0, (sumOfBalances, item) => sumOfBalances + (item.balance ?? 0.0));
  }

  void addItem(PaymentItemEntity item) {
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

  StoreEntity get store => _store;

  Map<PaymentMethodsEnum, List<PaymentItemEntity>> get itemsGroupsMap =>
      _itemsGroupsMap;

  double get totalBalance => _totalBalance;
}
