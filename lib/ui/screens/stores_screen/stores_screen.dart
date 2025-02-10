import 'package:cardy/entities/payments_methods/store_summary_entity.dart';
import 'package:cardy/ui/screens/base_show_all_screen.dart';
import 'package:cardy/ui/screens/store_screen.dart';
import 'package:cardy/ui/widgets/item_tiles/item_balance_tile.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile_builder.dart';
import 'package:flutter/material.dart';

class StoresScreen extends StatelessWidget {
  final Map<String, StoreSummaryEntity> stores;
  const StoresScreen(this.stores, {super.key});

  @override
  Widget build(BuildContext context) {
    return ItemsGridScreen(
        appBar: const BackAppBar(
          title: 'חנויות',
          showBackButton: false,
        ),
        items: stores.values.map((storeSummary) {
          return ItemTileBuilder(
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
        itemHeight: BASE_ITEM_TILE_SIZE + 30);
  }
}
