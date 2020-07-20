import 'package:flutter/material.dart';
import 'package:seven_health/style/style.dart';

getAppBar(String title, {bool showBackArrow = true}) {
  return AppBar(
    title: Text(title),
    backgroundColor: primary,
    centerTitle: true,
    automaticallyImplyLeading: showBackArrow,
  );
}
