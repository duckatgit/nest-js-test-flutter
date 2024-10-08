import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';

class ThemeManager {
  final themeData = ThemeData(
    brightness: Brightness.light,
    secondaryHeaderColor: const Color(0xfff2fafe),
    canvasColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black87,
    ),
    cardTheme: const CardTheme(color: Color(0xffffffff)),
    iconTheme: const IconThemeData(color: Colors.black87),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xffffffff),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.lexendDeca(
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.lexendDeca(
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.lexendDeca(
        color: Colors.black54,
      ),
      headlineMedium: GoogleFonts.ultra()
    ),
    popupMenuTheme: PopupMenuThemeData(
      textStyle: GoogleFonts.lexendDeca(
        color: Colors.black54,
      ),
      labelTextStyle: WidgetStateProperty.all(
        GoogleFonts.lexendDeca(
          color: Colors.black,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w500,
            )
        ),
      ),
    ),
    dividerColor: Colors.grey.shade400,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appColor,
      elevation: 0,
      shadowColor: Colors.grey.shade600,
      iconTheme: const IconThemeData(color: Colors.white),
      scrolledUnderElevation: 0,
      titleTextStyle: GoogleFonts.lexendDeca(
        color: Colors.black,
      ),
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
  );
}
