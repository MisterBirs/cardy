import 'package:cardy/entities/item_history/history_record_entity.dart';
import 'package:cardy/entities/payment_methods/enums.dart';
import 'package:flutter/material.dart';

class AddHistoryRecord extends HistoryRecordEntity {
  AddHistoryRecord({required super.item})
      : super(
          type: HistoryRecordType.add,
          icon: Icons.add_card_outlined,
          iconColor: Colors.green,
          dispalyLabel: 'הוספה',
        );

  @override
  String get message {
    return item.initialBalance != null ? withBalanceMsg : withoutBalanceMsg;
  }

  String get withBalanceMsg {
    String itemName = item.paymentMethod.singleDisplayName;
    String initialBalance = item.initialBalance!.floorToDouble().toString();
    return 'נוסף $itemName עם יתרה של ₪$initialBalance';
  }

  String get withoutBalanceMsg {
    String itemName = item.paymentMethod.singleDisplayName;
    return 'נוסף $itemName';
  }
}
