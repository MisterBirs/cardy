import 'package:cardy/features/wallet/domain/entities/item_history/history_record_entity.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/enums.dart';
import 'package:flutter/material.dart';

class ExpiredHistoryRecord extends HistoryRecordEntity {
  final DateTime _expiredAt;

  ExpiredHistoryRecord({required super.item, required DateTime expiredAt})
      : _expiredAt = expiredAt,
        super(
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

  @override
  DateTime get date => _expiredAt;
}
