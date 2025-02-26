import 'package:cardy/entities/new_payment_methods/abstract_classes/single_store_payment_method.dart';
import 'package:cardy/entities/new_payment_methods/vouchers/voucher_mixin.dart';

class Voucher extends SingleStorePaymentMethod with VoucherMixin {
  Voucher({required super.id, required super.store});

  @override
  bool get hasBalance => true;

  @override
  bool get hasCvv => false;

  @override
  bool get hasDescription => false;

  @override
  bool get isCard => false;
}
