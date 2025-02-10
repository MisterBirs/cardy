import 'package:cardy/entities/user_items/item_entity.dart';
import 'package:cardy/ui/screens/item_screen/item_details_screen.dart';
import 'package:cardy/ui/widgets/item_tiles/item_balance_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/item_grid_tile.dart';
import 'package:flutter/material.dart';

class ItemGridBalanceTile extends ItemGridTile {
  final ItemEntity _item;
  ItemGridBalanceTile(ItemEntity item, {super.key})
      : _item = item,
        super(
          alias: item.type.aliases,
          amount: item.balance,
          categories: item.type.categories,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemDetailsScreen(
              item: item,
            ),
          ),
        );
      },
      child: ItemBalanceTile(
        itemType: item.type, balance: item.balance),
    );
  }

  ItemEntity get item => _item;
}
