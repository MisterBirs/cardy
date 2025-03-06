import 'package:cardy/entities/item_history/history_record_entity.dart';
import 'package:cardy/entities/payment_methods/enums.dart';
import 'package:flutter/material.dart';

class EditHistoryRecord extends HistoryRecordEntity {
  EditHistoryRecord({required super.item})
      : super(
          type: HistoryRecordType.edit,
          icon: Icons.edit,
          iconColor: Colors.orange,
          dispalyLabel: 'עריכה',
        );

  @override
  String get message {
    String itemName = item.paymentMethod.singleDisplayName;
    return 'נערכו פרטי ה$itemName';
  }
}
