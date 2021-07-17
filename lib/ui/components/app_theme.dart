import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  const primaryColor = Color(0xff0064C3);
  const primaryColorDark = Color.fromRGBO(0, 105, 153, 1);
  const secondaryColorDark = Color.fromRGBO(0, 37, 26, 1);
  const primaryColorLight = Color.fromRGBO(128, 215, 255, 1);
  const disabledColor = Color.fromRGBO(170, 170, 170, 1);
  const inputDecorationTheme = InputDecorationTheme(
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: primaryColorLight)),
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
  );
  final buttonTheme = ButtonThemeData(
      colorScheme: const ColorScheme.light(primary: primaryColor),
      buttonColor: primaryColor,
      splashColor: primaryColorLight,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
  return ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      disabledColor: disabledColor,
      primaryColorLight: primaryColorLight,
      secondaryHeaderColor: secondaryColorDark,
      accentColor: primaryColor,
      backgroundColor: Colors.white,
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: primaryColorDark),
      ),
      inputDecorationTheme: inputDecorationTheme,
      buttonTheme: buttonTheme);
}
