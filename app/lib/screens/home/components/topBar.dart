import 'package:flutter/material.dart';
import 'package:seven_health/style/style.dart';

Container buildTopBar() {
  return Container(
        padding: EdgeInsets.only(
            top: 60.0, left: 30.0, bottom: 20.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("7Health Scanner", style: titleStyle()),
            SizedBox(height: 20.0),
            Text("Scan Code or Input Code", style: subTitleStyle()),
          ],
        ),
      );
}