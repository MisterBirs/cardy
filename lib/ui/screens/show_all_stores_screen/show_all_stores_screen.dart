import 'package:cardy/entities/payment_methods/multi_stores_payment_method_entity.dart';
import 'package:cardy/ui/screens/items_grid_screen.dart';
import 'package:cardy/ui/widgets/item_tiles/grid_tiles/item_grid_custom_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/core/ui_constants.dart';
import 'package:flutter/material.dart';

class ShowAllStoresScreen extends StatelessWidget {
  final MultiStoresBrandEntity itemType;
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
      items: itemType.redeemableStores.map((store) {
        return ItemGridCustomTile(
            alias: store.aliases,
            categories: store.categories,
            tile: ItemTile.type(store));
      }).toList(),
    );
  }
}
