import 'package:cardy/data/user_items_data.dart';
import 'package:cardy/ui/screens/init_screen.dart';
import 'package:cardy/ui/screens/item_screen.dart';
import 'package:cardy/ui/widgets/bottom_bar.dart';
import 'package:cardy/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:cardy/ui/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CardyApp());
}

class CardyApp extends StatelessWidget {
  const CardyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.fredokaTextTheme().copyWith(
          displayLarge: GoogleFonts.fredoka(
              fontSize: 32.0, color: TEXT_COLOR_1, fontWeight: FontWeight.w500),
          displayMedium: GoogleFonts.fredoka(
              fontSize: 28.0, color: TEXT_COLOR_2, fontWeight: FontWeight.w600),
          titleMedium: GoogleFonts.fredoka(
              fontSize: 22.0, color: TEXT_COLOR_1, fontWeight: FontWeight.w400),
          titleSmall: GoogleFonts.fredoka(
              fontSize: 18.0, color: TEXT_COLOR_2, fontWeight: FontWeight.w400),
          bodyMedium: GoogleFonts.fredoka(
              fontSize: 20.0, color: TEXT_COLOR_1, fontWeight: FontWeight.w400),
          labelMedium: GoogleFonts.fredoka(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w400),
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
        return Directionality(
          textDirection: TextDirection.rtl, // מכריח RTL
          child: child!,
        );
      },
      home: InitScreen(),
    );
  }
}
