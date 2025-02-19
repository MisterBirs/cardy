import 'package:cardy/ui/widgets/text_fields/icon_text_field.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class ExpirationDateTextField extends IconTextField {
  const ExpirationDateTextField({
    super.key,
    required super.controller,
    super.onChanged,
  }) : super(label: 'תוקף', icon: Symbols.calendar_clock, readOnly: true);

  @override
  State<IconTextField> createState() => _ExpirationDateTextFieldState();
}

class _ExpirationDateTextFieldState extends State<ExpirationDateTextField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickDate,
      child: AbsorbPointer( // AbsorbPointer is used to enable to active the GestureDetector on the text field
        child: widget.buildTextFieldContainer(
          [
            widget.buildIcon(widget.icon),
            Expanded(child: widget.buildTextFormField())
          ],
        ),
      ),
    );
  }

  void pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 20)),
    );

    if (date != null) {
      widget.controller.text = '${date.day}.${date.month}.${date.year}';
    }
  }
}
