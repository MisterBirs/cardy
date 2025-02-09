import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/categories/category_key.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/entities/payments_methods/store_summary_entity.dart';
import 'package:cardy/ui/widgets/item_tiles/item_balance_tile.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/filter_bar.dart';
import 'package:cardy/ui/widgets/search_box.dart';
import 'package:flutter/material.dart';

class StoresScreen extends StatefulWidget {
  final Map<String, StoreSummaryEntity> stores;
  const StoresScreen(this.stores, {super.key});

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  String _searchValue = '';
  CategoryKey selectedCategoryKey = CategoryKey.all;
  @override
  Widget build(BuildContext context) {
    final List<StoreEntity> stores =
        widget.stores.values.map((e) => e.store).toList();

    return Background(
      child: Scaffold(
        appBar: const BackAppBar(title: 'חנויות', showBackButton: false,),
        body: Column(
          children: [
            _searchBoxWarpper,
            _filterBar(stores),
            Expanded(child: storesGrid(_storesForShow))
          ],
        ),
      ),
    );
  }

  List<StoreSummaryEntity> get _storesForShow {
    List<StoreEntity> stores =
        widget.stores.values.map((storeSummary) => storeSummary.store).toList();
    stores = CategoryEntity.filterStoresByKey(
        stores, selectedCategoryKey, _searchValue);
    return stores.map((store) => widget.stores[store.id]!).toList();
  }

  FilterBar _filterBar(List<StoreEntity> stores) => FilterBar(
      stores: stores,
      onFiltered: (value) {
        setState(() {
          selectedCategoryKey = value;
        });
      });

  Widget get _searchBoxWarpper {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: SCREEN_HORIZONTAL_PADDING, vertical: 30),
      child: SearchBox(onSearch: (value) {
        setState(() {
          _searchValue = value;
        });
      }),
    );
  }

  Widget storesGrid(List<StoreSummaryEntity> stores) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tileWidth = screenWidth * 0.28;
    final tileHeight = tileWidth * 1.3;
    final columnsCount = 3;
    final columnsSpacing = 10.0;
    final horizontalPadding =
        (screenWidth - (3 * tileWidth) - (columnsCount * columnsSpacing)) / 2;

    return Builder(builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
            left: horizontalPadding, right: horizontalPadding, top: 30),
        child: GridView.builder(
          itemCount: stores.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnsCount,
            crossAxisSpacing: columnsSpacing,
            mainAxisSpacing: columnsSpacing,
            childAspectRatio: tileWidth / tileHeight,
          ),
          itemBuilder: (context, index) => ItemBalanceTile(
              width: tileWidth,
              height: tileHeight,
              store: stores[index].store,
              balance: stores[index].totalBalance),
        ),
      );
    });
  }
}
