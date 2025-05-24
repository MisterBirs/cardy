import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/history_records/domain/entites/history_record_entity.dart';
import 'package:cardy/features/user_items/domain/entites/payment_methods_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_item_entity.freezed.dart';

@freezed
abstract class UserItemEntity with _$UserItemEntity {

  //#region Costructor
  const factory UserItemEntity({
    required String id,
    required PaymentMethodsEnum paymentMethod,
    required BrandEntity brand,
    required String code,
    required DateTime expirationDate,
    String? notes,
    String? cvv,
    @Default([]) List<HistoryRecordEntity> history,
    double? balance,
    double? initialBalance,
    String? description,
  }) = _UserItemEntity;
  //#endregion

  //#region Private methods
  // void _initHistory(List<HistoryRecordEntity>? historyRecords) {
  //   _history.add(AddHistoryRecordEntity(
  //   ));
  //   if (historyRecords != null) {
  //     _history.addAll(historyRecords);
  //   }
  // }

  // void _verifyAttributesInitialization() {
  //   if (brandId.hasCvv && _cvv == null) {
  //     _throwDataMissingException('CVV');
  //   }
  //   if (!brandId.hasCvv && _cvv != null) {
  //     _throwIllegalDataException('CVV');
  //   }
  // }

  // void _throwDataMissingException(String dataName) {
  //   throw Exception('Payment item $id is missing a $dataName.');
  // }

  // void _throwIllegalDataException(String dataName) {
  //   throw Exception('It is illegal for payment item $id to have a $dataName.');
  // }
  //#endregion

  //#region Public methods


  // void subtractFromBalance(double value, StoreEntity redeemedAt) {
  //   if (_balance != null) {
  //     final newBalance = balance! - value;
  //     if (newBalance < 0) {
  //       throw Exception('Cannot subtract more than the balance');
  //     }
  //     _balance = newBalance;

  //     _history.add(PaymentHistoryRecordEntity(
  //       paymentAmount: value,
  //       redeemedAt: redeemedAt,
  //     ));

  //     if (newBalance <= 0) {
  //       setUsedUp();
  //     }
  //   }
  // }

  // void setUsedUp() {
  //   _isUsedUp = true;
  //   if (_balance != null) {
  //     _balance = 0;
  //   }
  //   _history.add(UsedUpHistoryRecordEntity(
  //   ));
  // }

  // void addHistoryRecord(HistoryRecordEntity historyRecordEntity) {
  //   _history.add(historyRecordEntity);
  // }

  // void addAllHistoryRecords(List<HistoryRecordEntity> historyRecords) {
  //   _history.addAll(historyRecords);
  // }
  
  //#endregion

  //#region Getters
  // String get id => _id;
  // BrandEntity get brand => _brand;
  // PaymentMethodsEnum get paymentMethod => _paymentMethod;
  // String get code => _code;
  // DateTime get expirationDate => _expirationDate;
  // String? get notes => _notes;
  // List<HistoryRecordEntity> get history => _history;
  // String? get cvv => _cvv;
  // double? get balance => _balance;
  // double? get initialBalance => _initialBalance;
  // String? get description => _description;
  // bool get isUsedUp => _isUsedUp;
  // bool get isExpired {
  //   final isExpired = _expirationDate.isBefore(DateTime.now());

  //   // Add expired history record only if it doesn't already exist
  //   if (isExpired &&
  //       !_history.any((record) => record is ExpiredHistoryRecordEntity)) {
  //     _history.add(ExpiredHistoryRecordEntity(
  //       expiredAt: _expirationDate,
  //     ));
  //   }
  //   return isExpired;
  // }

  // bool get isValid => !isUsedUp && !isExpired;

  // DateTime? get invalidDate {
  //   if (isValid) {
  //     return null;
  //   }

  //   final DateTime? usedUpDate = _history
  //       .whereType<UsedUpHistoryRecordEntity>()
  //       .map((record) => record.date)
  //       .firstOrNull;

  //   if (usedUpDate == null) {
  //     return expirationDate;
  //   }

  //   return usedUpDate.isBefore(expirationDate) ? usedUpDate : expirationDate;
  // }

  //#endregion
}
