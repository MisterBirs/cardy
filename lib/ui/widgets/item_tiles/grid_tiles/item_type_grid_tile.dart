import 'package:cardy/entities/payment_methods/payment_method_entity.dart';
import 'package:cardy/ui/widgets/item_tiles/grid_tiles/base_item_grid_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:flutter/material.dart';

class ItemTypeGridTile extends BaseItemGridTile {
  final PaymentMethodEntity _itemType;

  ItemTypeGridTile(PaymentMethodEntity itemType, {super.key})
      : _itemType = itemType,
        super(
          alias: itemType.aliases,
          categories: itemType.categories,
        );

  @override
  Widget build(BuildContext context) {
    return ItemTile.type(itemType);
  }

  PaymentMethodEntity get itemType => _itemType;
}
