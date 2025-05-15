import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:cardy/features/user_items/presentation/screens/item_details_screen/item_details_screen.dart';
import 'package:cardy/features/user_items/presentation/widgets/item_tiles/item_balance_tile.dart';
import 'package:cardy/features/user_items/presentation/widgets/item_tiles/grid_tiles/base_item_grid_tile.dart';
import 'package:flutter/material.dart';

class ItemGridBalanceTile extends BaseItemGridTile {
  final UserItemEntity _item;
  
  ItemGridBalanceTile(UserItemEntity item, {super.key})
      : _item = item,
        super(
          alias: item.brand.aliases,
          balance: item.balance,
          categories: item.brand.categories,
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
      child: ItemBalanceTile(itemType: item.brand, balance: item.balance),
    );
  }

  UserItemEntity get item => _item;
}
