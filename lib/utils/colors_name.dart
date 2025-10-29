import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    // fontFamily: TempStorage.shared.appLocale == 'en' ? 'SFPRODISPLAY' : 'dubai',
    drawerTheme: const DrawerThemeData(
      backgroundColor: appBlack,
      surfaceTintColor: appWhite,
      shadowColor: appWhite,
    ),
    primaryColor: appBlack,
    secondaryHeaderColor: appWhite,
    iconTheme: const IconThemeData(color: appBlack),
    brightness: Brightness.dark,
    buttonTheme: const ButtonThemeData(
      buttonColor: appWhite,
      textTheme: ButtonTextTheme.primary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    scaffoldBackgroundColor: appBlack,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          // fontFamily:
          //     TempStorage.shared.appLocale == 'en' ? 'SFPRODISPLAY' : 'dubai',
        ),
        backgroundColor: appWhite, // Button background color
        foregroundColor: appBlack,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    // textButtonTheme: TextButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     textStyle: TextStyle(
    //       // fontFamily:
    //       //     TempStorage.shared.appLocale == 'en' ? 'SFPRODISPLAY' : 'dubai',
    //     ),
    //     backgroundColor: appBlack, // Button background color
    //     foregroundColor: appWhite,
    //   ),
    // ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: appBlack),
      labelStyle: TextStyle(color: appWhite),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      textStyle: TextStyle(color: appWhite),
    ),
    dialogBackgroundColor: appWhite,
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: appWhite),
      displayMedium: TextStyle(color: appWhite),
      displaySmall: TextStyle(color: appWhite),
      headlineLarge: TextStyle(color: appWhite),
      headlineMedium: TextStyle(color: appWhite),
      headlineSmall: TextStyle(color: appWhite),
      titleLarge: TextStyle(color: appWhite),
      titleMedium: TextStyle(color: appWhite),
      titleSmall: TextStyle(color: appWhite),
      bodyLarge: TextStyle(color: appWhite),
      bodyMedium: TextStyle(color: appWhite),
      bodySmall: TextStyle(color: appWhite),
      labelLarge: TextStyle(color: appWhite),
      labelMedium: TextStyle(color: appWhite),
      labelSmall: TextStyle(color: appWhite),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: appWhite,
      unselectedItemColor: appGray,
      elevation: 10,
      type: BottomNavigationBarType.fixed,
      backgroundColor: appDarkGray,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all<Color>(appDarkGray),
      checkColor: WidgetStateProperty.all<Color>(appWhite),
      overlayColor: WidgetStateProperty.all<Color>(appWhite),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all<Color>(appWhite),
      // Uncomment if needed
      trackColor: WidgetStateProperty.all<Color>(appBlack),
      trackOutlineColor: WidgetStateProperty.all<Color>(appWhite),
      trackOutlineWidth: WidgetStateProperty.all<double>(2.0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      mouseCursor: WidgetStateProperty.all<MouseCursor?>(
        SystemMouseCursors.click,
      ),
      overlayColor: WidgetStateProperty.all<Color?>(appBlack.withOpacity(0.2)),
      splashRadius: 4,
      thumbIcon: WidgetStateProperty.all<Icon>(const Icon(Icons.circle)),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: appGray,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: appBlack, width: 0.1),
      ),
      shadowColor: appBlack,
      elevation: 5,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: appBlack,
      linearTrackColor: appBlack,
      circularTrackColor: appBlack,
      refreshBackgroundColor: appLightGray,
    ),
  );

  static final lightTheme = ThemeData(
    // fontFamily:
    //     TempStorage.shared.appLocale == 'en' ? 'SFPRODISPLAY' : 'dubai',
    drawerTheme: const DrawerThemeData(
      backgroundColor: appWhite,
      surfaceTintColor: appBlack,
      shadowColor: appBlack,
    ),
    primaryColor: appWhite,
    secondaryHeaderColor: appBlack,
    iconTheme: const IconThemeData(color: appBlack),
    brightness: Brightness.light,
    buttonTheme: const ButtonThemeData(
      buttonColor: appBlack,
      textTheme: ButtonTextTheme.primary,
    ),
    scaffoldBackgroundColor: appWhite,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          // fontFamily:
          //     TempStorage.shared.appLocale == 'en' ? 'SFPRODISPLAY' : 'dubai',
        ),
        backgroundColor: appBlack, // Button background color
        foregroundColor: appWhite,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    cardTheme: const CardThemeData(color: appWhite, elevation: 1),
    // textButtonTheme: TextButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     textStyle: TextStyle(
    //       // fontFamily:
    //       //     TempStorage.shared.appLocale == 'en' ? 'SFPRODISPLAY' : 'dubai',
    //     ),
    //     backgroundColor: appWhite, // Button background color
    //     foregroundColor: appBlack,
    //   ),
    // ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: appWhite),
      labelStyle: TextStyle(color: appBlack),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      textStyle: TextStyle(color: appBlack),
    ),
    dialogBackgroundColor: appBlack,
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: appBlack),
      displayMedium: TextStyle(color: appBlack),
      displaySmall: TextStyle(color: appBlack),
      headlineLarge: TextStyle(color: appBlack),
      headlineMedium: TextStyle(color: appBlack),
      headlineSmall: TextStyle(color: appBlack),
      titleLarge: TextStyle(color: appBlack),
      titleMedium: TextStyle(color: appBlack),
      titleSmall: TextStyle(color: appBlack),
      bodyLarge: TextStyle(color: appBlack),
      bodyMedium: TextStyle(color: appBlack),
      bodySmall: TextStyle(color: appBlack),
      labelLarge: TextStyle(color: appBlack),
      labelMedium: TextStyle(color: appBlack),
      labelSmall: TextStyle(color: appBlack),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: appBlack,
      unselectedItemColor: appGray,
      elevation: 10,
      type: BottomNavigationBarType.fixed,
      backgroundColor: appWhite,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all<Color>(appDarkGray),
      checkColor: WidgetStateProperty.all<Color>(appWhite),
      overlayColor: WidgetStateProperty.all<Color>(appWhite),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all<Color>(appBlack),
      // Uncomment if needed
      trackColor: WidgetStateProperty.all<Color>(
        appWhite,
      ), // Uncomment if needed
      trackOutlineColor: WidgetStateProperty.all<Color>(
        appBlack,
      ), // Uncomment if needed
      trackOutlineWidth: WidgetStateProperty.all<double>(2.0), // Example
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Example
      mouseCursor: WidgetStateProperty.all<MouseCursor?>(
        SystemMouseCursors.click,
      ), // Example
      overlayColor: WidgetStateProperty.all<Color?>(
        appBlack.withOpacity(0.2),
      ), // Example
      splashRadius: 4, // Example
      thumbIcon: WidgetStateProperty.all<Icon>(const Icon(Icons.circle)),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: appWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: appBlack, width: 0.1),
      ),
      shadowColor: appBlack,
      elevation: 5,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: appBlack,
      linearTrackColor: appBlack,
      circularTrackColor: appBlack,
      refreshBackgroundColor: appLightGray,
    ),
  );
}

