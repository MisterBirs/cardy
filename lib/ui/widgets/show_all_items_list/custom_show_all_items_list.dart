import 'dart:core';
import 'package:cardy/ui/screens/items_grid_screen.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/item_tiles/grid_tiles/base_item_grid_tile.dart';
import 'package:flutter/material.dart';

class CustomShowAllItemsList extends StatelessWidget {
  final String label;
  final PreferredSizeWidget gridScreenAppBar;
  final double spacing;
  final double height;
  final List<Widget> listTiles;
  final List<BaseItemGridTile> gridTiles;
  final double gridTileWidth;
  final double gridTileHeight;
  final void Function()? onTapShowAll;

  const CustomShowAllItemsList({
    super.key,
    required this.label,
    required this.gridScreenAppBar,
    this.spacing = SPACING_M,
    this.height = BASE_ITEM_TILE_SIZE + SPACING_S,
    required this.listTiles,
    required this.gridTiles,
    this.gridTileWidth = BASE_ITEM_TILE_SIZE,
    this.gridTileHeight = BASE_ITEM_TILE_SIZE,
    this.onTapShowAll,
  });

  void addSpacingToHeadAndTile() {
    final spacingBox = SizedBox(width: spacing);
    listTiles.insert(0, spacingBox);
    listTiles.add(spacingBox);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        listLabels,
        itemsList,
      ],
    );
  }

  Widget get listLabels {
    return Builder(builder: (context) {
      return Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
        child: Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Spacer(),
            TextButton(
              onPressed:
                  onTapShowAll ?? () => navigateToItemsGridScreen(context),
              child: Text(
                'הצג הכל',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            )
          ],
        ),
      );
    });
  }

  void navigateToItemsGridScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ItemsGridScreen(
        appBar: gridScreenAppBar,
        itemWidth: gridTileWidth,
        itemHeight: gridTileHeight,
        maxItemsInRow: 3,
        items: gridTiles,
      ),
    ));
  }

  Widget get itemsList {
    return SizedBox(
      height: height, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listTiles.length,
        itemBuilder: (context, index) {
          final isLast = index == listTiles.length - 1;

          return Padding(
            padding: isLast
                ? EdgeInsets.symmetric(
                    horizontal:
                        spacing) // Add spacing to the left of the last item
                : EdgeInsets.only(right: spacing),
            child: listTiles[index],
          );
        },
      ),
    );
  }
}
