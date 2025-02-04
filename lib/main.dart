import 'package:cardy/data/payments_methods_data.dart';
import 'package:cardy/ui/screens/init_screen/init_screen.dart';
import 'package:cardy/ui/screens/show_all_stores_screen/show_all_stores_screen.dart';
import 'package:cardy/ui/ui_constants.dart';
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
    );
  }
}
