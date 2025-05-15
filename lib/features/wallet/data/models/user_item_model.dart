import 'package:cardy/features/wallet/data/models/history_record_model.dart';
import 'package:cardy/features/brands/domain/entities/brand_types_enum.dart';

class UserItemModel {
  final String _id;
  final PaymentMethodsEnum _paymentMethod;
  final String _brandId;
  final String _code;
  final DateTime _expirationDate;
  final String? _notes;
  final List<HistoryRecordModel> _history;
  final String? _cvv;
  final double? _balance;
  final double? _initialBalance;
  final String? _description;
  final bool _isUsedUp;

  const UserItemModel({
    required String id,
    required PaymentMethodsEnum paymentMethod,
    required String brandId,
    required String code,
    required DateTime expirationDate,
    String? notes,
    String? cvv,
    List<HistoryRecordModel> historyRecords = const [],
    double? balance,
    double? initialBalance,
    String? description,
    required bool isUsedUp
  })  : _id = id,
        _brandId = brandId,
        _paymentMethod = paymentMethod,
        _code = code,
        _expirationDate = expirationDate,
        _notes = notes,
        _cvv = cvv,
        _balance = balance,
        _initialBalance = initialBalance,
        _description = description,
        _history = historyRecords,
        _isUsedUp = isUsedUp;


        String get id => _id;
        PaymentMethodsEnum get paymentMethod => _paymentMethod;
        String get brandId => _brandId;
        String get code => _code;
        DateTime get expirationDate => _expirationDate;
        String? get notes => _notes;
        List<HistoryRecordModel> get history => _history;
        String? get cvv => _cvv;
        double? get balance => _balance;
        double? get initialBalance => _initialBalance;
        String? get description => _description;
        bool get isUsedUp => _isUsedUp;
}