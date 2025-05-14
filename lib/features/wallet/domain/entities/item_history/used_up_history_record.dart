import 'package:cardy/features/wallet/domain/entities/item_history/history_record_entity.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:cardy/features/brands/domain/entities/enums.dart';


class UsedUpHistoryRecord extends HistoryRecordEntity {
  UsedUpHistoryRecord({required super.item})
      : super(
          type: HistoryRecordType.usedUp,
          icon: Symbols.check_circle,
          iconColor: Colors.deepPurple,
          dispalyLabel: 'נוצל במלואו',
        );

  @override
  String get message {
    String itemName = item.paymentMethod.singleDisplayName;
    return 'ה$itemName נוצל במלואו';
  }
}
