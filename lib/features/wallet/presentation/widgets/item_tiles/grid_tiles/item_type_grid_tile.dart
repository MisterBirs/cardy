import 'package:cardy/features/wallet/domain/entities/payment_methods/brand_entity.dart';
import 'package:cardy/features/wallet/presentation/widgets/item_tiles/grid_tiles/base_item_grid_tile.dart';
import 'package:cardy/features/wallet/presentation/widgets/item_tiles/item_tile.dart';
import 'package:flutter/material.dart';

class ItemTypeGridTile extends BaseItemGridTile {
  final BrandEntity _itemType;

  ItemTypeGridTile(BrandEntity itemType, {super.key})
      : _itemType = itemType,
        super(
          alias: itemType.aliases,
          categories: itemType.categories,
        );

  @override
  Widget build(BuildContext context) {
    return ItemTile.type(itemType);
  }

  BrandEntity get itemType => _itemType;
}
