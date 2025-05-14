import 'package:cardy/data/user_items_data.dart';
import 'package:cardy/features/wallet/domain/entities/categories/category_entity.dart';
import 'package:cardy/features/brands/domain/entities/store_summary_entity.dart';
import 'package:cardy/features/wallet/presentation/screens/items_grid_screen.dart';
import 'package:cardy/features/wallet/presentation/screens/store_screen.dart';
import 'package:cardy/features/wallet/presentation/widgets/item_tiles/item_balance_tile.dart';
import 'package:cardy/core/ui_constants.dart';
import 'package:cardy/features/wallet/presentation/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/features/wallet/presentation/widgets/item_tiles/grid_tiles/item_grid_custom_tile.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final double? bottomSpacing;
  final CategoryEntity category;
  const CategoryScreen(this.category, {super.key, this.bottomSpacing});

  @override
  Widget build(BuildContext context) {
    final List<StoreSummaryEntity> storeSummaries = UserItemsData.instance
        .getStoresByCategory(category.key)
        .values
        .toList();

    return ItemsGridScreen(
      category: category.key,
      primaryCategoriesOnly: false,
        appBar: BackAppBar(
          title: category.name,
          showBackButton: true,
        ),
        bottomPadding: bottomSpacing ?? 0, //Spacing for the floating bottom bar
        items: storeSummaries.map((storeSummary) {
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
