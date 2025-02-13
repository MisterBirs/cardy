// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colors
const PRIMARY_COLOR = Color(0xFF1794FF);
const SECONDRY_COLOR = Color(0xFF8263FD);
const SHADOW_COLOR = Color.fromARGB(66, 0, 0, 0);
const TEXT_COLOR_1 = Color(0xFF353941);
const TEXT_COLOR_2 = Color(0xFF6B727F);
const CONTRAST_TEXT_CORLOR = Colors.white;
const ICON_COLOR = Color(0xFF49454E);
const TEXTBOX_COLOR = Color(0x29FFFFFF);
const BACKGROUND_COLOR = Color(0xFFF3F4F5);
const CONTAINER_COLOR = Colors.white;
const GRADIENT_COLOR = LinearGradient(
  colors: [PRIMARY_COLOR, SECONDRY_COLOR],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
const GRADIENT_COLOR_REVERSE = LinearGradient(
  colors: [SECONDRY_COLOR, PRIMARY_COLOR],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

//Sizes
const ICON_SIZE = 30.0;
const SQUARE_CARD_RATIO = 1.585;
const SCREEN_HORIZONTAL_PADDING = 20.0;
const PADDING_FROM_TOP_SCREEN = 30.0;
const CONTAINER_HORIZONTAL_PADDING = 15.0;
const APP_BAR_TOP_SPACING = kToolbarHeight + 15.0;
const BASE_ITEM_TILE_SIZE = 100.0;
const BASE_CARD_WIDTH = BASE_ITEM_TILE_SIZE * SQUARE_CARD_RATIO;


//Fonts
const PRIMARY_FONT_FAMILY = 'Fredoka';
const primaryFont = GoogleFonts.fredoka;

//Shadows
const SHADOW = [
  BoxShadow(
      color: SHADOW_COLOR,
      blurRadius: 4,
      spreadRadius: 0.5,
      offset: Offset(0, 2))
];

double getScaleSize(BuildContext context,double size) {
  final baseScreenWidth = 460.0;
  final screenWidth = MediaQuery.of(context).size.width;
  final scaleFactor = screenWidth / baseScreenWidth;
  final newFontSize = scaleFactor*size;
  return newFontSize;
}
