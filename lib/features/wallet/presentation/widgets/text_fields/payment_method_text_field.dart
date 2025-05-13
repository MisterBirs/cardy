import 'package:cardy/features/wallet/domain/entities/payment_methods/enums.dart';
import 'package:cardy/features/wallet/presentation/widgets/text_fields/custom_drop_down.dart';
import 'package:flutter/material.dart';

class PaymentMethodTextField extends StatelessWidget {
  const PaymentMethodTextField({
    super.key,
    required this.items,
    required this.paymentMethodController,
  });

  final List<PaymentMethodsEnum> items;
  final ValueNotifier<PaymentMethodsEnum?> paymentMethodController;

  @override
  Widget build(BuildContext context) {
    return CustomDropDown<PaymentMethodsEnum>(
        icon: Icons.payment,
        items: items,
        controller: paymentMethodController,
        itemBuilder: (item) => item.singleDisplayName,
        onChanged: (value) {});
  }
}
