import 'package:cardy/core/presentation/ui_constants.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:cardy/features/brands/domain/entities/store_entity.dart';
import 'package:cardy/features/user_items/presentation/widgets/item_tiles/base_tile.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final UserItemEntity? item;
  final BrandEntity itemType;
  final double size;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry margin;
  final List<BoxShadow>? boxShadow;

  ItemTile(
    this.item, {
    super.key,
    this.size = BASE_ITEM_TILE_SIZE,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.margin = const EdgeInsets.all(0),
    this.boxShadow = SHADOW,
  }) : itemType = item!.brand;

  const ItemTile.type(
    this.itemType, {
    super.key,
    this.size = BASE_ITEM_TILE_SIZE,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.margin = const EdgeInsets.all(0),
    this.boxShadow = SHADOW,
  }) : item = null;

  @override
  Widget build(BuildContext context) {
    return BaseTile(
      size: size,
      isCard: itemType is! String,
      margin: margin,
      boxShadow: boxShadow,
      borderRadius: borderRadius,
      child: Image.asset(itemType.imagePath, fit: BoxFit.cover),
    );
  }
}
