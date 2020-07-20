import 'package:flutter/material.dart';
import 'package:seven_health/screens/check_code/check_code.dart';
import 'package:seven_health/screens/home/home_screen.dart';
import 'package:seven_health/screens/insert_code/insert_code_screen.dart';
import 'package:seven_health/screens/manage/manage_screen.dart';
import 'package:seven_health/screens/not_found/not_found_screen.dart';

import 'package:seven_health/screens/scan_code/scan_code_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(settings:RouteSettings(name: "/"),builder: (_) => HomeScreen());
        break;
      case "/notFound":
        return MaterialPageRoute(builder: (_) => NotFoundScreen());
        break;
      case "/insertCode":
        return MaterialPageRoute(builder: (_) => InsertCodeScreen());
        break;
      case "/scanCode":
        return MaterialPageRoute( settings: RouteSettings(name: "/scanCode"),
        builder: (_) => ScanCodeScreen());
        break;
      case "/manage":
        return MaterialPageRoute(builder: (_) => ManageScreen(data: args));
        break;
      case "/checkCode":
        if (args is String)
          return MaterialPageRoute(settings:RouteSettings(name: "/checkCode"),builder: (_) => CheckCodeScreen(code: args));
        break;

      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
