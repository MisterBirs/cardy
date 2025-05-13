import 'package:cardy/features/wallet/presentation/widgets/text_fields/icon_text_field.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return IconTextField(
      icon: Icons.mail,
      label: 'אימייל',
      keyboardType: TextInputType.emailAddress,
      controller: _controller,
      validator: _validateEmail,
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'שדה חובה';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'הכתובת לא תקינה';
    }
    return null;
  }
}
