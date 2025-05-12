import 'package:cardy/data/brads_data.dart';
import 'package:cardy/entities/payment_methods/brand_entity.dart';
import 'package:cardy/entities/payment_methods/multi_stores_payment_method_entity.dart';
import 'package:cardy/entities/payment_methods/payment_item_entity.dart';
import 'package:cardy/entities/payment_methods/enums.dart';
import 'package:cardy/entities/payment_methods/store_entity.dart';
import 'package:cardy/core/ui_constants.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/gradient_button.dart';
import 'package:cardy/ui/widgets/text_fields/amount_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/code_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/cvv_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/brand_auto_complete_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/expiration_date_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/payment_method_text_field.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddItemScreen extends StatefulWidget {
  final PaymentItemEntity? item;
  bool get isEditing => item != null;
  const AddItemScreen.add({super.key}) : item = null;
  const AddItemScreen.edit({super.key, required this.item});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();

  //#region Controllers
  BrandController brandController = BrandController();
  ValueNotifier<PaymentMethodsEnum?> paymentMethodController =
      ValueNotifier<PaymentMethodsEnum?>(null);
  TextEditingController codeController = TextEditingController();
  DateTimeController expirationDateController = DateTimeController();
  TextEditingController cvvController = TextEditingController();
  DoubleFormController amountController = DoubleFormController();
  //#endregion

  @override
  void initState() {
    brandController.addListener(refreshScreen);
    paymentMethodController.addListener(refreshScreen);
    codeController.addListener(refreshScreen);
    expirationDateController.addListener(refreshScreen);
    cvvController.addListener(refreshScreen);
    amountController.addListener(refreshScreen);
    super.initState();
  }

  @override
  void dispose() {
    brandController.removeListener(refreshScreen);
    paymentMethodController.removeListener(refreshScreen);
    codeController.removeListener(refreshScreen);
    expirationDateController.removeListener(refreshScreen);
    cvvController.removeListener(refreshScreen);
    amountController.removeListener(refreshScreen);
    super.dispose();
  }

  String get title => widget.isEditing ? 'עריכה' : 'הוספה';

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: BackAppBar(title: title),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: SCREEN_HORIZONTAL_PADDING, vertical: SPACING_L),
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
                        brandsAutoCompleteTextField,
                        if (shouldShowPaymentMethodField)
                          paymentMethodTextField,
                        if (isBrandAndPaymentMethodSelected) codeTextField,
                        if (isBrandAndPaymentMethodSelected)
                          expirationDateTextField,
                        if (shouldShowCvvField) cvvTextField,
                        if (isBrandAndPaymentMethodSelected) amountTextField,
                      ],
                    ),
                  ),
                ),
                btn,
              ],
            ),
          ),
        ),
      ),
    );
  }

//#region Showing Conditions

  bool get shouldShowCvvField {
    BrandEntity? selectedBrand = brandController.value;
    if (selectedBrand == null) {
      return false;
    }
    if (selectedBrand is MultiStoresBrandEntity && selectedBrand.hasCvv) {
      return true;
    }
    PaymentMethodsEnum? selectedPaymentMethod = paymentMethodController.value;
    if (selectedPaymentMethod == null || !selectedPaymentMethod.cvvEnabled) {
      return false;
    }
    return true;
  }

  bool get shouldShowPaymentMethodField {
    if (brandController.value == null) {
      return false;
    }
    return brandController.value!.type.paymentMethods.length > 1;
  }

  bool get isBrandAndPaymentMethodSelected {
    if (brandController.value == null) {
      return false;
    }
    if (brandController.value is StoreEntity &&
        (paymentMethodController.value == null)) {
      return false;
    }
    return true;
  }

//#endregion

  //#region Form Fields

  BrandsAutoCompleteTextField<BrandEntity> get brandsAutoCompleteTextField {
    if (widget.isEditing) {
      brandController.value = widget.item!.brand;
    }
    return BrandsAutoCompleteTextField<BrandEntity>(
      itemsTypes: BrandsData.instance.allBrandsMap.values.toList(),
      controller: brandController,
    );
  }

  Widget get paymentMethodTextField {
    if (widget.isEditing) {
      paymentMethodController.value = widget.item!.paymentMethod;
    }

    return PaymentMethodTextField(
        items: brandController.value!.type.paymentMethods,
        paymentMethodController: paymentMethodController);
  }

  Widget get codeTextField {
    if (widget.isEditing) {
      codeController.text = widget.item!.code;
    }
    return CodeTextField(label: 'קוד', controller: codeController);
  }

  Widget get expirationDateTextField {
    if (widget.isEditing) {
      expirationDateController.setDate(widget.item!.expirationDate);
    }
    return ExpirationDateTextField(controller: expirationDateController);
  }

  Widget get cvvTextField {
    if (widget.isEditing && widget.item!.cvv != null) {
      cvvController.text = widget.item!.cvv!;
    }
    return CvvTextField(cvvController: cvvController);
  }

  Widget get amountTextField {
    if (widget.isEditing && widget.item!.balance != null) {
      amountController.setValue(widget.item!.balance!);
    }
    return AmountTextField(amountController: amountController);
  }

  //#endregion

  Widget get btn {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
      child: GradientButton(
          label: widget.isEditing ? 'ערוך' : 'הוסף',
          borderRadius: BorderRadius.circular(30),
          onPressed: () {
            if (_formKey.currentState!.validate()) {}
          }),
    );
  }

  void refreshScreen() => setState(() {});

  void onSumbit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final BrandEntity itemType = brandController.value!;
    final String cardNumber = codeController.text;
    final expirationDate = expirationDateController.value!;
    final String cvv = cvvController.text;
    final double amount = amountController.value!;

    // ignore: unused_local_variable
    final PaymentItemEntity newItem = PaymentItemEntity(
      brand: itemType,
      code: cardNumber,
      expirationDate: expirationDate,
      cvv: cvv,
      balance: amount,
      initialBalance: amount,
      paymentMethod: paymentMethodController.value!,
      id: Uuid().v4(),
    );
  }
}
