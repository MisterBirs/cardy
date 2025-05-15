import 'package:cardy/features/history_records/domain/entities/add_history_record.dart';
import 'package:cardy/features/history_records/domain/entities/expired_history_record.dart';
import 'package:cardy/features/history_records/domain/entities/history_record_entity.dart';
import 'package:cardy/features/history_records/domain/entities/payment_history_record.dart';
import 'package:cardy/features/history_records/domain/entities/reload_history_record.dart';
import 'package:cardy/features/history_records/domain/entities/used_up_history_record.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/brands/domain/entities/store_entity.dart';
import 'package:cardy/features/user_items/domain/entites/payment_methods_enum.dart';

class UserItemEntity {
  //#region Attributes
  final String _id;
  final PaymentMethodsEnum _paymentMethod;
  final BrandEntity _brand;
  final String _code;
  final DateTime _expirationDate;
  final String? _notes;
  final List<HistoryRecordEntity> _history = [];
  final String? _cvv;
  double? _balance;
  final double? _initialBalance;
  final String? _description;
  bool _isUsedUp = false;
  //#endregion

  //#region Costructor
  UserItemEntity({
    required String id,
    required PaymentMethodsEnum paymentMethod,
    required BrandEntity brand,
    required String code,
    required DateTime expirationDate,
    String? notes,
    String? cvv,
    List<HistoryRecordEntity>? historyRecords,
    double? balance,
    double? initialBalance,
    String? description,
  })  : _id = id,
        _brand = brand,
        _paymentMethod = paymentMethod,
        _code = code,
        _expirationDate = expirationDate,
        _notes = notes,
        _cvv = cvv,
        _balance = balance,
        _initialBalance = initialBalance,
        _description = description {
    _verifyAttributesInitialization();
    _initHistory(historyRecords);
  }
  //#endregion

  //#region Private methods
  void _initHistory(List<HistoryRecordEntity>? historyRecords) {
    _history.add(AddHistoryRecord(
      item: this,
    ));
    if (historyRecords != null) {
      _history.addAll(historyRecords);
    }
  }

  void _verifyAttributesInitialization() {
    if (brand.hasCvv && _cvv == null) {
      _throwDataMissingException('CVV');
    }
    if (!brand.hasCvv && _cvv != null) {
      _throwIllegalDataException('CVV');
    }
  }

  void _throwDataMissingException(String dataName) {
    throw Exception('Payment item $id is missing a $dataName.');
  }

  void _throwIllegalDataException(String dataName) {
    throw Exception('It is illegal for payment item $id to have a $dataName.');
  }
  //#endregion

  //#region Public methods
  void addToBalance(double value) {
    if (_balance != null) {
      _balance = _balance! + value;
    }
    _history.add(ReloadHistoryRecord(
      item: this,
      reloadedAmount: value,
    ));
  }

  void subtractFromBalance(double value, String redeemedAt) {
    if (_balance != null) {
      final newBalance = balance! - value;
      if (newBalance < 0) {
        throw Exception('Cannot subtract more than the balance');
      }
      _balance = newBalance;

      _history.add(PaymentHistoryRecord(
        item: this,
        paymentAmount: value,
        redeemedAt: redeemedAt,
      ));

      if (newBalance <= 0) {
        setUsedUp();
      }
    }
  }

  void setUsedUp() {
    _isUsedUp = true;
    if (_balance != null) {
      _balance = 0;
    }
    _history.add(UsedUpHistoryRecord(
      item: this,
    ));
  }

  void addHistoryRecord(HistoryRecordEntity historyRecordEntity) {
    _history.add(historyRecordEntity);
  }

  void addAllHistoryRecords(List<HistoryRecordEntity> historyRecords) {
    _history.addAll(historyRecords);
  }

  //#endregion

  //#region Getters
  String get id => _id;
  BrandEntity get brand => _brand;
  PaymentMethodsEnum get paymentMethod => _paymentMethod;
  String get code => _code;
  DateTime get expirationDate => _expirationDate;
  String? get notes => _notes;
  List<HistoryRecordEntity> get history => _history;
  String? get cvv => _cvv;
  double? get balance => _balance;
  double? get initialBalance => _initialBalance;
  String? get description => _description;
  bool get isUsedUp => _isUsedUp;
  bool get isExpired {
    final isExpired = _expirationDate.isBefore(DateTime.now());

    // Add expired history record only if it doesn't already exist
    if (isExpired &&
        !_history.any((record) => record is ExpiredHistoryRecord)) {
      _history.add(ExpiredHistoryRecord(
        expiredAt: _expirationDate,
        item: this,
      ));
    }
    return isExpired;
  }
  bool get isValid => !isUsedUp && !isExpired;

  DateTime? get invalidDate {
    if (isValid) {
      return null;
    }

    final DateTime? usedUpDate = _history
        .whereType<UsedUpHistoryRecord>().map((record)=>record.date).firstOrNull;

    if (usedUpDate == null) {
      return expirationDate;
    }

    return usedUpDate.isBefore(expirationDate) ? usedUpDate : expirationDate;
  }
  
  //#endregion
}
