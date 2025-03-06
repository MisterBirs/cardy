import 'package:cardy/entities/item_history/history_record_entity.dart';
import 'package:cardy/entities/payment_methods/enums.dart';
import 'package:flutter/material.dart';

class UsedUpHistoryRecord extends HistoryRecordEntity {
  UsedUpHistoryRecord({required super.item})
      : super(
          type: HistoryRecordType.usedUp,
          icon: Icons.add,
          iconColor: Colors.deepPurple,
          dispalyLabel: 'נוצל במלואו',
        );

  @override
  String get message {
    String itemName = item.paymentMethod.singleDisplayName;
    return 'ה$itemName נוצל במלואו';
  }
}
