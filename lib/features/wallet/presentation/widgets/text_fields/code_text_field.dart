import 'package:cardy/core/ui_constants.dart';
import 'package:cardy/features/wallet/presentation/widgets/barcode_scanner.dart';
import 'package:cardy/features/wallet/presentation/widgets/text_fields/icon_text_field.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CodeTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  const CodeTextField({super.key, required this.label, this.controller});

  @override
  State<CodeTextField> createState() => _CodeTextFieldState();
}

class _CodeTextFieldState extends State<CodeTextField> {
  @override
  Widget build(BuildContext context) {
    return IconTextField(
      icon: Symbols.barcode,
      label: widget.label,
      validator: _validateCode,
      controller: widget.controller,
      keyboardType: TextInputType.number,
      padding: const EdgeInsets.only(right: SCREEN_HORIZONTAL_PADDING),
      tail: _scanBarcodeButton,
    );
  }

  String? _validateCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'שדה חובה';
    }
    return null;
  }

  Widget get _scanBarcodeButton {
    return BarcodeScanner(builder: (void Function() showScanner) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Material(
          child: InkWell(
            onTap: showScanner,
            child: Ink(
              height: double.infinity,
              width: 80,
              decoration:
                  BoxDecoration(boxShadow: SHADOW, gradient: GRADIENT_COLOR),
              child: Icon(Symbols.barcode_scanner,
                  color: CONTRAST_TEXT_CORLOR, size: ICON_SIZE),
            ),
          ),
        ),
      );
    }, onBarcodeScanned: (value) {
      setState(() {
        widget.controller!.text = value;
      });
    });
  }
}
