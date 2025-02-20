import 'package:cardy/data/payments_methods_data.dart';
import 'package:cardy/entities/payments_methods/item_type_entity.dart';
import 'package:cardy/entities/user_items/gift_card_entity.dart';
import 'package:cardy/ui/widgets/gradient_button.dart';
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
  const AddItemScreen({super.key, required this.title});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final ItemTypeFormController _itemTypeController = ItemTypeFormController();
  final TextEditingController _cardNumberController = TextEditingController();
  final DateTimeController _expirationDateController = DateTimeController();
  final TextEditingController _cvvController = TextEditingController();
  final DoubleFormController _amountController = DoubleFormController();

  void _sumbitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final ItemTypeEntity itemType = _itemTypeController.value!;
    final String cardNumber = _cardNumberController.text;
    final expirationDate = _expirationDateController.value!;
    final String cvv = _cvvController.text;
    final double amount = _amountController.value!;

    final newGiftCard = GiftCardEntity(
      typeId: itemType.id,
      type: itemType,
      code: cardNumber,
      initialAmount: amount,
      balance: amount,
      addTime: DateTime.now(),
      expirationDate: expirationDate,
      cvv: cvv,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Center(child: Text('הגיפטקארד נוסף בהצלחה'))),
    );
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
                      children: [
                        ItemTypeAutoCompleteTextField(
                            controller: _itemTypeController,
                            itemsTypes: PaymentsMethodsData
                                .instance.giftcards.values
                                .toList()),
                        Padding(
                            padding: padding,
                            child: CodeTextField(
                                controller: _cardNumberController,
                                label: 'מספר כרטיס')),
                        Padding(
                          padding: padding,
                          child: ExpirationDateTextField(
                            controller: _expirationDateController,
                          ),
                        ),
                        Padding(
                          padding: padding,
                          child: CvvTextField(cvvController: _cvvController),
                        ),
                        Padding(
                          padding: padding,
                          child: AmountTextField(
                              amountController: _amountController),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: SCREEN_HORIZONTAL_PADDING),
                  child: GradientButton(
                      label: 'הוסף', borderRadius: 30, onPressed: _sumbitForm),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
