import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Color primaryBlue = Color(0xff2972ff);
Color textBlack = Color(0xff222222);
Color textGrey = Color(0xff94959b);
Color buttonColor = Color.fromARGB(255, 232, 77, 66);

Color primaryColor = Color.fromARGB(255, 244, 67, 54);

class AppColors {
  static HexColor kBgColor = HexColor('e7ded7');
  static HexColor kGreyColor = HexColor('dcdde2');
  static HexColor kSmProductBgColor = HexColor('f9f9f9');
}




class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    // Define your light theme colors, typography, etc.
    // Example:
    primaryColor: Colors.blue,
    // accentColor: Colors.blueAccent,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    // Define your dark theme colors, typography, etc.
    // Example:
    primaryColor: Colors.indigo,
    // accentColor: Colors.indigoAccent,
  );
}
