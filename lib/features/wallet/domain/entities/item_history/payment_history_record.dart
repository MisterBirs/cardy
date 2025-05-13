import 'package:cardy/features/wallet/domain/entities/item_history/history_record_entity.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/store_entity.dart';
import 'package:flutter/material.dart';

class PaymentHistoryRecord extends HistoryRecordEntity {
  final double _paymentAmount;
  final StoreEntity _redeemedAt;

  PaymentHistoryRecord(
      {required super.item,
      required double paymentAmount,
      required StoreEntity redeemedAt})
      : _paymentAmount = paymentAmount,
        _redeemedAt = redeemedAt,
        super(
          type: HistoryRecordType.updateBalance,
          icon: Icons.remove,
          iconColor: Colors.red,
          dispalyLabel: 'תשלום',
        );

  double get newBalance => _paymentAmount;

  StoreEntity get redeemedAt => _redeemedAt;

  @override
  String get message {
    return 'שלומו ₪${_paymentAmount.toStringAsFixed(1)} ב־${_redeemedAt.name}';
  }
}
