import 'package:cardy/entities/payments_methods/item_type_entity.dart';

abstract class ItemEntity {
  String? id;
  final String _code;
  final String? _cvv;
  final String _typeId;
  final ItemTypeEntity _type;
  final double _initialAmount;
  double balance;
  final DateTime _addTime;
  final DateTime _expirationDate;
  final String? _notes;

  ItemEntity(
      {this.id,
      required String code,
      String? cvv,
      required String typeId,
      required ItemTypeEntity type,
      required double initialAmount,
      required this.balance,
      required DateTime addTime,
      required DateTime expirationDate,
      String? notes})
      : _code = code,
        _cvv = cvv,
        _typeId = typeId,
        _type = type,
        _initialAmount = initialAmount,
        _addTime = addTime,
        _expirationDate = expirationDate,
        _notes = notes;

  String get code => _code;
  String? get cvv => _cvv;
  String get typeId => _typeId;
  ItemTypeEntity get type => _type;
  double get initialAmount => _initialAmount;
  DateTime get addTime => _addTime;
  DateTime get expirationDate => _expirationDate;
  String? get notes => _notes;
}
