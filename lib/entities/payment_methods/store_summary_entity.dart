import 'package:cardy/entities/payment_methods/payment_item_entity.dart';
import 'package:cardy/entities/payment_methods/store_entity.dart';
import 'package:cardy/entities/payment_methods/payment_method_type.dart';

class StoreSummaryEntity {
  
  final StoreEntity _store;
  final Map<PaymentMethodType, List<PaymentItemEntity>> _itemsGroupsMap;
  double _totalBalance = 0;

  StoreSummaryEntity({
    required StoreEntity store,
    required Map<PaymentMethodType, List<PaymentItemEntity>> itemsGroupsMap,
  })  : _store = store,
        _itemsGroupsMap = itemsGroupsMap {
    _initTotalBalance(itemsGroupsMap);
  }

  void _initTotalBalance(
      Map<PaymentMethodType, List<PaymentItemEntity>> itemsGroupsMap) {
    final allItems =
        itemsGroupsMap.values.expand((groupItems) => groupItems).toList();
    _totalBalance = allItems.fold(
        0.0, (sumOfBalances, item) => sumOfBalances + (item.balance ?? 0.0));
  }

  void addItem(PaymentItemEntity item) {
    final itemGroupType = item.paymentMethod.type;
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

  Map<PaymentMethodType, List<PaymentItemEntity>> get itemsGroupsMap =>
      _itemsGroupsMap;

  double get totalBalance => _totalBalance;
}
