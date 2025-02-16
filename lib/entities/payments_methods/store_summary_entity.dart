import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/entities/user_items/item_entity.dart';
import 'package:cardy/entities/user_items/items_group_enum.dart';

class StoreSummaryEntity {
  final StoreEntity _store;
  final Map<ItemsGroupEnum, List<ItemEntity>> _itemsGroupsMap;
  double _totalBalance;

  StoreSummaryEntity({
    required StoreEntity store,
    required Map<ItemsGroupEnum, List<ItemEntity>> itemsGroupsMap,
    required double totalBalance,
  })  : _store = store,
        _itemsGroupsMap = itemsGroupsMap,
        _totalBalance = totalBalance;

  void addItem(ItemEntity item) {
    final itemGroupType = item.itemGroupType;
    final itemsGroup = _itemsGroupsMap[itemGroupType];
    if (itemsGroup != null) {
      itemsGroup.add(item);
    } else {
      _itemsGroupsMap[itemGroupType] = [item];
    }
    _totalBalance += item.balance;
  }

  StoreEntity get store => _store;

  Map<ItemsGroupEnum, List<ItemEntity>> get itemsGroupsMap => _itemsGroupsMap;

  double get totalBalance => _totalBalance;
}
