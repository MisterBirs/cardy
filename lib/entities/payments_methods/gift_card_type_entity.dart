import 'package:cardy/entities/payments_methods/base_payment_method_type_entity.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';

class GiftCardTypeEntity extends BasePaymentMethodTypeEntity {
  final List<StoreEntity> _storesToRedeem;

  GiftCardTypeEntity(
      {required super.id,
      required super.name,
      required super.imagePath,
      super.isCard = true,
      required List<StoreEntity> storesToRedeem,
      required super.categories})
      : _storesToRedeem = storesToRedeem;

  List<StoreEntity> get storesToRedeem => _storesToRedeem;

}
