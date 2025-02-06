import 'package:cardy/entities/categories/categories.dart';
import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/categories/category_key.dart';
import 'package:cardy/entities/payments_methods/item_type_entity.dart';
import 'package:cardy/entities/payments_methods/multi_redemtion_item_type.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/ui/widgets/filter_bar.dart';
import 'package:cardy/ui/widgets/item_tile.dart';
import 'package:cardy/ui/widgets/search_box.dart';
import 'package:cardy/ui/widgets/back_two_titles_app_bar.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:flutter/material.dart';

class ShowAllStoresScreen extends StatefulWidget {
  final MultiRedemtionItemType itemType;
  const ShowAllStoresScreen(this.itemType, {super.key});

  @override
  State<ShowAllStoresScreen> createState() => _ShowAllStoresScreenState();
}

class _ShowAllStoresScreenState extends State<ShowAllStoresScreen> {
  CategoryKey selectedCategoryKey = CategoryKey.all;
  String _searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: BackTwoTitlesAppBar(
          title: 'חנויות למימוש',
          subtitle: widget.itemType.name.toUpperCase(),
        ),
        body: Column(
          children: [
            searchBoxWarpper,
            FilterBar(
                stores: widget.itemType.storesToRedeem,
                onFiltered: (categoryKey) {
                  setState(() {
                    selectedCategoryKey = categoryKey;
                  });
                }),
            storesGrid(_storesForShow)
          ],
        ),
      ),
    );
  }

  List<StoreEntity> get filteredstores {
    if (selectedCategoryKey == CategoryKey.all) {
      return widget.itemType.storesToRedeem;
    }

    return widget.itemType.storesToRedeem
        .where((store) => store.categories
            .map((category) => category.topParentCategory.key)
            .contains(selectedCategoryKey))
        .toList();
  }

  List<StoreEntity> get _storesForShow {
    return filteredstores
        .where((store) => store.aliases
            .where((alias) =>
                alias.toLowerCase().contains(_searchValue.toLowerCase()))
            .isNotEmpty)
        .toList();
  }

  Widget get searchBoxWarpper {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SCREEN_HORIZONTAL_PADDING, vertical: 30),
      child: SearchBox(onSearch: (value) {
        setState(() {
          _searchValue = value;
        });
      }),
    );
  }

  Widget storesGrid(List<StoreEntity> stores) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(SCREEN_HORIZONTAL_PADDING),
        child: GridView.builder(
          itemCount: stores.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) => ItemTile.type(stores[index]),
        ),
      ),
    );
  }
}
