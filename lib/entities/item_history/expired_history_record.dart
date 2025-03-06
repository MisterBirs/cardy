import 'package:cardy/entities/item_history/history_record_entity.dart';
import 'package:cardy/entities/payment_methods/enums.dart';
import 'package:flutter/material.dart';

class ExpiredHistoryRecord extends HistoryRecordEntity {
  ExpiredHistoryRecord({required super.item})
      : super(
          type: HistoryRecordType.expired,
          icon: Icons.event_busy,
          iconColor: Colors.pink,
          dispalyLabel: 'פג תוקף',
        );

  @override
  String get message {
    String itemName = item.paymentMethod.singleDisplayName;
    return 'פג תוקפו של ה$itemName';
  }
  
}
