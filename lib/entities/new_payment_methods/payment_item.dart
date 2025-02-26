import 'package:cardy/entities/new_payment_methods/abstract_classes/payment_method.dart';
import 'package:cardy/entities/new_payment_methods/history_record.dart';

class PaymentItem {
  final String _id;
  final PaymentMethod _paymentMethod;
  final String _code;
  final DateTime _expirationDate;
  final String? _notes;
  final List<HistoryRecord> _history;
  final String? _cvv;
  double? _balance;
  final double? _initialBalance;
  final String? _description;

  PaymentItem({
    required String id,
    required PaymentMethod paymentMethod,
    required String code,
    required DateTime expirationDate,
    String? notes,
    List<HistoryRecord> history = const [],
    String? cvv,
    double? balance,
    double? initialBalance,
    String? description,
  })  : _id = id,
        _paymentMethod = paymentMethod,
        _code = code,
        _expirationDate = expirationDate,
        _notes = notes,
        _history = history,
        _cvv = cvv,
        _balance = balance,
        _initialBalance = initialBalance,
        _description = description;

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

  String get id => _id;
  PaymentMethod get paymentMethod => _paymentMethod;
  String get code => _code;
  DateTime get expirationDate => _expirationDate;
  String? get notes => _notes;
  List<HistoryRecord> get history => _history;
  String? get cvv => _cvv;
  double? get balance => _balance;
  double? get initialBalance => _initialBalance;
  String? get description => _description;
}
