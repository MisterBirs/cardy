import 'package:cardy/entities/payment_methods/enums.dart';
import 'package:cardy/ui/widgets/text_fields/custom_drop_down.dart';
import 'package:flutter/material.dart';

class BrandTypeTextField extends StatelessWidget {
  const BrandTypeTextField({
    super.key,
    required this.items,
    required this.paymentMethodController,
  });

  final List<BrandTypesEnum> items;
  final ValueNotifier<BrandTypesEnum?> paymentMethodController;

  @override
  Widget build(BuildContext context) {
    return FormField<BrandTypesEnum?>(
      initialValue: null,
      validator: (value) {
        if (value == null) {
          return 'בחר סוג';
        }
        return null;
      },
      builder: (FormFieldState<BrandTypesEnum?> fieldState) =>
          CustomDropDown<BrandTypesEnum>(
              icon: Icons.payment,
              items: items,
              controller: paymentMethodController,
              itemBuilder: (item) => item.singleDisplayName,
              validator: (_){
                if(fieldState.hasError){
                  return fieldState.errorText;
                }
                return null;
              },
              onChanged: (value) {
                fieldState.didChange(value);
                paymentMethodController.value = value;
              }),
    );
  }
}
