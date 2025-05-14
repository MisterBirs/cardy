import 'package:cardy/features/brands/domain/entities/payment_item_entity.dart';
import 'package:flutter/material.dart';

abstract class HistoryRecordEntity {
  //#region Attributes
  final HistoryRecordType _type;
  final PaymentItemEntity _item;
  final DateTime _date;
  final IconData _icon;
  final Color _iconColor;
  final String _dispalyLabel;
  //#endregion

  //#region Constructor
  HistoryRecordEntity({
    required HistoryRecordType type,
    required PaymentItemEntity item,
    required IconData icon,
    required Color iconColor,
    required String dispalyLabel,
  })  : _dispalyLabel = dispalyLabel,
        _iconColor = iconColor,
        _icon = icon,
        _item = item,
        _type = type,
        _date = DateTime.now();
  //#endregion

  @override
  String toString() {
    return message;
  }

  //#region Getters
  HistoryRecordType get type => _type;
  PaymentItemEntity get item => _item;
  DateTime get date => _date;
  IconData get icon => _icon;
  Color get iconColor => _iconColor;
  String get dispalyLabel => _dispalyLabel;
  String get message;

  //#endregion
}

enum HistoryRecordType { add, remove, updateBalance, reload, edit, expired, usedUp }
