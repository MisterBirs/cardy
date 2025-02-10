import 'package:cardy/data/user_items_data.dart';
import 'package:cardy/entities/user_items/item_entity.dart';
import 'package:cardy/ui/screens/item_screen/item_details_screen.dart';
import 'package:cardy/ui/screens/items_grid_screen.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/screens/home_screen/home_screen_widgets/items_list.dart';
import 'package:cardy/ui/screens/home_screen/home_screen_widgets/home_screen_app_bar.dart';
import 'package:cardy/ui/widgets/item_tiles/item_balance_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/item_grid_balance_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/item_grid_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        appBar: HomeScreenAppBar(),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              TotalBalanceTitle(),
              Items(),
            ],
          ),
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        createItemsList(
            'גיפטקארדים', UserItemsData.instance.giftcards.values.toList()),
        createItemsList('כרטיסים נטענים',
            UserItemsData.instance.reloadableCards.values.toList()),
        createItemsList(
            'קופונים', UserItemsData.instance.coupons.values.toList()),
        createItemsList(
            'זיכויים', UserItemsData.instance.credits.values.toList()),
      ],
    );
  }

  Widget createItemsList(String label, List<ItemEntity> items) {
    return Builder(builder: (context) {
      return ItemsList(
          label: label,
          items: items,
          onTapShowAll: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ItemsGridScreen(
                    appBar: BackAppBar(title: label),
                    itemWidth: BASE_ITEM_TILE_SIZE,
                    itemHeight: BASE_ITEM_TILE_SIZE + 30,
                    maxItemsInRow: 3,
                    items: items.map((item) {
                      return ItemGridBalanceTile(item);
                    }).toList())));
          });
    });
  }
}

class TotalBalanceTitle extends StatelessWidget {
  const TotalBalanceTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final balance = UserItemsData.instance.getTotalBalance().toInt();

    return Center(
      child: Column(
        children: [
          Text(
            'יתרה כוללת',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            '₪$balance',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
