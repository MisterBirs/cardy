import 'package:cardy/data/brads_data.dart';
import 'package:cardy/entities/payment_methods/brand_entity.dart';
import 'package:cardy/entities/payment_methods/multi_stores_payment_method_entity.dart';
import 'package:cardy/entities/payment_methods/payment_item_entity.dart';
import 'package:cardy/entities/payment_methods/enums.dart';
import 'package:cardy/entities/payment_methods/store_entity.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/gradient_button.dart';
import 'package:cardy/ui/widgets/text_fields/amount_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/code_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/cvv_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/brand_auto_complete_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/expiration_date_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddItemScreen extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: BackAppBar(title: 'הוספה'),
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
                        brandsAutoCompleteTextField,
                        if (shouldShowPaymentMethodField)
                          paymentMethodTextFieldWarpper,
                        if (isBrandAndPaymentMethodSelected)
                          codeTextFieldWarpper(),
                        if (isBrandAndPaymentMethodSelected)
                          expirationDateTextFieldWarpper,
                        if (shouldShowCvvField) cvvTextFieldWarpper,
                        if (isBrandAndPaymentMethodSelected)
                          amountTextFieldWarpper,
                      ],
                    ),
                  ),
                ),
                addBtn,
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
    return BrandsAutoCompleteTextField<BrandEntity>(
      itemsTypes: BrandsData.instance.allBrandsMap.values.toList(),
      controller: brandController,
    );
  }

  Widget get paymentMethodTextFieldWarpper {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
      child: CustomDropDown<PaymentMethodsEnum>(
        icon: Icons.payment,
          items: brandController.value!.type.paymentMethods,
          controller: paymentMethodController,
          itemBuilder: (item) => item.singleDisplayName,
          onChanged: (value) {}),
    );
  }

  Widget codeTextFieldWarpper() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
        child: CodeTextField(label: 'קוד', controller: codeController));
  }

  Widget get expirationDateTextFieldWarpper => Padding(
      padding: EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
      child: ExpirationDateTextField(controller: expirationDateController));

  Widget get cvvTextFieldWarpper {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
      child: CvvTextField(cvvController: TextEditingController()),
    );
  }

  Widget get amountTextFieldWarpper {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
      child: AmountTextField(amountController: DoubleFormController()),
    );
  }

  //#endregion

  Widget get addBtn {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
      child: GradientButton(
          label: 'הוסף',
          borderRadius: 30,
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
