import 'package:cosmetics/core/style/app_colors.dart';
import 'package:flutter/material.dart'; 

class AppTheme {
  static bool dTheme = false;
  static ThemeMode currentTheme = ThemeMode.light;
  static ThemeData lightTheme = ThemeData(
    fontFamily: "montserrat",
        scaffoldBackgroundColor: AppColors.background,
    //  primaryColor: ColorsManager.white,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: AppColors.white,
    //   elevation: 0,
    //   centerTitle: true,
    //   titleTextStyle: TextStyle(
    //     fontFamily: "montserrat",
    //     color: AppColors.black,
    //     fontSize: 19,
    //     fontWeight: FontWeight.w700,
    //   ),
    //   iconTheme: IconThemeData(
    //     color: AppColors.primary,
    //   ),
    // ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.secondary,
        fontWeight: FontWeight.w700,
        fontFamily: "montserrat",
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: AppColors.secondary,
        fontWeight: FontWeight.w600,
        fontFamily: "montserrat",
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: AppColors.hint_text,
        fontWeight: FontWeight.normal,
        fontFamily: "montserrat",
        fontSize: 14,
      ),
    ),
  );
  //-------------------------------------------------------------------------------------------------
  static ThemeData darkTheme = ThemeData(
    fontFamily: "montserrat",
    scaffoldBackgroundColor: AppColors.black,
    //  primaryColor: ColorsManager.white,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: AppColors.black,
    //   elevation: 0,
    //   centerTitle: true,
    //   titleTextStyle: TextStyle(
    //     color: AppColors.white,
    //     fontSize: 19.sp,
    //     fontWeight: FontWeight.w700,
    //   ),
    //   iconTheme: IconThemeData(
    //     color: AppColors.white,
    //   ),
    // ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.white,
        fontFamily: "montserrat",
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontFamily: "montserrat",
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      titleSmall: TextStyle(
        color: AppColors.hint_text,
        fontFamily: "montserrat",
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    ),
  );
}
