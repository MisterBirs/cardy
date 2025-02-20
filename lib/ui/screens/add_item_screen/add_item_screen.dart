import 'package:cardy/data/payments_methods_data.dart';
import 'package:cardy/entities/payments_methods/gift_card_type_entity.dart';
import 'package:cardy/entities/payments_methods/item_type_entity.dart';
import 'package:cardy/entities/user_items/gift_card_entity.dart';
import 'package:cardy/entities/user_items/item_entity.dart';
import 'package:cardy/entities/user_items/items_group_enum.dart';
import 'package:cardy/ui/screens/add_item_screen/widgets/item_added_successfully_snack_bar.dart';
import 'package:cardy/ui/widgets/gradient_button.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:cardy/ui/widgets/text_fields/amount_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/code_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/cvv_text_field.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/text_fields/expiration_date_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/item_type_auto_complete_text_field.dart';
import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  final String title;
  final List<Widget> formFields;
  final void Function(GlobalKey<FormState> key) onSubmit;
  const AddItemScreen({
    super.key,
    required this.title,
    required this.formFields,
    required this.onSubmit,
  });

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();

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
                      children: widget.formFields.map((field) {
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
                          widget.onSubmit(_formKey);
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
