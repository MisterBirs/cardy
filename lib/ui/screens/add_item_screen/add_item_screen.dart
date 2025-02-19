import 'package:cardy/data/payments_methods_data.dart';
import 'package:cardy/ui/widgets/text_fields/code_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/expiration_date_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/icon_text_field.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/text_fields/item_type_auto_complete_text_field.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class AddItemScreen extends StatefulWidget {
  final String title;
  const AddItemScreen({super.key, required this.title});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController _giftCardTypeController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationDateController =
      TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: BackAppBar(title: widget.title),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: SPACING_L),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  spacing: SPACING_S,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ItemTypeAutoCompleteTextField(
                          itemsTypes: PaymentsMethodsData
                              .instance.giftcards.values
                              .toList()),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: SCREEN_HORIZONTAL_PADDING),
                        child: CodeTextField(
                            controller: _cardNumberController,
                            label: 'מספר כרטיס')),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: SCREEN_HORIZONTAL_PADDING),
                      child: ExpirationDateTextField(
                          controller: _expirationDateController),
                    ),
                    // IconTextField(
                    //     icon: Icons.password,
                    //     controller: _cvvController,
                    //     hintText: 'cvv'),
                    // IconTextField(
                    //     icon: CardyIcons.shekel,
                    //     controller: _amountController,
                    //     hintText: 'סכום'),
                  ],
                ),
              ),
              // GradientButton(label: 'הוסף', borderRadius: 30, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
