import 'package:cardy/core/presentation/ui_constants.dart';
import 'package:cardy/features/categories/data/categories.dart';
import 'package:cardy/features/categories/domain/entites/category_entity.dart';
import 'package:cardy/features/categories/domain/category_key.dart';
import 'package:cardy/core/presentation/widgets/background.dart';
import 'package:cardy/core/presentation/widgets/filter_bar.dart';
import 'package:cardy/features/user_items/presentation/widgets/item_tiles/grid_tiles/base_item_grid_tile.dart';
import 'package:cardy/core/presentation/widgets/search_box.dart';
import 'package:flutter/material.dart';

class ItemsGridScreen extends StatefulWidget {
  final PreferredSizeWidget appBar;
  final List<BaseItemGridTile> items;
  final double itemWidth;
  final double itemHeight;
  final double gridSpacing;
  final double bottomPadding;
  final int maxItemsInRow;
  final bool primaryCategoriesOnly;
  final CategoryKey? category;

  const ItemsGridScreen({
    super.key,
    this.category,
    required this.appBar,
    required this.items,
    required this.itemWidth,
    required this.itemHeight,
    this.primaryCategoriesOnly = true,
    this.maxItemsInRow = 3,
    this.gridSpacing = SPACING_S,
    this.bottomPadding = SPACING_M,
  });

  @override
  State<ItemsGridScreen> createState() => _ItemsGridScreenState();
}

class _ItemsGridScreenState extends State<ItemsGridScreen> {
  CategoryKey _selectedCategoryKey = CategoryKey.all;
  String _searchValue = '';

  @override
  Widget build(BuildContext context) {
    final itemsForShow = _getItemsForShow();
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: widget.appBar,
        body: Column(
          spacing: SPACING_L,
          children: [
            _searchBoxWarpper,
            // Show filter bar only if there are more than 2 categories (All and another one)
            if (categories.length > 2) _filterBar,
            Expanded(
              child: GridView.builder(
                itemCount: itemsForShow.length,
                padding: EdgeInsets.only(
                  right: horizontalPadding,
                  left: horizontalPadding,
                  bottom: widget.bottomPadding,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numberOfItemsInRow,
                    mainAxisSpacing: widget.gridSpacing,
                    crossAxisSpacing: widget.gridSpacing,
                    mainAxisExtent: widget.itemHeight),
                itemBuilder: (context, index) {
                  return itemsForShow[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  int get numberOfItemsInRow {
    final screenWidth = MediaQuery.of(context).size.width;
    int possibleItemsInRow =
        (screenWidth / (widget.itemWidth + widget.gridSpacing)).floor();

    return possibleItemsInRow > widget.maxItemsInRow
        ? widget.maxItemsInRow
        : possibleItemsInRow;
  }

  double get freeWidthSpacing {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth -
        (widget.itemWidth * numberOfItemsInRow) -
        (widget.gridSpacing * (numberOfItemsInRow - 1));
  }

  double get horizontalPadding => freeWidthSpacing / 2;

  List<CategoryEntity> get categories {
    List<CategoryEntity> result =
        widget.items.expand((item) => item.categories).toSet().toList();

    if (widget.primaryCategoriesOnly) {
      result = result
          .expand((category) => category.primaryCategorirs)
          .toSet()
          .toList();
    }

    //TODO Sholud improve the code to prevent the need to remove the 'All' category
    result.removeWhere((category) => category.key == CategoryKey.all);

    if (widget.category != null) {
      result.removeWhere((category) =>
          !category.isDescendantOf(widget.category!) ||
          category.key == widget.category);
    }

    result.insert(0, Categories.instance.getCategory(CategoryKey.all)!);
    return result;
  }

  Widget get _filterBar {
    final filterBarCategories = widget.category != null
        ? categories
            .map((category) =>
                category.convertToRelationName(widget.category!))
            .toSet()
            .toList()
        : categories;

    return FilterBar(
        categories: filterBarCategories,
        onFiltered: (value) {
          setState(() {
            _selectedCategoryKey = value;
          });
        });
  }

  Widget get _searchBoxWarpper {
    return Padding(
      padding: EdgeInsets.only(
          top: PADDING_FROM_TOP_SCREEN,
          right: SCREEN_HORIZONTAL_PADDING,
          left: SCREEN_HORIZONTAL_PADDING),
      child: SearchBox(onSearch: (value) {
        setState(() {
          _searchValue = value;
        });
      }),
    );
  }

  List<BaseItemGridTile> _getFilteredItems() {
    if (_selectedCategoryKey == CategoryKey.all) {
      return widget.items;
    }

    return widget.items
        .where((item) => item.categories
            .any((category) => category.isDescendantOf(_selectedCategoryKey)))
        .toList();
  }

  List<BaseItemGridTile> _getItemsForShow() {
    return _getFilteredItems()
        .where((item) => item.alias
            .where((alias) =>
                alias.toLowerCase().contains(_searchValue.toLowerCase()))
            .isNotEmpty)
        .toList();
  }
}
