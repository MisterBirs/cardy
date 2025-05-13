import 'package:cardy/core/ui_constants.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/brand_entity.dart';
import 'package:cardy/features/wallet/presentation/widgets/item_tiles/item_tile.dart';
import 'package:flutter/material.dart';

class ItemBalanceTile extends StatelessWidget {
  final BrandEntity itemType;
  final double? balance;
  final double width;
  final double height;

  const ItemBalanceTile({
    super.key,
    required this.itemType,
    required this.balance,
    this.width = BASE_ITEM_TILE_SIZE,
    this.height = BASE_ITEM_TILE_SIZE + SPACING_L, // Add spacing for the balance label
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: CONTAINER_COLOR,
        boxShadow: SHADOW,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ItemTile.type(
            itemType,
            size: width,
            boxShadow: [],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(
                balance != null ? '₪${balance!.toStringAsFixed(1)}' : 'שובר',//sdf
             
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
