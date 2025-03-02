import 'package:cardy/entities/payment_methods/history_record_entity.dart';
import 'package:cardy/entities/payment_methods/brand_entity.dart';

class PaymentItemEntity {

  //#region Attributes
  final String _id;
  final BrandEntity _paymentMethod;
  final String _code;
  final DateTime _expirationDate;
  final String? _notes;
  final List<HistoryRecordEntity> _history = [];
  final String? _cvv;
  double? _balance;
  final double? _initialBalance;
  final String? _description;
  //#endregion

  //#region Costructor
  PaymentItemEntity({
    required String id,
    required BrandEntity paymentMethod,
    required String code,
    required DateTime expirationDate,
    String? notes,
    String? cvv,
    double? balance,
    double? initialBalance,
    String? description,
  })  : _id = id,
        _paymentMethod = paymentMethod,
        _code = code,
        _expirationDate = expirationDate,
        _notes = notes,
        _cvv = cvv,
        _balance = balance,
        _initialBalance = initialBalance,
        _description = description {
    _verifyAttributesInitialization();
    _initHistory();
  }
  //#endregion

  //#region Private methods
  void _initHistory() {
    _history.add(HistoryRecordEntity(
      date: DateTime.now(),
      type: HistoryRecordType.add,
      item: this,
    ));
  }

  void _verifyAttributesInitialization() {
    if (paymentMethod.hasCvv && _cvv == null) {
      _throwDataMissingException('CVV');
    }
    if (!paymentMethod.hasCvv && _cvv != null) {
      _throwIllegalDataException('CVV');
    }
    if (paymentMethod.hasBalance && _balance == null) {
      _throwDataMissingException('balance');
    }
    if (!paymentMethod.hasBalance && _balance != null) {
      _throwIllegalDataException('balance');
    }
    if (paymentMethod.hasDescription && _description == null) {
      _throwDataMissingException('description');
    }
    if (!paymentMethod.hasDescription && _description != null) {
      _throwIllegalDataException('description');
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
      _balance = _balance! + _initialBalance!;
    }
  }

  void subtractFromBalance(double value) {
    if (_balance != null) {
      _balance = _balance! - _initialBalance!;
    }
  }
  //#endregion

  //#region Getters
  String get id => _id;
  BrandEntity get paymentMethod => _paymentMethod;
  String get code => _code;
  DateTime get expirationDate => _expirationDate;
  String? get notes => _notes;
  List<HistoryRecordEntity> get history => _history;
  String? get cvv => _cvv;
  double? get balance => _balance;
  double? get initialBalance => _initialBalance;
  String? get description => _description;
  //#endregion

}
