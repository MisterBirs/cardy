import 'package:cardy/entities/user_items/item_entity.dart';
import 'package:cardy/entities/user_items/items_group_enum.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:flutter/material.dart';

class ItemAddedSuccessfullySnackBar extends SnackBar {
  ItemAddedSuccessfullySnackBar(ItemEntity item, {super.key})
      : super(
          content: _buildSnackBarContent(item),
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        );

  static Widget _buildSnackBarContent(ItemEntity item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ה${item.itemGroupType.singleDisplayName} נוסף בהצלחה',
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
