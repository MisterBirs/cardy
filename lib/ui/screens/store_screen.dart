import 'package:cardy/entities/payment_methods/multi_stores_payment_method_entity.dart';
import 'package:cardy/entities/payment_methods/payment_item_entity.dart';
import 'package:cardy/entities/payment_methods/store_summary_entity.dart';
import 'package:cardy/entities/payment_methods/enums.dart';
import 'package:cardy/ui/screens/item_details_screen/item_details_screen.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/item_tiles/grid_tiles/item_grid_custom_tile.dart';
import 'package:cardy/ui/widgets/show_all_items_list/show_all_items_list.dart';
import 'package:cardy/ui/widgets/app_bars/back_add_app_bar.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/item_tiles/base_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:cardy/ui/widgets/show_all_items_list/custom_show_all_items_list.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  final StoreSummaryEntity storeSummary;
  const StoreScreen(this.storeSummary, {super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
          appBar: BackAddAppBar(title: storeSummary.store.name, onAdd: () {}),
          body: Padding(
            padding: const EdgeInsets.only(top: PADDING_FROM_TOP_SCREEN),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                balanceTitle,
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: SPACING_L),
                      child: itemsLists,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget get itemsLists {
    return Column(
      spacing: SPACING_M,
      children: storeSummary.itemsGroupsMap.entries
          .where((itemsGroupEntry) => itemsGroupEntry.value.isNotEmpty)
          .map((itemsGroupEntry) {
        final isMultiRedemtion =
            itemsGroupEntry.value.first.brand is MultiStoresBrandEntity;

        final String label = itemsGroupEntry.key.pluralDisplayName;
        final List<PaymentItemEntity> items = itemsGroupEntry.value;

        return isMultiRedemtion
            ? _imageItemsList(label, items, () {})
            : _noImageitemsList(label, items, () {});
      }).toList(),
    );
  }

  ShowAllItemsList _imageItemsList(
      String label, List<PaymentItemEntity> items, void Function() onAdd) {
    return ShowAllItemsList(
      label: label,
      gridScreenAppBar: BackAppBar(
          title: storeSummary.store.name, subtitle: label, onAdd: () {}),
      items: items,
    );
  }

  CustomShowAllItemsListView _noImageitemsList(
      String label, List<PaymentItemEntity> items, void Function() onAdd) {
    return CustomShowAllItemsListView(
      label: label,
      gridScreenAppBar: BackAppBar(
          title: storeSummary.store.name, subtitle: label, onAdd: onAdd),
      listTiles: items.map((item) => buildNoImageItemTile(item)).toList(),
      gridTiles: items
          .map((item) => ItemGridCustomTile(
                tile: buildNoImageItemTile(item),
                alias: item.brand.aliases,
                categories: item.brand.categories,
                balance: item.balance,
              ))
          .toList(),
    );
  }

  Widget buildNoImageItemTile(PaymentItemEntity item) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemDetailsScreen(
                      item: item,
                    ))),
        child: BaseTile(
          child: Text('₪${item.balance.toString()}'),
        ),
      );
    });
  }

  Widget get balanceTitle {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text('סה"כ יתרה',
                  style: Theme.of(context).textTheme.displayLarge),
              Text('₪${storeSummary.totalBalance.toInt().toString()}',
                  style: Theme.of(context).textTheme.displayMedium),
            ],
          ),
          ItemTile.type(storeSummary.store, size: BIG_ITEM_TILE_SIZE),
        ],
      );
    });
  }
}
