import 'package:flutter/material.dart';
import 'package:studentmanagement/components/app_bar.dart';
import 'package:studentmanagement/style/style.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: getAppBar("Error Occured"),
          backgroundColor: bgColor,
          body: Center(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Error Occurred. Invalid QR Code",
                    style: textSyle(),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
