import 'package:flutter/material.dart';
import 'package:seven_health/screens/home/components/body.dart';
import 'package:seven_health/style/style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: buildBody(context),
    );
  }
}
