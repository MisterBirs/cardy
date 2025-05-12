import 'package:cardy/features/auth/application/auth_bloc.dart';
import 'package:cardy/features/auth/presentation/screens/auth_gate_screen.dart';
import 'package:cardy/features/auth/presentation/screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cardy/core/injection.dart';
import 'package:cardy/core/ui_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => getIt<AuthBloc>(),
        ),
      ],
      child: CardyApp(),
    ),
  );
}

class CardyApp extends StatelessWidget {
  const CardyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeData,
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
        home: AuthGate());
  }

  ThemeData get themeData {
    return ThemeData(
      textTheme: GoogleFonts.fredokaTextTheme().copyWith(
        displayLarge: GoogleFonts.fredoka(
          fontSize: 32.0,
          color: TEXT_COLOR_1,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: PRIMARY_FONT(
            fontSize: 28.0, color: TEXT_COLOR_2, fontWeight: FontWeight.w600),
        headlineMedium: PRIMARY_FONT(
            fontSize: 26.0, color: TEXT_COLOR_1, fontWeight: FontWeight.w400),
        headlineSmall: PRIMARY_FONT(
            fontSize: 18.0, color: TEXT_COLOR_1, fontWeight: FontWeight.w500),
        titleMedium: PRIMARY_FONT(
            fontSize: 22.0, color: TEXT_COLOR_1, fontWeight: FontWeight.w400),
        titleSmall: PRIMARY_FONT(
            fontSize: 18.0, color: TEXT_COLOR_2, fontWeight: FontWeight.w400),
        bodyMedium: PRIMARY_FONT(
            fontSize: 20.0, color: TEXT_COLOR_1, fontWeight: FontWeight.w400),
        bodySmall: PRIMARY_FONT(
            fontSize: 18.0, color: TEXT_COLOR_1, fontWeight: FontWeight.w400),
        labelMedium: PRIMARY_FONT(
            fontSize: 20.0,
            color: CONTRAST_TEXT_CORLOR,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
