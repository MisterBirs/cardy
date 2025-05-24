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
      AddHistoryRecordEntity() => (Icons.add_card_outlined, Colors.green, 'הוספה'),
      EditHistoryRecordEntity() => (Icons.edit, Colors.orange, 'עריכה'),
      ExpiredHistoryRecordEntity() => (Icons.event_busy, Colors.red, 'פג תוקף'),
      PaymentHistoryRecordEntity() => (Icons.remove, Colors.blue, 'תשלום'),
      ReloadHistoryRecordEntity() => (Icons.add, Colors.greenAccent, 'טעינה'),
      RemoveHistoryRecordEntity() => (Icons.remove, Colors.red, 'הסרה'),
      UsedUpHistoryRecordEntity() => (
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
        AddHistoryRecordEntity() => addMsg,
        EditHistoryRecordEntity() => _editMsg,
        ExpiredHistoryRecordEntity() => _expiredMsg,
        PaymentHistoryRecordEntity() => () {
            PaymentHistoryRecordEntity record = entity as PaymentHistoryRecordEntity;
            return _getPaymentMsg(
              record.paymentAmount,
              record.redeemedAtId,
            );
          }(),
        ReloadHistoryRecordEntity() => () {
            ReloadHistoryRecordEntity record = entity as ReloadHistoryRecordEntity;
            return _getReloadMsg(
              record.reloadedAmount,
            );
          }(),
        RemoveHistoryRecordEntity() => 'הסרת פריט',
        UsedUpHistoryRecordEntity() => 'נוצל במלואו',
      };

  String get addMsg {
    String itemName = entity.userItemId.paymentMethod.singleDisplayName;
    return entity.userItemId.initialBalance != null
        ? 'נוסף $itemName עם יתרה של ₪${entity.userItemId.initialBalance!.floorToDouble()}'
        : 'נוסף $itemName';
  }

  String get _editMsg {
    String itemName = entity.userItemId.paymentMethod.singleDisplayName;
    return 'נערכו פרטי ה$itemName';
  }

  String get _expiredMsg {
    String itemName = entity.userItemId.paymentMethod.singleDisplayName;
    return 'פג תוקפו של ה$itemName';
  }

  String _getPaymentMsg(double paymentAmount, StoreEntity redeemedAt) {
    return 'שלומו ₪${paymentAmount.toStringAsFixed(1)} ב־${redeemedAt.name}';
  }

  String _getReloadMsg(double reloadedAmount) {
    final itemName = entity.userItemId.paymentMethod.singleDisplayName;
    final formattedAmount = reloadedAmount.toStringAsFixed(1);
    return 'ה$itemName הוטען ב־₪$formattedAmount';
  }
}
