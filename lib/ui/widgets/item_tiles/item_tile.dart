import 'package:cardy/entities/payments_methods/item_type_entity.dart';
import 'package:cardy/entities/user_items/item_entity.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/item_tiles/base_tile.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final ItemEntity? item;
  final ItemTypeEntity itemType;
  final double size;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry margin;
  final List<BoxShadow>? boxShadow;

  ItemTile(
    this.item, {
    super.key,
    this.size = 100,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.margin = const EdgeInsets.all(0),
    this.boxShadow = SHADOW,
  }) : itemType = item!.type;

  const ItemTile.type(
    this.itemType, {
    super.key,
    this.size = 100,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.margin = const EdgeInsets.all(0),
    this.boxShadow = SHADOW,
  }) : item = null;

  @override
  Widget build(BuildContext context) {
    return BaseTile(
      size: size,
      isCard: itemType.isCard,
      margin: margin,
      boxShadow: boxShadow,
      borderRadius: borderRadius,
      child: Image.asset(itemType.imagePath, fit: BoxFit.cover),
    );
  }
}
