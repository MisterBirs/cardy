import 'package:cardy/features/brands/domain/entities/brand_types_enum.dart';
import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:cardy/features/user_items/presentation/widgets/item_tiles/item_tile.dart';
import 'package:flutter/material.dart';

class ItemAddedSuccessfullySnackBar extends SnackBar {
  ItemAddedSuccessfullySnackBar(UserItemEntity item, {super.key})
      : super(
          content: _buildSnackBarContent(item),
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        );

  static Widget _buildSnackBarContent(UserItemEntity item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ה${item.paymentMethod.singleDisplayName} נוסף בהצלחה',
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
