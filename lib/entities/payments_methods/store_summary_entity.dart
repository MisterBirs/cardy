import 'dart:collection';

import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/entities/user_items/item_entity.dart';

class StoreSummaryEntity {
  final StoreEntity _store;
  final List<ItemEntity> _paymentMethods;
  double _totalBalance;

  StoreSummaryEntity({
    required StoreEntity store,
    required List<ItemEntity> paymentMethods,
    required double totalBalance,
  })  : _store = store,
        _paymentMethods = paymentMethods,
        _totalBalance = totalBalance;

  void addPaymentMethod(ItemEntity paymentMethod) {
    _paymentMethods.add(paymentMethod);
    _totalBalance += paymentMethod.balance;
  }

  StoreEntity get store => _store;
  
  UnmodifiableListView<ItemEntity> get paymentMethods =>
      UnmodifiableListView(_paymentMethods);

  double get totalBalance => _totalBalance;
}
