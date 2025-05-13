import 'package:cardy/features/wallet/presentation/widgets/text_fields/icon_text_field.dart';
import 'package:flutter/material.dart';

class CvvTextField extends StatelessWidget {
  const CvvTextField({
    super.key,
    required TextEditingController cvvController,
  }) : _cvvController = cvvController;

  final TextEditingController _cvvController;

  @override
  Widget build(BuildContext context) {
    return IconTextField(
        icon: Icons.password,
        validator: _vlidator,
        maxLength: 3,
        keyboardType: TextInputType.number,
        controller: _cvvController,
        label: 'cvv',);
  }

  String? _vlidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'שדה חובה';
    }
    if (value.length != 3) {
      return 'CVV חייב להיות בעל 3 ספרות';
    }
    return null;
  }
}
