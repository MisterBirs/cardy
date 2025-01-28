import 'package:cardy/gen/assets.gen.dart';
import 'package:cardy/ui/widgets/home_screen_app_bar.dart';
import 'package:cardy/ui/widgets/bottom_bar.dart';
import 'package:cardy/ui/widgets/floating_bottom_bar.dart';
import 'package:cardy/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _userData = {
    'balance': 1750,
  };

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            TotalBalanceTitle(balance: _userData['balance'] ?? 0),
          ],
        ),
      ),
    );
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
            style: GoogleFonts.fredoka(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: TEXT_COLOR_1),
          ),
          Text('₪$balance',
              style: GoogleFonts.fredoka(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: TEXT_COLOR_2)),
        ],
    
      ),
    );
  }
}
