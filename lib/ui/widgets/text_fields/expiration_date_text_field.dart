import 'package:cardy/ui/widgets/text_fields/icon_text_field.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class ExpirationDateTextField extends StatefulWidget {
  final DateTimeController controller;
  final String? Function(DateTime?)? validator;
  const ExpirationDateTextField(
      {super.key, required this.controller, this.validator});

  @override
  State<ExpirationDateTextField> createState() =>
      _ExpirationDateTextFieldState();
}

class _ExpirationDateTextFieldState extends State<ExpirationDateTextField> {
  final TextEditingController txtEditCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
        builder: dateFieldBuilder,
        validator: widget.validator ?? defaultValidator);
  }

  String? defaultValidator(DateTime? date) {
    if (date == null) {
      return 'שדה חובה';
    }
    return null;
  }

  Widget dateFieldBuilder(FormFieldState<DateTime> state) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () => pickDate(state),
        child: AbsorbPointer(
            child: IconTextField(
                controller: txtEditCtrl,
                validator: (_){
                  if(state.hasError){
                    return state.errorText;
                  }
                  return null;
                },
                icon: Symbols.calendar_clock,
                label: 'תוקף',
                readOnly: true)),
      );
    });
  }

  void pickDate(FormFieldState<DateTime> state) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 20)),
    );

    if (date != null) {
      widget.controller.setDate(date);
      txtEditCtrl.text = '${date.day}.${date.month}.${date.year}';
      state.didChange(date);
    }
  }
}

class DateTimeController extends ValueNotifier<DateTime?> {
  DateTimeController({DateTime? initialDate}) : super(initialDate);

  void setDate(DateTime date) {
    value = date;
  }

  void clear() {
    value = null;
  }
}
