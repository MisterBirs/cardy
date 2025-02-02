import 'package:cardy/data/user_items_data.dart';
import 'package:cardy/ui/screens/init_screen.dart';
import 'package:cardy/ui/screens/item_screen.dart';
import 'package:cardy/ui/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:cardy/ui/screens/home_screen.dart';

void main() {
  runApp(CardyApp());
}

class CardyApp extends StatelessWidget {

   const CardyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          return Directionality(
            textDirection: TextDirection.rtl, // מכריח RTL
            child: child!,
          );
        },
      home: ItemScreen(item: UserItemsData.giftcards['gf0001']!,),
   
    );
  }
}
