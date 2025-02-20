import 'package:cardy/ui/cardy_icons.dart';
import 'package:cardy/ui/widgets/text_fields/icon_text_field.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class AmountTextField extends StatefulWidget {
  final DoubleFormController amountController;

  const AmountTextField({
    super.key,
    required this.amountController,
  });

  @override
  State<AmountTextField> createState() => _AmountTextFieldState();
}

class _AmountTextFieldState extends State<AmountTextField> {
  final TextEditingController txtContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return IconTextField(
        icon: CardyIcons.shekel,
        keyboardType: TextInputType.number,
        validator: _vlidator,
        inputFormatters: [
          CurrencyTextInputFormatter.currency(symbol: '₪', decimalDigits: 0)
        ],
        controller: txtContoller,
        label: 'סכום');
  }

  String? _vlidator(String? value) {
    if (value == null || value.isEmpty || value == '₪' || value == '₪0') {
      return 'שדה חובה';
    }

    final amount = double.tryParse(value.replaceAll('₪', ''));
    if (amount == null || amount <= 0) {
      return 'סכום לא תקין';
    }
    widget.amountController.setDate(amount);
    return null;
  }
}

class DoubleFormController extends ValueNotifier<double?> {
  DoubleFormController({double? initialDate}) : super(initialDate);

  void setDate(double date) {
    value = date;
  }

  void clear() {
    value = null;
  }
}
