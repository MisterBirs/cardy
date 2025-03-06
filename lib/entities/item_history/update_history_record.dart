import 'package:cardy/entities/item_history/history_record_entity.dart';
import 'package:cardy/entities/payment_methods/enums.dart';
import 'package:cardy/entities/payment_methods/store_entity.dart';
import 'package:flutter/material.dart';

class UpdateHistoryRecord extends HistoryRecordEntity {
  final double _newBalance;
  final StoreEntity _redeemedAt;

  UpdateHistoryRecord({required super.item, required double newBalance, required StoreEntity redeemedAt})
      : _newBalance = newBalance,
        _redeemedAt = redeemedAt,
        super(
          type: HistoryRecordType.updateBalance,
          icon: Icons.update,
          iconColor: Colors.blue,
          dispalyLabel: 'עדכון יתרה',
        );

  double get newBalance => _newBalance;

  StoreEntity get redeemedAt => _redeemedAt;
  
  @override
  String get message{
    final itemName = item.paymentMethod.singleDisplayName;
    return 'היתרה של ה$itemName ל $newBalance עודכנה';
  }
}
