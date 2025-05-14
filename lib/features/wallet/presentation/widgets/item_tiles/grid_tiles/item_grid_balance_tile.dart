import 'package:cardy/features/brands/domain/entities/payment_item_entity.dart';
import 'package:cardy/features/wallet/presentation/screens/item_details_screen/item_details_screen.dart';
import 'package:cardy/features/wallet/presentation/widgets/item_tiles/item_balance_tile.dart';
import 'package:cardy/features/wallet/presentation/widgets/item_tiles/grid_tiles/base_item_grid_tile.dart';
import 'package:flutter/material.dart';

class ItemGridBalanceTile extends BaseItemGridTile {
  final PaymentItemEntity _item;
  
  ItemGridBalanceTile(PaymentItemEntity item, {super.key})
      : _item = item,
        super(
          alias: item.brand.aliases,
          balance: item.balance,
          categories: item.brand.categories,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemDetailsScreen(
              item: item,
            ),
          ),
        );
      },
      child: ItemBalanceTile(itemType: item.brand, balance: item.balance),
    );
  }

  PaymentItemEntity get item => _item;
}
