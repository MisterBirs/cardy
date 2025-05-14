import 'package:cardy/features/wallet/domain/entities/item_history/history_record_entity.dart';
import 'package:cardy/features/brands/domain/entities/enums.dart';

import 'package:flutter/material.dart';

class ReloadHistoryRecord extends HistoryRecordEntity {
  final double _reloadedAmount;

  ReloadHistoryRecord(
      {required super.item, required double reloadedAmount})
      : _reloadedAmount = reloadedAmount,
        super(
          type: HistoryRecordType.reload,
          icon: Icons.add,
          iconColor: Colors.green,
          dispalyLabel: 'טעינה',
        );

  double get newBalance => _reloadedAmount;


  @override
  String get message {
    final itemName = item.paymentMethod.singleDisplayName;
    final formattedBalance = newBalance.toStringAsFixed(1);
    return 'ה$itemName הוטען ב־₪$formattedBalance';
  }
  
}