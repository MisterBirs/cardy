import 'package:cardy/entities/user_items/payment_method_entity.dart';

class CreditEntity extends PaymentMethodEntity {
  CreditEntity({
    required super.id,
    required super.code,
    super.cvv,
    required super.typeId,
    required super.type,
    required super.initialAmount,
    required super.balance,
    required super.addTime,
    required super.expirationDate,
    super.notes,
  });
}
