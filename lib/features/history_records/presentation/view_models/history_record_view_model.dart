import 'package:cardy/features/brands/domain/entities/store_entity.dart';
import 'package:cardy/features/history_records/domain/entites/history_record_entity.dart';
import 'package:cardy/features/user_items/domain/entites/payment_methods_enum.dart';
import 'package:flutter/material.dart';

class HistoryRecordViewModel {
  final HistoryRecordEntity entity;
  final IconData icon;
  final Color iconColor;
  final String displayLabel;

  HistoryRecordViewModel({
    required this.entity,
    required this.icon,
    required this.iconColor,
    required this.displayLabel,
  });

  factory HistoryRecordViewModel.fromEntity(HistoryRecordEntity entity) {
    final (icon, iconColor, displayLabel) = switch (entity) {
      AddHistoryRecord() => (Icons.add_card_outlined, Colors.green, 'הוספה'),
      EditHistoryRecord() => (Icons.edit, Colors.orange, 'עריכה'),
      ExpiredHistoryRecord() => (Icons.event_busy, Colors.red, 'פג תוקף'),
      PaymentHistoryRecord() => (Icons.remove, Colors.blue, 'תשלום'),
      ReloadHistoryRecord() => (Icons.add, Colors.greenAccent, 'טעינה'),
      RemoveHistoryRecord() => (Icons.remove, Colors.red, 'הסרה'),
      UsedUpHistoryRecord() => (
          Icons.check_circle,
          Colors.purple,
          'נוצל במלואו'
        ),
      // הוסף מקרים נוספים
    };

    return HistoryRecordViewModel(
      entity: entity,
      icon: icon,
      iconColor: iconColor,
      displayLabel: displayLabel,
    );
  }

  String get message => switch (entity) {
        AddHistoryRecord() => addMsg,
        EditHistoryRecord() => _editMsg,
        ExpiredHistoryRecord() => _expiredMsg,
        PaymentHistoryRecord() => () {
            PaymentHistoryRecord record = entity as PaymentHistoryRecord;
            return _getPaymentMsg(
              record.paymentAmount,
              record.redeemedAt,
            );
          }(),
        ReloadHistoryRecord() => () {
            ReloadHistoryRecord record = entity as ReloadHistoryRecord;
            return _getReloadMsg(
              record.reloadedAmount,
            );
          }(),
        RemoveHistoryRecord() => 'הסרת פריט',
        UsedUpHistoryRecord() => 'נוצל במלואו',
      };

  String get addMsg {
    String itemName = entity.item.paymentMethod.singleDisplayName;
    return entity.item.initialBalance != null
        ? 'נוסף $itemName עם יתרה של ₪${entity.item.initialBalance!.floorToDouble()}'
        : 'נוסף $itemName';
  }

  String get _editMsg {
    String itemName = entity.item.paymentMethod.singleDisplayName;
    return 'נערכו פרטי ה$itemName';
  }

  String get _expiredMsg {
    String itemName = entity.item.paymentMethod.singleDisplayName;
    return 'פג תוקפו של ה$itemName';
  }

  String _getPaymentMsg(double paymentAmount, StoreEntity redeemedAt) {
    return 'שלומו ₪${paymentAmount.toStringAsFixed(1)} ב־${redeemedAt.name}';
  }

  String _getReloadMsg(double reloadedAmount) {
    final itemName = entity.item.paymentMethod.singleDisplayName;
    final formattedAmount = reloadedAmount.toStringAsFixed(1);
    return 'ה$itemName הוטען ב־₪$formattedAmount';
  }
}
