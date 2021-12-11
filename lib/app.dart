import 'package:flutter/material.dart';
import 'package:xico/core/resources/styles/custom_colors.dart';
import 'package:xico/core/router.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xico',
      theme: _theme,
      debugShowCheckedModeBanner: false,
      initialRoute: "splashscreen",
      onGenerateRoute: RouterFluro.router.generator,
    );
  }

  static ThemeData get _theme {
    return ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      primaryColorBrightness: Brightness.dark,
      buttonTheme: ButtonThemeData(
        buttonColor: secondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      cardColor: secondaryColor,
      scaffoldBackgroundColor: backgroundColor,
      backgroundColor: backgroundColor,
      textTheme: TextTheme(
        headline1: TextStyle(color: primaryColor),
        bodyText1: TextStyle(color: textColor1),
        bodyText2: TextStyle(color: textColor2),
      ),
    );
  }
}
