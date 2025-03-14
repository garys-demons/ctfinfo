import 'package:flutter/material.dart';
import 'package:ctfinfo/style/pallet.dart';

class CustomTheme {
  static final underlineBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Pallet.greenColour,
      width: 2.0,
    ),
  );

  static final errorUnderlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(
    color: Pallet.errorColour,
    width: 2.0,
  ));

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Pallet.greenColour,
      fontFamily: "Tomorrow",
      scaffoldBackgroundColor: Pallet.blackColour,
      textTheme: TextTheme(
        titleLarge: const TextStyle(
          //for start and end date etc etc.
          color: Pallet.greenColour,
          fontSize: 17,
          fontWeight: FontWeight.w700,
          fontFamily: "Tomorrow",
        ),
        titleMedium: const TextStyle(
          //EG: points- 123.4567890
          color: Pallet.greenColour,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "Tomorrow",
        ),
        bodyMedium: const TextStyle(
          //EG: "team id", "average weight"
          fontSize: 19,
          color: Pallet.greenColour,
          fontWeight: FontWeight.bold,
          fontFamily: "Tomorrow",
        ),
        headlineLarge: const TextStyle(
          //for headings
          fontSize: 46.0,
          color: Pallet.greenColour,
          fontWeight: FontWeight.normal,
          fontFamily: "Tomorrow",
        ),
        headlineMedium: const TextStyle(
          //for evens/team details/name
          fontSize: 26,
          color: Pallet.greenColour,
          fontWeight: FontWeight.normal,
          fontFamily: "Tomorrow",
        ),
        headlineSmall: const TextStyle(
          //for evens/team details/name
          fontSize: 20,
          color: Pallet.greenColour,
          fontWeight: FontWeight.bold,
          fontFamily: "Tomorrow",
        ),
        bodyLarge: const TextStyle(
          //for evens/team details/name
          fontSize: 16,
          color: Pallet.greenColour,

          fontFamily: "Tomorrow",
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          fontSize: 20.0,
          color: Pallet.greenColour,
        ),
        errorStyle: TextStyle(
          fontSize: 15.0,
          color: Pallet.errorColour,
        ),
        isDense: true,
        focusedBorder: underlineBorder,
        enabledBorder: underlineBorder,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            foregroundColor: Pallet.blackColour,
            backgroundColor: Pallet.greenColour,
            elevation: 0,
            textStyle: const TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
