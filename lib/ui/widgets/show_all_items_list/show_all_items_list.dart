import 'dart:core';

import 'package:cardy/entities/payment_methods/payment_item_entity.dart';
import 'package:cardy/entities/payment_methods/brand_entity.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/item_tiles/grid_tiles/item_type_grid_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/grid_tiles/item_grid_balance_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/grid_tiles/base_item_grid_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/item_side_balance_label_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:cardy/ui/widgets/show_all_items_list/custom_show_all_items_list.dart';
import 'package:flutter/material.dart';

class ShowAllItemsList extends StatelessWidget {
  final String label;
  final PreferredSizeWidget gridScreenAppBar;
  final double listSpacing;
  final List<PaymentItemEntity>? items;
  final List<BrandEntity>? itemsTypes;

  const ShowAllItemsList({
    super.key,
    required this.label,
    required this.gridScreenAppBar,
    this.listSpacing = SPACING_M,
    required this.items,
  }) : itemsTypes = null;

  const ShowAllItemsList.type({
    super.key,
    required this.label,
    required this.gridScreenAppBar,
    this.listSpacing = SPACING_M,
    required this.itemsTypes,
  }) : items = null;

  @override
  Widget build(BuildContext context) {
    return CustomShowAllItemsListView(
      label: label,
      listTiles: listTiles,
      spacing: listSpacing,
      gridScreenAppBar: gridScreenAppBar,
      gridTiles: gridTiles,
      gridTileWidth: gridTileWidth,
      gridTileHeight: gridTileHeight,
    );
  }

  bool get isType {
    return itemsTypes != null;
  }

  BrandEntity get type {
    return isType ? itemsTypes!.first : items!.first.paymentMethod;
  }

  List<Widget> get listTiles {
    return isType
        ? itemsTypes!.map((itemType) => ItemTile.type(itemType)).toList()
        : items!.map((item) => ItemSideBalanceLabelTile(item: item)).toList();
  }

  List<BaseItemGridTile> get gridTiles {
    return isType
        ? itemsTypes!.map((itemType) => ItemTypeGridTile(itemType)).toList()
        : items!.map((item) => ItemGridBalanceTile(item)).toList();
  }

  double get gridTileWidth =>
      type.isCard ? BASE_CARD_WIDTH : BASE_ITEM_TILE_SIZE;

  double get gridTileHeight => isType
      ? BASE_ITEM_TILE_SIZE
      : BASE_ITEM_TILE_SIZE + SPACING_L; // add spacing for balance label
}
