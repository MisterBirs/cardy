import 'package:cardy/entities/payment_methods/payment_item_entity.dart';
import 'package:cardy/entities/payment_methods/payment_method_type.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:flutter/material.dart';

class ItemAddedSuccessfullySnackBar extends SnackBar {
  ItemAddedSuccessfullySnackBar(PaymentItemEntity item, {super.key})
      : super(
          content: _buildSnackBarContent(item),
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        );

  static Widget _buildSnackBarContent(PaymentItemEntity item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ה${item.paymentMethod.type.singleDisplayName} נוסף בהצלחה',
        ),
        ItemTile(
          item,
          size: 40,
          borderRadius: BorderRadius.circular(2),
        ),
      ],
    );
  }
}
