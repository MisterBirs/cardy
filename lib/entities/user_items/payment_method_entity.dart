abstract class PaymentMethodEntity {
  String? id;
  final String _code;
  final String? _cvv;
  final String _typeId;
  final double _initialAmount;
  double remainingAmount;
  final DateTime _addTime;
  final DateTime _expirationDate;
  final String? _notes;

  PaymentMethodEntity(
      {this.id,
      required String code,
      String? cvv,
      required String typeId,
      required double initialAmount,
      required this.remainingAmount,
      required DateTime addTime,
      required DateTime expirationDate,
      String? notes})
      : _code = code,
        _cvv = cvv,
        _typeId = typeId,
        _initialAmount = initialAmount,
        _addTime = addTime,
        _expirationDate = expirationDate,
        _notes = notes;

  String get code => _code;
  String? get cvv => _cvv;
  String get typeId => _typeId;
  double get initialAmount => _initialAmount;
  DateTime get addTime => _addTime;
  DateTime get expirationDate => _expirationDate;
  String? get notes => _notes;
}