const appBlack = Colors.black;
const appWhite = Colors.white;
const appGray = Color(0xFF555555);
const appBlue = Color(0xFF0866FF);
const appDimGray = Color(0xFF555555);
const appAmber = Colors.amber;
const appLightGray = Color(0xFFF5F5F5);
const appDarkGray = Color(0xFF2D2D2D);
const appPurple = Color(0xFF8C69BE);
//
const applightGray = Color(0xFFEEEEEE);
const appDarkRed = Color(0xFFD94242);
const appLightPeach = Color(0xFFFFF6E4);
const appRed = Color(0xFFD94242);
const applightRed = Color(0xFFEF9A9A);
const appLightGreen = Color(0xFF72E37D);
const appGreen = Color.fromARGB(255, 61, 231, 154);
const appDarkGreen = Color(0xFF165e3d);
const appgray = Color(0xFF6D6D6D);
const appLightBlueGray = Color(0xFFD9EDF1);
const appAqua = Color(0xFF6CD9EB);
const appPeach = Color(0xFFFAD7A0);
const appYellow = Color(0xFFFFF9C4);

final appThemeColor = Get.isDarkMode ? appWhite : appBlack;

Color appThemeColorUsingTheme(isDark) => isDark ? appWhite : appBlack;
Color appThemeColorUsingThemeFlip(isDark) => isDark ? appBlack : appWhite;
