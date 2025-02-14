import 'package:cardy/entities/payments_methods/item_group.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/entities/user_items/item_entity.dart';
import 'package:cardy/entities/user_items/items_enum.dart';

class StoreSummaryEntity {
  final StoreEntity _store;
  final Map<ItemsEnum, ItemGroup> _itemsMap;
  double _totalBalance;

  StoreSummaryEntity({
    required StoreEntity store,
    required Map<ItemsEnum, ItemGroup> itemsMap,
    required double totalBalance,
  })  : _store = store,
        _itemsMap = itemsMap,
        _totalBalance = totalBalance;

  void addPaymentMethod(ItemEntity paymentMethod) {
    final itemGroupType = paymentMethod.itemGroupType;
    final itemGroup = _itemsMap[itemGroupType];
    if (itemGroup != null) {
      itemGroup.items.add(paymentMethod);
    } else {
      _itemsMap[itemGroupType] = ItemGroup(
        name: itemGroupType.name,
        groupType: itemGroupType,
        items: [paymentMethod],
      );
    }
    _totalBalance += paymentMethod.balance;
  }

  StoreEntity get store => _store;

  Map<ItemsEnum, ItemGroup> get paymentMethods => _itemsMap;

  double get totalBalance => _totalBalance;
}
