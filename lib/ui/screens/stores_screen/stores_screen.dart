import 'package:cardy/entities/payment_methods/store_summary_entity.dart';
import 'package:cardy/ui/screens/items_grid_screen.dart';
import 'package:cardy/ui/screens/store_screen.dart';
import 'package:cardy/ui/widgets/item_tiles/item_balance_tile.dart';
import 'package:cardy/core/ui_constants.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/item_tiles/grid_tiles/item_grid_custom_tile.dart';
import 'package:flutter/material.dart';

class StoresScreen extends StatelessWidget {
  final double? bottomSpacing;
  final Map<String, StoreSummaryEntity> stores;
  const StoresScreen(this.stores, {super.key, this.bottomSpacing});

  @override
  Widget build(BuildContext context) {
    return ItemsGridScreen(
        appBar: const BackAppBar(
          title: 'חנויות',
          showBackButton: false,
        ),
        bottomPadding: bottomSpacing ?? 0, //Spacing for the floating bottom bar
        items: stores.values.map((storeSummary) {
          return ItemGridCustomTile(
            alias: storeSummary.store.aliases,
            categories: storeSummary.store.categories,
            tile: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StoreScreen(storeSummary)));
              },
              child: ItemBalanceTile(
                  itemType: storeSummary.store,
                  balance: storeSummary.totalBalance),
            ),
          );
        }).toList(),
        itemWidth: BASE_ITEM_TILE_SIZE,
        itemHeight: BASE_ITEM_TILE_SIZE + SPACING_L);
  }
}
