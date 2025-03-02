// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cardy/data/brads_data.dart';
import 'package:cardy/entities/payment_methods/brand_entity.dart';
import 'package:cardy/ui/screens/add_item_screen/add_item_screen.dart';
import 'package:cardy/ui/widgets/text_fields/amount_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/code_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/cvv_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/expiration_date_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/brand_auto_complete_text_field.dart';
import 'package:flutter/material.dart';

class AddGiftCardScreen extends AddItemScreen {
  late final ItemTypeFormController _itemTypeController;
  late final TextEditingController _cardNumberController;
  late final DateTimeController _expirationDateController;
  late final TextEditingController _cvvController;
  late final DoubleFormController _amountController;

  AddGiftCardScreen({super.key}) : super(title: 'גיפטקארד חדש');

  @override
  List<Widget> initformFields() {
     _itemTypeController = ItemTypeFormController();
    _cardNumberController = TextEditingController();
    _expirationDateController = DateTimeController();
    _cvvController = TextEditingController();
    _amountController = DoubleFormController();

    final itemTypeField = BrandsAutoCompleteTextField<BrandEntity>(
        controller: _itemTypeController,
        itemsTypes: BrandsData.instance.allBrandsMap.values.toList());

    final cardNumberField =
        CodeTextField(controller: _cardNumberController, label: 'מספר כרטיס');

    final expirationDateField = ExpirationDateTextField(
      controller: _expirationDateController,
    );

    final cvvField = CvvTextField(cvvController: _cvvController);

    final amountField = AmountTextField(amountController: _amountController);

    return [
      itemTypeField,
      cardNumberField,
      expirationDateField,
      cvvField,
      amountField,
    ];
  }

  @override
  void sumbitForm(GlobalKey<FormState> formKey, BuildContext context) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    final BrandEntity itemType = _itemTypeController.value!;
    final String cardNumber = _cardNumberController.text;
    final expirationDate = _expirationDateController.value!;
    final String cvv = _cvvController.text;
    final double amount = _amountController.value!;


    // final newGiftCard = GiftCardEntity(
    //   typeId: itemType.id,
    //   type: itemType as GiftCardTypeEntity,
    //   code: cardNumber,
    //   initialAmount: amount,
    //   balance: amount,
    //   addTime: DateTime.now(),
    //   expirationDate: expirationDate,
    //   cvv: cvv,
    // );

    Navigator.of(context).pop();

    // ScaffoldMessenger.of(context)
    //     .showSnackBar(ItemAddedSuccessfullySnackBar(newGiftCard));
  }
}
