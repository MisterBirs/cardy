
import 'package:cardy/features/brands/domain/entities/store_entity.dart';

sealed class HistoryRecordEntity {
  final DateTime date;

  HistoryRecordEntity() : date = DateTime.now();
}

class AddHistoryRecordEntity extends HistoryRecordEntity {
  AddHistoryRecordEntity();
}

class EditHistoryRecordEntity extends HistoryRecordEntity {
  EditHistoryRecordEntity();
}

class ExpiredHistoryRecordEntity extends HistoryRecordEntity {
  final DateTime _expiredAt;
  ExpiredHistoryRecordEntity({required DateTime expiredAt})
      : _expiredAt = expiredAt;

  DateTime get expiredAt => _expiredAt;
}

class PaymentHistoryRecordEntity extends HistoryRecordEntity {
  final double _paymentAmount;
  final StoreEntity _redeemedAt;

  PaymentHistoryRecordEntity(
      {
      required double paymentAmount,
      required StoreEntity redeemedAt})
      : _paymentAmount = paymentAmount,
        _redeemedAt = redeemedAt;

  double get paymentAmount => _paymentAmount;
  StoreEntity get redeemedAtId => _redeemedAt;
}

class ReloadHistoryRecordEntity extends HistoryRecordEntity {
  final double _reloadedAmount;

  ReloadHistoryRecordEntity(
      {required double reloadedAmount})
      : _reloadedAmount = reloadedAmount;

  double get reloadedAmount => _reloadedAmount;
}

class RemoveHistoryRecordEntity extends HistoryRecordEntity {
  RemoveHistoryRecordEntity();
}

class UsedUpHistoryRecordEntity extends HistoryRecordEntity {
  UsedUpHistoryRecordEntity();
}



// הוסף מחלקות נוספות לפי הצורך