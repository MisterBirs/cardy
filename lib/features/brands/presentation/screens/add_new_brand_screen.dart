import 'package:cardy/features/wallet/domain/entities/categories/category_entity.dart';
import 'package:cardy/features/brands/domain/entities/brand_types_enum.dart';
import 'package:cardy/features/brands/domain/entities/multi_stores_payment_method_entity.dart';
import 'package:cardy/features/brands/presentation/widgets/add_categories_text_field.dart';
import 'package:cardy/core/presentation/ui_constants.dart';
import 'package:cardy/core/presentation/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/core/presentation/widgets/background.dart';
import 'package:cardy/core/presentation/widgets/gradient_button.dart';
import 'package:cardy/features/user_items/presentation/widgets/text_fields/icon_text_field.dart';
import 'package:cardy/features/user_items/presentation/widgets/text_fields/brand_type_text_field.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddNewBrandScreen extends StatefulWidget {
  const AddNewBrandScreen({super.key});

  @override
  State<AddNewBrandScreen> createState() => _AddNewBrandScreenState();
}

class _AddNewBrandScreenState extends State<AddNewBrandScreen> {
  final _formKey = GlobalKey<FormState>();

//#region Controllers
  TextEditingController brandNameController = TextEditingController();

  ValueNotifier<BrandTypesEnum?> brandTypeController =
      ValueNotifier<BrandTypesEnum?>(null);

  ValueNotifier<List<CategoryEntity>> categoriesController =
      ValueNotifier<List<CategoryEntity>>([]);

  bool hasCvv = false;

  //#endregionk

  @override
  void initState() {
    brandTypeController.addListener(_refreshScreen);
    super.initState();
  }

  @override
  void dispose() {
    brandTypeController.removeListener(_refreshScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: BackAppBar(title: 'הוספת חברה חדשה'),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: PADDING_FROM_TOP_SCREEN, left: 20, right: 20, bottom: 15),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: SPACING_M,
                children: [
                  Expanded(child: textFields),
                  addButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// #region Screen UI Components

  Widget get textFields {
    return SingleChildScrollView(
        child: Column(
      spacing: 10,
      children: [
        brandNameTextField,
        brandTypeTextField,
        if (brandTypeController.value != null &&
            brandTypeController.value != BrandTypesEnum.store)
          hasCvvCheckBox,
        categoriesTextField,
      ],
    ));
  }

  Widget get addButton => Builder(builder: (context) {
        return GradientButton(
          label: 'הוספה',
          onPressed: _onSubmit,
          width: MediaQuery.of(context).size.width * 0.8,
        );
      });

  //#endregion

// #region Form Fields

  Widget get categoriesTextField {
    return AddCategoriesTextField(
      controller: categoriesController,
    );
  }

  Widget get brandTypeTextField {
    return BrandTypeTextField(
        items: BrandTypesEnum.values,
        paymentMethodController: brandTypeController);
  }

  Widget get brandNameTextField {
    return IconTextField(
      icon: Icons.sell,
      label: 'שם',
      controller: brandNameController,
      validator: (name) => name == null || name.isEmpty ? 'נא הכנס שם' : null,
      keyboardType: TextInputType.text,
      maxLength: 20,
    );
  }

  Widget get hasCvvCheckBox {
    return CheckboxListTile(
      title: const Text('האם קיים CVV?'),
      value: hasCvv,
      activeColor: PRIMARY_COLOR,
      onChanged: (value) {
        setState(() {
          hasCvv = value ?? false;
        });
      },
    );
  }

//#endregion

// #region Methods
  void _refreshScreen() {
    setState(() {});
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final newBrand = MultiStoresBrandEntity(
      type: brandTypeController.value!,
      hasCvv: hasCvv,
      id: Uuid().v4(),
      name: brandNameController.text,
      aliases: [],
      imagePath: '',
      categoriesKeys: [],
      redeemableStoresIds: [],
    );

    //BrandsData.instance.addBrand(newBrand);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('המותג ${brandNameController.text} נוסף בהצלחה'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
  // #endregion
}
