import 'package:cardy/data/user_items_data.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/screens/home_screen/home_screen_widgets/items_list.dart';
import 'package:cardy/ui/screens/home_screen/home_screen_widgets/home_screen_app_bar.dart';
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
        ItemsList(
            label: 'גיפטקארדים',
            items: UserItemsData.instance.giftcards.values.toList(),
            onTapShowAll: () {}),
        ItemsList(
            label: 'כרטיסים נטענים',
            items: UserItemsData.instance.reloadableCards.values.toList(),
            onTapShowAll: () {}),
        ItemsList(
            label: 'קופונים',
            items: UserItemsData.instance.coupons.values.toList(),
            onTapShowAll: () {}),
        ItemsList(
            label: 'זיכויים',
            items: UserItemsData.instance.credits.values.toList(),
            onTapShowAll: () {}),
      ],
    );
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
