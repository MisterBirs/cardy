import 'package:cardy/entities/categories/categories.dart';
import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/categories/category_key.dart';
import 'package:cardy/entities/payments_methods/item_type_entity.dart';
import 'package:cardy/entities/payments_methods/multi_redemtion_item_type.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
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
            FilterBar(stores: widget.itemType.storesToRedeem, onFiltered: (categoryKey) {
              setState(() {
                selectedCategoryKey = categoryKey;
              });
            }),
            storesGrid(filteredstores)
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

  Widget get searchBoxWarpper {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SCREEN_HORIZONTAL_PADDING, vertical: 30),
      child: SearchBox(),
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
          itemBuilder: (context, index) =>
              ItemTile.type(stores[index]),
        ),
      ),
    );
  }
}

class FilterBar extends StatefulWidget {
  final List<StoreEntity> stores;
  final void Function(CategoryKey) onFiltered;

  const FilterBar({
    super.key,
    required this.stores,
    required this.onFiltered,
  });

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  CategoryKey selectedCategoryKey = CategoryKey.all;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              spacing: 5,
              children: primaryCategories.map((category) {
                return FilterButton(
                  category,
                  isSelected: selectedCategoryKey == category.key,
                  onTap: (categoryKey) {
                    setState(() {
                      selectedCategoryKey = categoryKey;
                      widget.onFiltered(categoryKey);
                    });
                  },
                );
              }).toList()),
        )
      ],
    );
  }

  List<CategoryEntity> get primaryCategories {
    Set<CategoryEntity> categories = {
      Categories.instance.getCategory(CategoryKey.all)!
    };

    for (var store in widget.stores) {
      final List<CategoryEntity> primaryCategories = store.categories
          .map((category) => category.topParentCategory)
          .toList();

      categories.addAll(primaryCategories);
    }

    return categories.toList();
  }
}

class FilterButton extends StatelessWidget {
  final CategoryEntity category;
  final bool isSelected;
  final void Function(CategoryKey) onTap;
  const FilterButton(this.category,
      {super.key, required this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(category.key),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration:
            isSelected ? selectedBoxDecoration : unselectedBoxDecoration,
        child: Row(
          children: [
            Text(category.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:
                        isSelected ? selectedTextColor : unselectedTextColor)),
            SizedBox(width: 5),
            Icon(category.icon,
                color: isSelected ? selectedTextColor : unselectedTextColor),
          ],
        ),
      ),
    );
  }

  Color get selectedTextColor => Colors.white;

  Color get unselectedTextColor => TEXT_COLOR_1;

  BoxDecoration get selectedBoxDecoration {
    return baseBoxDecoration.copyWith(gradient: GRADIENT_COLOR);
  }

  BoxDecoration get unselectedBoxDecoration {
    return baseBoxDecoration.copyWith(
      color: Colors.transparent,
      border: Border.all(color: TEXT_COLOR_1, width: 2),
    );
  }

  BoxDecoration get baseBoxDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(50),
    );
  }
}
