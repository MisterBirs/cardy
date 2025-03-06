import 'package:cardy/entities/item_history/history_record_entity.dart';
import 'package:cardy/entities/payment_methods/enums.dart';
import 'package:flutter/material.dart';

class AddHistoryRecord extends HistoryRecordEntity {
  AddHistoryRecord({required super.item})
      : super(
          type: HistoryRecordType.add,
          icon: Icons.add,
          iconColor: Colors.green,
          dispalyLabel: 'הוספה',
        );

  @override
  String get message {
    String itemName = item.paymentMethod.singleDisplayName;
    String initialBalance = item.initialBalance.toString();
    return 'נוסף $itemName עם יתרה של $initialBalance';
  }
}
