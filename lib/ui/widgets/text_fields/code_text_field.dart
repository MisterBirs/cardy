import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/barcode_scanner.dart';
import 'package:cardy/ui/widgets/text_fields/icon_text_field.dart';

class CodeTextField extends IconTextField {
  const CodeTextField({
    super.key,
    required super.controller,
    super.onChanged,
    required super.label,
  }) : super(
          padding: const EdgeInsets.only(right: SCREEN_HORIZONTAL_PADDING),
          icon: Symbols.barcode,
        );

  @override
  State<IconTextField> createState() => _CodeTextFieldState();
}

class _CodeTextFieldState extends State<CodeTextField> {
  @override
  Widget build(BuildContext context) {
    return widget.buildTextFieldContainer([
      widget.buildIcon(widget.icon),
      Expanded(child: widget.buildTextFormField()),
      _scanBarcodeButton
    ]);
  }

  Widget get _scanBarcodeButton {
    return BarcodeScanner(builder: (void Function() showScanner) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Material(
          child: InkWell(
            onTap: showScanner,
            child: Ink(
              height: widget.height,
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
        widget.controller.text = value;
      });
    });
  }
}
