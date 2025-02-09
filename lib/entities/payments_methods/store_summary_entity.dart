import 'dart:collection';

import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/entities/user_items/payment_method_entity.dart';

class StoreSummaryEntity {
  final StoreEntity _store;
  final List<PaymentMethodEntity> _paymentMethods;
  double _totalBalance;

  StoreSummaryEntity({
    required StoreEntity store,
    required List<PaymentMethodEntity> paymentMethods,
    required double totalBalance,
  })  : _store = store,
        _paymentMethods = paymentMethods,
        _totalBalance = totalBalance;

  void addPaymentMethod(PaymentMethodEntity paymentMethod) {
    _paymentMethods.add(paymentMethod);
    _totalBalance += paymentMethod.balance;
  }

  StoreEntity get store => _store;
  
  UnmodifiableListView<PaymentMethodEntity> get paymentMethods =>
      UnmodifiableListView(_paymentMethods);

  double get totalBalance => _totalBalance;
}
