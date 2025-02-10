import 'package:cardy/entities/payments_methods/multi_redemtion_item_type.dart';
import 'package:cardy/ui/screens/items_grid_screen.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile_builder.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class ShowAllStoresScreen extends StatelessWidget {
  final MultiRedemtionItemType itemType;
  const ShowAllStoresScreen(this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return ItemsGridScreen(
      itemWidth: BASE_ITEM_TILE_SIZE,
      itemHeight: BASE_ITEM_TILE_SIZE,
      appBar: BackAppBar(
        title: 'חנויות למימוש',
        subtitle: itemType.name.toUpperCase(),
      ),
      items: itemType.storesToRedeem.map((store) {
        return ItemTileBuilder(
            alias: store.aliases,
            categories: store.categories,
            tile: ItemTile.type(store));
      }).toList(),
    );
  }
}
