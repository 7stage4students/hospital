import 'package:flutter/material.dart';
import 'package:studentmanagement/style/style.dart';

getAppBar(String title) {
  return AppBar(
    title: Text(title),
    backgroundColor: primary,
    centerTitle: true,
  );
}
