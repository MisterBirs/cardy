import 'package:cardy/data/user_items_data.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/entities/payments_methods/store_summary_entity.dart';
import 'package:cardy/ui/screens/store_screen.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:flutter/material.dart';

class StoreBalanceTile extends StatelessWidget {
  final StoreEntity store;
  final double balance;
  final double width;
  final double height;

  const StoreBalanceTile({
    super.key,
    required this.store,
    required this.balance,
    this.width = BASE_ITEM_TILE_SIZE,
    this.height = BASE_ITEM_TILE_SIZE + 30,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          final storeSummary = UserItemsData.instance.userStores[store.id]!;
          return StoreScreen(storeSummary);
        }));
      },
      child: Center(
        child: Container(
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
                store,
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
                    '₪${balance.toInt().toString()}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
