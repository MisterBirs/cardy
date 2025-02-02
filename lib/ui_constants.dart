// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colors
const PRIMARY_COLOR = Color(0xFF1794FF);
const SECONDRY_COLOR = Color(0xFF8263FD);
const SHADOW_COLOR = Color.fromARGB(66, 0, 0, 0);
const TEXT_COLOR_1 = Color(0xFF353941);
const TEXT_COLOR_2 = Color(0xFF6B727F);
const ICON_COLOR = Color(0xFF49454E);
const TEXTBOX_COLOR = Color(0x29FFFFFF);
const BACKGROUND_COLOR = Color(0xFFF3F4F5);
const CONTAINER_COLOR = Color.fromARGB(86, 255, 255, 255);
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

//Fonts
const PRIMARY_FONT_FAMILY = 'Fredoka';
const primaryFont = GoogleFonts.fredoka;

//Shadows
const TEXT_SHADOW_1 = BoxShadow(
  color: SHADOW_COLOR, // color
  blurRadius: 10.0, // blur
  offset: Offset(0, 0), // x ו-y
  spreadRadius: 0.0, // spread
);

const TEXT_SHADOW_2 = [
  BoxShadow(
      color: SHADOW_COLOR,
      blurRadius: 4,
      spreadRadius: 0.5,
      offset: Offset(0, 2))
];
