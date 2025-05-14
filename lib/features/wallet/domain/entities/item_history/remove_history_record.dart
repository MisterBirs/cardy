import 'package:cardy/features/wallet/domain/entities/item_history/history_record_entity.dart';
import 'package:cardy/features/brands/domain/entities/enums.dart';
import 'package:flutter/material.dart';

class RemoveHistoryRecord extends HistoryRecordEntity {
  RemoveHistoryRecord({required super.item})
      : super(
          type: HistoryRecordType.remove,
          icon: Icons.remove,
          iconColor: Colors.red,
          dispalyLabel: 'הסרה',
        );
        
          @override
          String get message => 'ה${item.paymentMethod.singleDisplayName} הוסר';
}