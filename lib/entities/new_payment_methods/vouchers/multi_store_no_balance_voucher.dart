import 'package:cardy/entities/new_payment_methods/abstract_classes/multi_stores_payment_method.dart';
import 'package:cardy/entities/new_payment_methods/vouchers/voucher_mixin.dart';

class MultiStoreNoBalanceVoucher extends MultiStoresPaymentMethod
    with VoucherMixin {
  MultiStoreNoBalanceVoucher(
      {required super.id,
      required super.name,
      required super.imagePath,
      required super.categories,
      required super.stores});

  @override
  bool get hasBalance => false;

  @override
  bool get hasCvv => false;

  @override
  bool get hasDescription => true;

  @override
  bool get isCard => false;
  
  
}
