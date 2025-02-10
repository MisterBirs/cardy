import 'package:cardy/ui/widgets/item_tiles/item_grid_tile.dart';
import 'package:flutter/material.dart';

class ItemGridCustomTile extends ItemGridTile {
  final Widget _tile;

  const ItemGridCustomTile({
    super.key,
    required super.alias,
    super.amount,
    required super.categories,
    required Widget tile,
  }) : _tile = tile;

  @override
  Widget build(BuildContext context) {
    return _tile;
  }

  Widget get tile => _tile;
}
