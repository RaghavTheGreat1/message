import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message/themes/colors.dart';

/// Reference to the application theme.
abstract class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        accentColor: accentColor,
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.mulishTextTheme().apply(bodyColor: AppColors.textDark),
        backgroundColor: LightColors.background,
        scaffoldBackgroundColor: LightColors.background,
        cardColor: LightColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textDark),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconDark),
        appBarTheme: AppBarTheme(
          iconTheme: ThemeData.light().iconTheme,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: AppColors.textDark,
          ),
        ),
      );

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        accentColor: accentColor,
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.interTextTheme().apply(bodyColor: AppColors.textLigth),
        backgroundColor: DarkColors.background,
        scaffoldBackgroundColor: DarkColors.background,
        cardColor: DarkColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textLigth),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconLight),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          iconTheme: ThemeData.dark().iconTheme,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: AppColors.textLigth,
          ),
        ),
      );
}
