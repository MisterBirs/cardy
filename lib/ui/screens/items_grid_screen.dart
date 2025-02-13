import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/categories/category_key.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/filter_bar.dart';
import 'package:cardy/ui/widgets/item_tiles/grid_tiles/base_item_grid_tile.dart';
import 'package:cardy/ui/widgets/search_box.dart';
import 'package:flutter/material.dart';

class ItemsGridScreen extends StatefulWidget {
  final PreferredSizeWidget appBar;
  final List<BaseItemGridTile> items;
  final double itemWidth;
  final double itemHeight;
  final double gridSpacing;
  final int maxItemsInRow;

  const ItemsGridScreen({
    super.key,
    required this.appBar,
    required this.items,
    required this.itemWidth,
    required this.itemHeight,
    this.maxItemsInRow = 3,
    this.gridSpacing = 10.0,
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
          spacing: 30.0,
          children: [
            _searchBoxWarpper,
            _filterBar,
            Expanded(
              child: GridView.builder(
                itemCount: itemsForShow.length,
                padding: EdgeInsets.only(
                  right: horizontalPadding,
                  left: horizontalPadding,
                  bottom: 20.0,
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

  Widget get _filterBar {
    Set<CategoryEntity> categories =
        widget.items.expand((item) => item.categories).toSet();

    return FilterBar(
        categories: categories.toList(),
        onFiltered: (value) {
          setState(() {
            _selectedCategoryKey = value;
          });
        });
  }

  Widget get _searchBoxWarpper {
    return Padding(
      padding: EdgeInsets.only(
          top: 30.0,
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
            .map((category) => category.topParentCategory.key)
            .contains(_selectedCategoryKey))
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
