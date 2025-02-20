import 'package:cardy/ui/widgets/gradient_button.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/text_fields/item_type_auto_complete_text_field.dart';
import 'package:flutter/material.dart';

abstract class AddItemScreen extends StatefulWidget {
  final String title;

  const AddItemScreen({
    super.key,
    required this.title,
  });

  List<Widget> initformFields();
  
  void sumbitForm(GlobalKey<FormState> formKey, BuildContext context);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  late List<Widget> _formFields;

  @override
  void initState() {
    _formFields = widget.initformFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final padding =
        const EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING);

    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: BackAppBar(title: widget.title),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: SPACING_L),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: SPACING_M,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: SPACING_S,
                      children: _formFields.map((field) {
                        return Padding(
                          padding: field is ItemTypeAutoCompleteTextField
                              ? EdgeInsets.all(0)
                              : padding,
                          child: field,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: SCREEN_HORIZONTAL_PADDING),
                  child: GradientButton(
                      label: 'הוסף',
                      borderRadius: 30,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          widget.sumbitForm(_formKey, context);
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
