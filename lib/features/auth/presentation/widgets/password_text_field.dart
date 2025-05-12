import 'package:cardy/ui/widgets/gradient_color_mask.dart';
import 'package:cardy/ui/widgets/text_fields/icon_text_field.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconTextField(
        icon: Icons.key,
        tail: GestureDetector(
          onTap: _togglePasswordVisibility,
          child: GradientColorMask(
              child: Icon(_isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off),),
        ),
        label: 'סיסמא',
        obscureText: !_isPasswordVisible,
        keyboardType: TextInputType.visiblePassword,
        validator: _validatePassword,
        controller: widget._controller);
  }
}

String? _validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'שדה חובה';
  }
  if (value.length < 6) {
    return 'הכנס לפחות 6 תווים';
  }
  return null;
}