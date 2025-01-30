abstract class PaymentMethodEntity{
  String? id;
  final String _code;
  final String _typeId;
  final double _initialAmount;
  double remainingAmount;
  final DateTime _addTime;
  final DateTime _expirationDate;

  PaymentMethodEntity(
      {this.id,
      required String code,
      required String typeId,
      required double initialAmount,
      required this.remainingAmount,
      required DateTime addTime,
      required DateTime expirationDate})
      : 
        _code = code,
        _typeId = typeId,
        _initialAmount = initialAmount,
        _addTime = addTime,
        _expirationDate = expirationDate;

  String get code => _code;
  String get typeId => _typeId;
  double get initialAmount => _initialAmount;
  DateTime get addTime => _addTime;
  DateTime get expirationDate => _expirationDate;
}
