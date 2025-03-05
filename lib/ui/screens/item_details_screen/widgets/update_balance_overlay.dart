import 'package:cardy/data/brads_data.dart';
import 'package:cardy/entities/payment_methods/brand_entity.dart';
import 'package:cardy/entities/payment_methods/enums.dart';
import 'package:cardy/ui/widgets/gradient_button.dart';
import 'package:cardy/ui/widgets/overlay_builder.dart';
import 'package:cardy/ui/widgets/text_fields/amount_text_field.dart';
import 'package:cardy/ui/widgets/text_fields/brand_auto_complete_text_field.dart';
import 'package:flutter/material.dart';

class UpdateBalanceOverlay {
  static final UpdateBalanceOverlay _instance =
      UpdateBalanceOverlay._privateConstructor();

  UpdateBalanceOverlay._privateConstructor();

  factory UpdateBalanceOverlay.instance() {
    return _instance;
  }

  void show(BuildContext context) {
    DoubleFormController amountController = DoubleFormController();
    BrandController storeController = BrandController();

    OverlayBuilder(builder: (closeOverlay) {
      final radius = 15.0;

      return LayoutBuilder(builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                Padding(
                  padding: EdgeInsets.all(radius),
                  child: Column(
                    spacing: 10,
                    children: [
                      title,
                      SizedBox(height: 10),
                      AmountTextField(amountController: amountController),
                      storesField(storeController),
                    ],
                  ),
                ),
                buttonsRow(closeOverlay),
              ],
            ),
          ),
        );
      });
    }).show(context);
  }

  Widget get title {
    return Builder(builder: (context) {
      return Text('עדכון יתרה',
          style: Theme.of(context).textTheme.headlineMedium);
    });
  }

  BrandsAutoCompleteTextField<BrandEntity> storesField(
      BrandController storeController) {
    return BrandsAutoCompleteTextField<BrandEntity>(
        label: 'חנות',
        icon: Icons.store,
        itemsTypes: _stores,
        controller: storeController,
        maxOptionsCount: 3);
  }

  Row buttonsRow(closeOverlay) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: updateButton,
        ),
        TextButton(onPressed: closeOverlay, child: Text('סגור'))
      ],
    );
  }

  GradientButton get updateButton {
    return GradientButton(
         label: 'עדכן',
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), bottomRight: Radius.circular(15)),
        onPressed: () {
          // Do something
        });
  }

  final List<BrandEntity> _stores =
      BrandsData.instance.brandsMap[BrandTypesEnum.store]!.values.toList();
}
