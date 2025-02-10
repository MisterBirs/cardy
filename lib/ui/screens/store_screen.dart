import 'package:cardy/entities/payments_methods/store_summary_entity.dart';
import 'package:cardy/entities/user_items/coupon_entity.dart';
import 'package:cardy/entities/user_items/credit_entity.dart';
import 'package:cardy/entities/user_items/gift_card_entity.dart';
import 'package:cardy/entities/user_items/payment_method_entity.dart';
import 'package:cardy/entities/user_items/reloadable_card_entity.dart';
import 'package:cardy/ui/screens/home_screen/home_screen_widgets/items_list.dart';
import 'package:cardy/ui/widgets/app_bars/back_add_app_bar.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/item_tiles/base_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:cardy/ui/widgets/show_all_list.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  final StoreSummaryEntity storeSummary;
  const StoreScreen(this.storeSummary, {super.key});

  @override
  Widget build(BuildContext context) {
    final coupons = storeSummary.paymentMethods
        .where((item) => item is CouponEntity)
        .toList();

    final credits = storeSummary.paymentMethods
        .where((item) => item is CreditEntity)
        .toList();

    final giftCards = storeSummary.paymentMethods
        .where((item) => item is GiftCardEntity)
        .toList();

    final reloadableCards = storeSummary.paymentMethods
        .where((item) => item is ReloadableCardEntity)
        .toList();

    return Background(
      child: Scaffold(
          appBar: BackAddAppBar(title: storeSummary.store.name, onAdd: () {}),
          body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                balanceTitle,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 20,
                      children: [
                        if (giftCards.isNotEmpty)
                          ItemsList(
                              label: 'גיפטקארדים',
                              items: giftCards,
                              onTapShowAll: () {}),
                        if (reloadableCards.isNotEmpty)
                          ItemsList(
                              label: 'כרטיסים נטענים',
                              items: reloadableCards,
                              onTapShowAll: () {}),
                        if (coupons.isNotEmpty) _itemsList('קופונים', coupons),
                        if (credits.isNotEmpty) _itemsList('שוברים', credits),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  ShowAllList _itemsList(String label, List<PaymentMethodEntity> items) {
    return ShowAllList(
        label: label,
        items: items
            .map((coupon) => BaseTile(
                  child: Text('₪${coupon.balance.toString()}'),
                ))
            .toList(),
        onTapShowAll: () {});
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
