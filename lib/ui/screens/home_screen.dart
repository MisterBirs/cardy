import 'package:cardy/gen/assets.gen.dart';
import 'package:cardy/ui/widgets/items_list.dart';
import 'package:cardy/ui/widgets/home_screen_app_bar.dart';
import 'package:cardy/ui/widgets/bottom_bar.dart';
import 'package:cardy/ui/widgets/floating_bottom_bar.dart';
import 'package:cardy/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentItem {
  final String image;
  final int amount;

  PaymentItem(this.image, this.amount);
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const _userData = {
    'balance': 1750,
  };

  final List<PaymentItem> gift_cards = [
    PaymentItem(Assets.images.items.giftcards.buymeallGiftcard.path, 100),
    PaymentItem(Assets.images.items.giftcards.dreamcardGiftcard.path, 280),
    PaymentItem(Assets.images.items.giftcards.gavekortGiftcard.path, 500),
    PaymentItem(Assets.images.items.giftcards.giftzozeGiftcard.path, 120),
    PaymentItem(Assets.images.items.giftcards.loveGiftcard.path, 400),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.screenBackground.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: HomeScreenAppBar(),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                TotalBalanceTitle(balance: _userData['balance']!),
                ItemsList(
                    label: 'גיפטקארדים',
                    items: gift_cards,
                    onTapShowAll: () {}),
              ],
            ),
          ),
        ));
  }
}


class TotalBalanceTitle extends StatelessWidget {
  final int balance;
  const TotalBalanceTitle({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'יתרה כוללת',
            style: primaryFont(
                fontSize: 32, fontWeight: FontWeight.w500, color: TEXT_COLOR_1),
          ),
          Text('₪$balance',
              style: primaryFont(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: TEXT_COLOR_2)),
        ],
      ),
    );
  }
}
