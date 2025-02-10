import 'package:cardy/entities/payments_methods/store_summary_entity.dart';
import 'package:cardy/ui/widgets/app_bars/back_add_app_bar.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  final StoreSummaryEntity storeSummary;
  const StoreScreen(this.storeSummary, {super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
          appBar: BackAddAppBar(title: storeSummary.store.name, onAdd: () {}),
          body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [balanceTitle, SingleChildScrollView(
                child: Column(
                  children: [
                    //ItemsList(label: label, items: items, onTapShowAll: onTapShowAll)
                  ],
                ),
              )],
            ),
          )),
    );
  }

  Widget get balanceTitle {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text('סה"כ יתרה',
                  style: Theme.of(context).textTheme.displayLarge),
              Text('₪${storeSummary.totalBalance.toInt().toString()}',
                  style: Theme.of(context).textTheme.displayMedium),
            ],
          ),
          ItemTile.type(storeSummary.store, size: 130),
        ],
      );
    });
  }
}
