import 'package:cardy/entities/payment_methods/payment_methods.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/text_fields/icon_text_field.dart';
import 'package:flutter/material.dart';

class PaymentMethodTextField extends StatefulWidget {
  const PaymentMethodTextField({super.key});

  @override
  State<PaymentMethodTextField> createState() => _PaymentMethodTextFieldState();
}

class _PaymentMethodTextFieldState extends State<PaymentMethodTextField> {
  PaymentMethod? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
      decoration: BoxDecoration(boxShadow: SHADOW),
      child: DropdownButtonFormField<PaymentMethod>(
        dropdownColor: Colors.red,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          fillColor: BACKGROUND_COLOR,
        ),
        value: selectedValue,
        hint: Text('Select an option'),
        items: PaymentMethod.values.map((PaymentMethod item) {
          return DropdownMenuItem<PaymentMethod>(
            value: item,
            child: Text(item.singleDisplayName),
          );
        }).toList(),
        onChanged: (PaymentMethod? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
      ),
    );
  }
}

class PaymentMethodFormController extends ValueNotifier<PaymentMethod?> {
  PaymentMethodFormController({PaymentMethod? initialDate})
      : super(initialDate);

  void setDate(PaymentMethod newValue) {
    value = newValue;
  }

  void clear() {
    value = null;
  }
}
