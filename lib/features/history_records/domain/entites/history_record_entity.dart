import 'package:cardy/features/brands/domain/entities/store_entity.dart';
import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';

sealed class HistoryRecordEntity {
  final UserItemEntity item;
  final DateTime date;

  HistoryRecordEntity({
    required this.item,
  }) : date = DateTime.now();
}

class AddHistoryRecord extends HistoryRecordEntity {
  AddHistoryRecord({required super.item});
}

class EditHistoryRecord extends HistoryRecordEntity {
  EditHistoryRecord({required super.item});
}

class ExpiredHistoryRecord extends HistoryRecordEntity {
  final DateTime _expiredAt;
  ExpiredHistoryRecord({required super.item, required DateTime expiredAt})
      : _expiredAt = expiredAt;

  DateTime get expiredAt => _expiredAt;
}

class PaymentHistoryRecord extends HistoryRecordEntity {
  final double _paymentAmount;
  final StoreEntity _redeemedAt;

  PaymentHistoryRecord(
      {required super.item,
      required double paymentAmount,
      required StoreEntity redeemedAt})
      : _paymentAmount = paymentAmount,
        _redeemedAt = redeemedAt;

  double get paymentAmount => _paymentAmount;
  StoreEntity get redeemedAt => _redeemedAt;
}

class ReloadHistoryRecord extends HistoryRecordEntity {
  final double _reloadedAmount;

  ReloadHistoryRecord(
      {required super.item, required double reloadedAmount})
      : _reloadedAmount = reloadedAmount;

  double get reloadedAmount => _reloadedAmount;
}

class RemoveHistoryRecord extends HistoryRecordEntity {
  RemoveHistoryRecord({required super.item});
}

class UsedUpHistoryRecord extends HistoryRecordEntity {
  UsedUpHistoryRecord({required super.item});
}



// הוסף מחלקות נוספות לפי הצורך