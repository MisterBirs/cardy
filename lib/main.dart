import 'package:cardy/data/user_items_data.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/ui/screens/base_show_all_screen.dart';
import 'package:cardy/ui/screens/init_screen/init_screen.dart';
import 'package:cardy/ui/screens/store_screen.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/item_tiles/item_balance_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CardyApp());
}

class CardyApp extends StatelessWidget {
  const CardyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.fredokaTextTheme().copyWith(
          displayLarge: GoogleFonts.fredoka(
            fontSize: 32.0,
            color: TEXT_COLOR_1,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: GoogleFonts.fredoka(
              fontSize: 28.0, color: TEXT_COLOR_2, fontWeight: FontWeight.w600),
          headlineMedium: GoogleFonts.fredoka(
              fontSize: 26.0, color: TEXT_COLOR_1, fontWeight: FontWeight.w400),
          headlineSmall: GoogleFonts.fredoka(
              fontSize: 18.0, color: TEXT_COLOR_1, fontWeight: FontWeight.w500),
          titleMedium: GoogleFonts.fredoka(
              fontSize: 22.0, color: TEXT_COLOR_1, fontWeight: FontWeight.w400),
          titleSmall: GoogleFonts.fredoka(
              fontSize: 18.0, color: TEXT_COLOR_2, fontWeight: FontWeight.w400),
          bodyMedium: GoogleFonts.fredoka(
              fontSize: 20.0, color: TEXT_COLOR_1, fontWeight: FontWeight.w400),
          labelMedium: GoogleFonts.fredoka(
              fontSize: 20.0,
              color: CONTRAST_TEXT_CORLOR,
              fontWeight: FontWeight.w400),
        ),
      ),
      debugShowCheckedModeBanner: false,
      locale: const Locale('he', 'IL'), // הגדרת הלוקל כעברית
      supportedLocales: const [
        Locale('en', 'US'), // אנגלית
        Locale('he', 'IL'), // עברית
        Locale('ar', 'AE'), // ערבית
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler:
                TextScaler.noScaling, // מונע שינויי גודל טקסט ע"י המשתמש
          ),
          child: Directionality(
            textDirection: TextDirection.rtl, // מכריח RTL לכל האפליקציה
            child: child!,
          ),
        );
      },
       home: InitScreen(),

      // home: BaseShowAllScreen(
      //   itemWidth: BASE_ITEM_TILE_SIZE,
      //   itemHeight: BASE_ITEM_TILE_SIZE + 30,
      //   appBar: BackAppBar(title: 'חנויות', showBackButton: true),
      //   items: UserItemsData.instance.coupons.values
      //       .map((coupon) => ItemTileBuilder(
      //             alias: coupon.type.aliases,
      //             amount: coupon.balance,
      //             categories: coupon.type.categories,
      //             tile: StoreBalanceTile(
      //               width: BASE_ITEM_TILE_SIZE,
      //               height: BASE_ITEM_TILE_SIZE + 30,
      //               store: coupon.type as StoreEntity,
      //               balance: coupon.balance,
      //             ),
      //           ))
      //       .toList(),
      // ),

      //  home: BaseShowAllScreen(
      //   itemWidth: BASE_ITEM_TILE_SIZE,
      //   itemHeight: BASE_ITEM_TILE_SIZE + 30,
      //   appBar: BackAppBar(title: 'חנויות', showBackButton: true),
      //   items: UserItemsData.instance.userStores.values
      //       .map((storeSum) => ItemTileBuilder(
      //             alias: storeSum.store.aliases,
      //             amount: storeSum.totalBalance,
      //             categories: storeSum.store.categories,
      //             tile: StoreBalanceTile(
      //               width: BASE_ITEM_TILE_SIZE,
      //               height: BASE_ITEM_TILE_SIZE + 30,
      //               store: storeSum.store,
      //               balance: storeSum.totalBalance,
      //             ),
      //           ))
      //     .toList(),)

      // home: BaseShowAllScreen(
      //   itemWidth: BASE_ITEM_TILE_SIZE,
      //   itemHeight: BASE_ITEM_TILE_SIZE,
      //   appBar: BackAppBar(title: 'חנויות', showBackButton: true),
      //   items: UserItemsData.instance.userStores.values
      //       .map((store) => ItemTileBuilder(
      //             alias: store.store.aliases,
      //             amount: store.totalBalance,
      //             categories: store.store.categories,
      //             tile: ItemTile.type(
      //               store.store,
      //             ),
      //           ))
      //       .toList(),
      // ),

      //       home: BaseShowAllScreen(
      //   itemHeight: BASE_ITEM_TILE_SIZE,
      //   itemWidth: BASE_ITEM_TILE_SIZE * SQUARE_CARD_RATIO,
      //   appBar: BackAppBar(title: 'חנויות', showBackButton: true),
      //   items: UserItemsData.instance.giftcards.values
      //       .map((giftCard) => ItemTileBuilder(
      //             alias: giftCard.type.aliases,
      //             amount: giftCard.balance,
      //             categories: giftCard.type.categories,
      //             tile: ItemTile.type(
      //               giftCard.type,
      //             ),
      //           ))
      //       .toList(),
      // ),
    );
  }
}
