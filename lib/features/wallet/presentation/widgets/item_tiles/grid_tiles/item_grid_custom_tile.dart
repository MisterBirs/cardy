import 'package:cardy/features/wallet/presentation/widgets/item_tiles/grid_tiles/base_item_grid_tile.dart';
import 'package:flutter/material.dart';

class ItemGridCustomTile extends BaseItemGridTile {
  final Widget _tile;

  const ItemGridCustomTile({
    super.key,
    required super.alias,
    super.balance,
    required super.categories,
    required Widget tile,
  }) : _tile = tile;

  @override
  Widget build(BuildContext context) {
    return _tile;
  }

  Widget get tile => _tile;
}
