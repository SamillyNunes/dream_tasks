import 'package:flutter/material.dart';

class CustomTheme{
  ThemeData darkTheme(){
    return ThemeData(
      primaryColor: Color(0xFFFFFFFF),
      fontFamily: 'Raleway',
      scaffoldBackgroundColor: Color(0xFF000000),
      accentColor: Color(0xFF0CCF4F), //cor principal textos e cor 1 do degrade
      highlightColor: Color(0xFF22BFC3), //cor secundaria fundos e cor 2 do degrade
      disabledColor: Color(0xFF7A928F),
      primaryColorDark: Color(0xFF000000),
      cardColor: Color(0xFFFFFFFF)
    );
  }

  ThemeData lightTheme(){
    return ThemeData(
      primaryColor: Color(0xFF000000),
      fontFamily: 'Raleway',
      scaffoldBackgroundColor: Color(0xFFFFFFFF),
      accentColor: Color(0xFF0CCF4F),
      highlightColor: Color(0xFF22BFC3),
      disabledColor: Color(0xFF7A928F),
      primaryColorDark: Color(0xFFFFFFFF),
      cardColor: Color.fromRGBO(220, 220, 220, 0.5)
    );
  }

  LinearGradient greenGradient(){
    return LinearGradient(
      colors: [
        Color(0xFF0CCF4F),
        Color(0xFF22BFC3),
      ]
    );
  }

  LinearGradient pinkGradient(){
    return LinearGradient(
      colors: [
        Color(0xFF513873),
        Color(0xFFD9328E)
      ]
    );
  }
}