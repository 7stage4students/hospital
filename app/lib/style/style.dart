import 'package:flutter/material.dart';

final primary = const Color(0xFF00AB9F);
final secondary = const Color(0xFF52898B);
final tertiary = const Color(0xFFF89623);
final bgColor = const Color(0xFF273742);

final greyBackground = const Color.fromRGBO(249, 252, 255, 1);
final greyBorder = const Color.fromRGBO(207, 207, 207, 1);

//--------------------------- Theme data ----------------------------

ThemeData getTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'rubik',
  );
}

//--------------------------- screen height & width ----------------------------

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

//----------------------------- text-styles sans Regular ------------------

TextStyle name() {
  return TextStyle();
}

TextStyle titleStyle() {
  return TextStyle(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

TextStyle subTitleStyle() {
  return TextStyle(
    fontSize: 16,
    color: Colors.white.withOpacity(0.9),
    fontWeight: FontWeight.w600,
  );
}

TextStyle textSyle() {
  return TextStyle(
    fontSize: 18.0,
    color: bgColor,
    fontWeight: FontWeight.w600,
  );
}

TextStyle scanStyle() {
  return TextStyle(fontSize: 16, color: tertiary, fontWeight: FontWeight.w600);
}

TextStyle btnTextStyle() {
  return TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );
}

TextStyle ggleBtn() {
  return TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  );
}
