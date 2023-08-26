import 'package:flutter/material.dart';

class ThemeUtils {
  static ThemeData appdTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    cardColor: AppColors.whiteColor,
    disabledColor: AppColors.disabledButtonColor,
    hintColor: AppColors.textExtraLight,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    fontFamily: 'Poppins', // Default font family
    textTheme: const TextTheme(
      labelSmall: TextStyle(
        fontFamily: 'Poppins-Light',
        color: AppColors.textLightGray,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Poppins-Medium',
        color: AppColors.primaryTextGray,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Poppins-SemiBold',
        color: AppColors.whiteColor,
        fontSize: 12,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Poppins-Regular',
        color: AppColors.primaryTextGray,
        fontSize: 15,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Poppins-SemiBold',
        fontSize: 27,
        fontWeight: FontWeight.w600,
        height: 2,
        color: AppColors.textDark,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Urbanist-Regular',
        fontSize: 17,
        fontWeight: FontWeight.w400,

        height: 1.3,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryButtonColor,
      foregroundColor: AppColors.whiteColor,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          AppColors.primaryButtonColor,
        ),
      ),
    ),
  );
}

class AppColors {
  static const primaryTextGray = Color(0xFF424242);
  static const textLightGray = Color(0xFF7D7D7D);
  static const textDark = Color(0xFF000000);
  static const textExtraLight = Color(0xFF9A9494);

  static const primaryButtonColor = Color(0xFF669AFF);
  static const disabledButtonColor = Color(0xFF5E5F6F);

  static const whiteColor = Colors.white;
  static const primaryColor = Color(0xFFF8FAFF);

  static const iconGrey = Colors.grey;
}
